<?php

/**
 * Copyright (c) 2013 Robin Appelman <icewind@owncloud.com>
 * This file is licensed under the Affero General Public License version 3 or
 * later.
 * See the COPYING-README file.
 */

namespace OC\User;

use OC\Hooks\PublicEmitter;
use OCP\IUserManager;
use OCP\IConfig;
use OC_DB;

/**
 * Class Manager
 *
 * Hooks available in scope \OC\User:
 * - preSetPassword(\OC\User\User $user, string $password, string $recoverPassword)
 * - postSetPassword(\OC\User\User $user, string $password, string $recoverPassword)
 * - preDelete(\OC\User\User $user)
 * - postDelete(\OC\User\User $user)
 * - preCreateUser(string $uid, string $password)
 * - postCreateUser(\OC\User\User $user, string $password)
 *
 * @package OC\User
 */
class Manager extends PublicEmitter implements IUserManager {
    /**
     * @var \OCP\UserInterface [] $backends
     */
    private $backends = array();

    /**
     * @var \OC\User\User[] $cachedUsers
     */
    private $cachedUsers = array();

    /**
     * @var \OCP\IConfig $config
     */
    private $config;

    /**
     * @param \OCP\IConfig $config
     */
    public function __construct(IConfig $config = null) {
        $this->config = $config;
        $cachedUsers = &$this->cachedUsers;
        $this->listen('\OC\User', 'postDelete', function ($user) use (&$cachedUsers) {
            /** @var \OC\User\User $user */
            unset($cachedUsers[$user->getUID()]);
        });
        $this->listen('\OC\User', 'postLogin', function ($user) {
            /** @var \OC\User\User $user */
            $user->updateLastLoginTimestamp();
        });
        $this->listen('\OC\User', 'postRememberedLogin', function ($user) {
            /** @var \OC\User\User $user */
            $user->updateLastLoginTimestamp();
        });
    }

    /**
     * Get the active backends
     * @return \OCP\UserInterface[]
     */
    public function getBackends() {
        return $this->backends;
    }

    /**
     * register a user backend
     *
     * @param \OCP\UserInterface $backend
     */
    public function registerBackend($backend) {
        $this->backends[] = $backend;
    }

    /**
     * remove a user backend
     *
     * @param \OCP\UserInterface $backend
     */
    public function removeBackend($backend) {
        $this->cachedUsers = array();
        if (($i = array_search($backend, $this->backends)) !== false) {
            unset($this->backends[$i]);
        }
    }

    /**
     * remove all user backends
     */
    public function clearBackends() {
        $this->cachedUsers = array();
        $this->backends = array();
    }

    /**
     * get a user by user id
     *
     * @param string $uid
     * @return \OC\User\User
     */
    public function get($uid) {
        if (isset($this->cachedUsers[$uid])) { //check the cache first to prevent having to loop over the backends
            return $this->cachedUsers[$uid];
        }
        foreach ($this->backends as $backend) {
            if ($backend->userExists($uid)) {
                return $this->getUserObject($uid, $backend);
            }
        }
        return null;
    }

    /**
     * get or construct the user object
     *
     * @param string $uid
     * @param \OCP\UserInterface $backend
     * @return \OC\User\User
     */
    protected function getUserObject($uid, $backend) {

        if (isset($this->cachedUsers[$uid])) {
            return $this->cachedUsers[$uid];
        }
        $this->cachedUsers[$uid] = new User($uid, $backend, $this, $this->config);
        return $this->cachedUsers[$uid];
    }

    /**
     * check if a user exists
     *
     * @param string $uid
     * @return bool
     */
    public function userExists($uid) {
        $user = $this->get($uid);
        return ($user !== null);
    }

    /**
     * Check if the password is valid for the user
     *
     * @param string $loginname
     * @param string $password
     * @return mixed the User object on success, false otherwise
     */
    public function checkPassword($loginname, $password) {
        $loginname = str_replace("\0", '', $loginname);
        $password = str_replace("\0", '', $password);



        $userExists  = OC_DB::executeAudited(
            'SELECT count(*) as countUser FROM `Users`'
            . ' WHERE `uName` = ?',
            array($loginname)
        )->fetchRow();
        if($userExists['countUser']==1) {
            $user = OC_DB::executeAudited(
                'SELECT * FROM `Users`'
                . ' WHERE `uName` = ?',
                array($loginname)
            )->fetchRow();
            $Hasher = new PasswordHash(8, false);

            if ($Hasher->CheckPassword($password, $user['uPassword'])) {

                $uid = mb_strtolower($loginname);
                return $this->getUserObject($uid, $this->backends[count($this->backends) - 1]);
            }else{
                $remoteAddr = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
                $forwardedFor = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : '';

                \OC::$server->getLogger()->warning('Login failed: \'' . $loginname . '\' (Remote IP: \'' . $remoteAddr . '\', X-Forwarded-For: \'' . $forwardedFor . '\')', array('app' => 'core'));
                return false;
            }
        }else {

            foreach ($this->backends as $backend) {
                if ($backend->implementsActions(\OC_User_Backend::CHECK_PASSWORD)) {
                    $uid = $backend->checkPassword($loginname, $password);
                    if ($uid !== false) {
                        return $this->getUserObject($uid, $backend);
                    }
                }
            }


            $remoteAddr = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
            $forwardedFor = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : '';

            \OC::$server->getLogger()->warning('Login failed: \'' . $loginname . '\' (Remote IP: \'' . $remoteAddr . '\', X-Forwarded-For: \'' . $forwardedFor . '\')', array('app' => 'core'));
            return false;
        }
    }

    /**
     * search by user id
     *
     * @param string $pattern
     * @param int $limit
     * @param int $offset
     * @return \OC\User\User[]
     */
    public function search($pattern, $limit = null, $offset = null) {
        $users = array();
        foreach ($this->backends as $backend) {
            $backendUsers = $backend->getUsers($pattern, $limit, $offset);
            if (is_array($backendUsers)) {
                foreach ($backendUsers as $uid) {
                    $users[$uid] = $this->getUserObject($uid, $backend);
                }
            }
        }

        uasort($users, function ($a, $b) {
            /**
             * @var \OC\User\User $a
             * @var \OC\User\User $b
             */
            return strcmp($a->getUID(), $b->getUID());
        });
        return $users;
    }

    /**
     * search by displayName
     *
     * @param string $pattern
     * @param int $limit
     * @param int $offset
     * @return \OC\User\User[]
     */
    public function searchDisplayName($pattern, $limit = null, $offset = null) {
        $users = array();
        foreach ($this->backends as $backend) {
            $backendUsers = $backend->getDisplayNames($pattern, $limit, $offset);
            if (is_array($backendUsers)) {
                foreach ($backendUsers as $uid => $displayName) {
                    $users[] = $this->getUserObject($uid, $backend);
                }
            }
        }

        usort($users, function ($a, $b) {
            /**
             * @var \OC\User\User $a
             * @var \OC\User\User $b
             */
            return strcmp($a->getDisplayName(), $b->getDisplayName());
        });
        return $users;
    }

    /**
     * @param string $uid
     * @param string $password
     * @throws \Exception
     * @return bool|\OC\User\User the created user or false
     */
    public function createUser($uid, $password) {
        $l = \OC::$server->getL10N('lib');
        // Check the name for bad characters
        // Allowed are: "a-z", "A-Z", "0-9" and "_.@-"
        if (preg_match('/[^a-zA-Z0-9 _\.@\-]/', $uid)) {
            throw new \Exception($l->t('Only the following characters are allowed in a username:'
                . ' "a-z", "A-Z", "0-9", and "_.@-"'));
        }
        // No empty username
        if (trim($uid) == '') {
            throw new \Exception($l->t('A valid username must be provided'));
        }
        // No empty password
        if (trim($password) == '') {
            throw new \Exception($l->t('A valid password must be provided'));
        }

        // Check if user already exists
        if ($this->userExists($uid)) {
            throw new \Exception($l->t('The username is already being used'));
        }

        $this->emit('\OC\User', 'preCreateUser', array($uid, $password));
        foreach ($this->backends as $backend) {
            if ($backend->implementsActions(\OC_User_Backend::CREATE_USER)) {
                $backend->createUser($uid, $password);
                $user = $this->getUserObject($uid, $backend);
                $this->emit('\OC\User', 'postCreateUser', array($user, $password));
                return $user;
            }
        }
        return false;
    }

    /**
     * returns how many users per backend exist (if supported by backend)
     *
     * @return array an array of backend class as key and count number as value
     */
    public function countUsers() {
        $userCountStatistics = array();
        foreach ($this->backends as $backend) {
            if ($backend->implementsActions(\OC_User_Backend::COUNT_USERS)) {
                $backendusers = $backend->countUsers();
                if($backendusers !== false) {
                    if($backend instanceof \OCP\IUserBackend) {
                        $name = $backend->getBackendName();
                    } else {
                        $name = get_class($backend);
                    }
                    if(isset($userCountStatistics[$name])) {
                        $userCountStatistics[$name] += $backendusers;
                    } else {
                        $userCountStatistics[$name] = $backendusers;
                    }
                }
            }
        }
        return $userCountStatistics;
    }
}




/**
 *
 * Portable PHP password hashing framework.
 *
 * Version 0.3 / genuine.
 *
 * Written by Solar Designer <solar at openwall.com> in 2004-2006 and placed in
 *
 * There's absolutely no warranty.
 *
 * The homepage URL for this framework is:
 *
 *	http://www.openwall.com/phpass/
 *
 * Please be sure to update the Version line if you edit this file in any way.
 * It is suggested that you leave the main version number intact, but indicate
 * your project name (after the slash) and add your own revision information.
 *
 * Please do not change the "private" password hashing method implemented in
 * here, thereby making your hashes incompatible.  However, if you must, please
 * change the hash type identifier (the "$P$") to something different.
 *
 * Obviously, since this code is in the public domain, the above are not
 * requirements (there can be none), but merely suggestions.
 *
 * @author Solar Designer <solar@openwall.com>
 */
class PasswordHash
{
    private $itoa64;
    private $iteration_count_log2;
    private $portable_hashes;
    private $random_state;

    /**
     * Constructor
     *
     * @param int $iteration_count_log2
     * @param boolean $portable_hashes
     */
    public function __construct($iteration_count_log2, $portable_hashes)
    {
        $iteration_count_log2 = 12;
        $portable_hashes = false;
        $this->itoa64 = './0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

        if ($iteration_count_log2 < 4 || $iteration_count_log2 > 31) {
            $iteration_count_log2 = 8;
        }
        $this->iteration_count_log2 = $iteration_count_log2;

        $this->portable_hashes = $portable_hashes;

        $this->random_state = microtime();
        if (function_exists('getmypid')) {
            $this->random_state .= getmypid();
        }
    }

    /**
     * @param  int $count
     * @return String
     */
    public function get_random_bytes($count)
    {
        $output = '';
        if (@is_readable('/dev/urandom') &&
            ($fh = @fopen('/dev/urandom', 'rb'))) {
            $output = fread($fh, $count);
            fclose($fh);
        }

        if (strlen($output) < $count) {
            $output = '';
            for ($i = 0; $i < $count; $i += 16) {
                $this->random_state =
                    md5(microtime() . $this->random_state);
                $output .=
                    pack('H*', md5($this->random_state));
            }
            $output = substr($output, 0, $count);
        }

        return $output;
    }

    /**
     * @param  String $input
     * @param  int $count
     * @return String
     */
    public function encode64($input, $count)
    {
        $output = '';
        $i = 0;
        do {
            $value = ord($input[$i++]);
            $output .= $this->itoa64[$value & 0x3f];
            if ($i < $count) {
                $value |= ord($input[$i]) << 8;
            }
            $output .= $this->itoa64[($value >> 6) & 0x3f];
            if ($i++ >= $count) {
                break;
            }
            if ($i < $count) {
                $value |= ord($input[$i]) << 16;
            }
            $output .= $this->itoa64[($value >> 12) & 0x3f];
            if ($i++ >= $count) {
                break;
            }
            $output .= $this->itoa64[($value >> 18) & 0x3f];
        } while ($i < $count);

        return $output;
    }

    /**
     * @param  String $input
     * @return String
     */
    public function gensalt_private($input)
    {
        $output = '$P$';
        $output .= $this->itoa64[min($this->iteration_count_log2 +
            ((PHP_VERSION >= '5') ? 5 : 3), 30)];
        $output .= $this->encode64($input, 6);

        return $output;
    }

    /**
     * @param  String $password
     * @param  String $setting
     * @return String
     */
    public function crypt_private($password, $setting)
    {
        $output = '*0';
        if (substr($setting, 0, 2) == $output) {
            $output = '*1';
        }

        $id = substr($setting, 0, 3);
        # We use "$P$", phpBB3 uses "$H$" for the same thing
        if ($id != '$P$' && $id != '$H$') {
            return $output;
        }

        $count_log2 = strpos($this->itoa64, $setting[3]);
        if ($count_log2 < 7 || $count_log2 > 30) {
            return $output;
        }

        $count = 1 << $count_log2;

        $salt = substr($setting, 4, 8);
        if (strlen($salt) != 8) {
            return $output;
        }

        // We're kind of forced to use MD5 here since it's the only
        // cryptographic primitive available in all versions of PHP
        // currently in use.  To implement our own low-level crypto
        // in PHP would result in much worse performance and
        // consequently in lower iteration counts and hashes that are
        // quicker to crack (by non-PHP code).
        if (PHP_VERSION >= '5') {
            $hash = md5($salt . $password, TRUE);
            do {
                $hash = md5($hash . $password, TRUE);
            } while (--$count);
        } else {
            $hash = pack('H*', md5($salt . $password));
            do {
                $hash = pack('H*', md5($hash . $password));
            } while (--$count);
        }

        $output = substr($setting, 0, 12);
        $output .= $this->encode64($hash, 16);

        return $output;
    }

    /**
     * @param  String $input
     * @return String
     */
    public function gensalt_extended($input)
    {
        $count_log2 = min($this->iteration_count_log2 + 8, 24);
        // This should be odd to not reveal weak DES keys, and the
        // maximum valid value is (2**24 - 1) which is odd anyway.
        $count = (1 << $count_log2) - 1;

        $output = '_';
        $output .= $this->itoa64[$count & 0x3f];
        $output .= $this->itoa64[($count >> 6) & 0x3f];
        $output .= $this->itoa64[($count >> 12) & 0x3f];
        $output .= $this->itoa64[($count >> 18) & 0x3f];

        $output .= $this->encode64($input, 3);

        return $output;
    }

    /**
     * @param  String $input
     * @return String
     */
    public function gensalt_blowfish($input)
    {
        // This one needs to use a different order of characters and a
        // different encoding scheme from the one in encode64() above.
        // We care because the last character in our encoded string will
        // only represent 2 bits.  While two known implementations of
        // bcrypt will happily accept and correct a salt string which
        // has the 4 unused bits set to non-zero, we do not want to take
        // chances and we also do not want to waste an additional byte
        // of entropy.
        $itoa64 = './ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

        $output = '$2a$';
        $output .= chr(ord('0') + $this->iteration_count_log2 / 10);
        $output .= chr(ord('0') + $this->iteration_count_log2 % 10);
        $output .= '$';

        $i = 0;
        do {
            $c1 = ord($input[$i++]);
            $output .= $itoa64[$c1 >> 2];
            $c1 = ($c1 & 0x03) << 4;
            if ($i >= 16) {
                $output .= $itoa64[$c1];
                break;
            }

            $c2 = ord($input[$i++]);
            $c1 |= $c2 >> 4;
            $output .= $itoa64[$c1];
            $c1 = ($c2 & 0x0f) << 2;

            $c2 = ord($input[$i++]);
            $c1 |= $c2 >> 6;
            $output .= $itoa64[$c1];
            $output .= $itoa64[$c2 & 0x3f];
        } while (1);

        return $output;
    }

    /**
     * @param String $password
     */
    public function HashPassword($password)
    {
        $random = '';

        if (CRYPT_BLOWFISH == 1 && !$this->portable_hashes) {
            $random = $this->get_random_bytes(16);
            $hash =
                crypt($password, $this->gensalt_blowfish($random));
            if (strlen($hash) == 60) {
                return $hash;
            }
        }

        if (CRYPT_EXT_DES == 1 && !$this->portable_hashes) {
            if (strlen($random) < 3) {
                $random = $this->get_random_bytes(3);
            }
            $hash =
                crypt($password, $this->gensalt_extended($random));
            if (strlen($hash) == 20) {
                return $hash;
            }
        }

        if (strlen($random) < 6) {
            $random = $this->get_random_bytes(6);
        }

        $hash =
            $this->crypt_private($password,
                $this->gensalt_private($random));
        if (strlen($hash) == 34) {
            return $hash;
        }

        // Returning '*' on error is safe here, but would _not_ be safe
        // in a crypt(3)-like function used _both_ for generating new
        // hashes and for validating passwords against existing hashes.
        return '*';
    }

    /**
     * @param String $password
     * @param String $stored_hash
     * @return boolean
     */
    public function CheckPassword($password, $stored_hash)
    {
        $hash = $this->crypt_private($password, $stored_hash);
        if ($hash[0] == '*') {
            $hash = crypt($password, $stored_hash);
        }

        return $hash == $stored_hash;
    }
}
