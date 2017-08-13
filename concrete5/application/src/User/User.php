<?php
namespace Application\Src\User;

use Concrete\Core\Foundation\Object;
use Concrete\Core\Http\Request;
use Concrete\Core\Session\SessionValidatorInterface;
use Concrete\Core\Support\Facade\Application;
use Concrete\Core\User\Group\Group;
use Concrete\Core\Authentication\AuthenticationType;
use Concrete\Core\Page\Page;
use Concrete\Core\User\Group\GroupList;
use Hautelook\Phpass\PasswordHash;
use Concrete\Core\Permission\Access\Entity\Entity as PermissionAccessEntity;
use Concrete\Core\User\Point\Action\Action as UserPointAction;
use Concrete\Core\User\UserInfo;


class User extends \Concrete\Core\User\User
{

    public function enterGroup($g)
    {
        $app = Application::getFacadeApplication();
        // takes a group object, and, if the user is not already in the group, it puts them into it
        $dt = $app->make('helper/date');

        if (is_object($g)) {
            if (!$this->inGroup($g)) {
                $gID = $g->getGroupID();
                $db = $app['database']->connection();

                $db->Replace('UserGroups', array(
                    'uID' => $this->getUserID(),
                    'gID' => $g->getGroupID(),
                    'ugEntered' => $dt->getOverridableNow(),
                ),
                    array('uID', 'gID'), true);

                if ($g->isGroupBadge()) {
                    $action = UserPointAction::getByHandle('won_badge');
                    if (is_object($action)) {
                        $action->addDetailedEntry($this, $g);
                    }

                    $mh = $app->make('mail');
                    $ui = UserInfo::getByID($this->getUserID());
                    $mh->addParameter('badgeName', $g->getGroupDisplayName(false));
                    $mh->addParameter('uDisplayName', $ui->getUserDisplayName());
                    $mh->addParameter('uProfileURL', (string) $ui->getUserPublicProfileURL());
                    $mh->addParameter('siteName', tc('SiteName', $app['config']->get('concrete.site')));
                    $mh->to($ui->getUserEmail());
                    $mh->load('won_badge');
                    $mh->sendMail();
                }

                $ue = new \Concrete\Core\User\Event\UserGroup($this);
                $ue->setGroupObject($g);

                $app['director']->dispatch('on_user_enter_group', $ue);
                //$l->addEntry($g->getGroupName());
                if($g->getGroupName() === "owncloud"){
                    try {
                            $user = UserInfo::getByID($this->getUserID());
                            $db->Replace("oc_users", array(
                                'uid' => $this->getUserName(),
                                'password' => $user->getUserPassword()
                            ),
                                array('uid'),
                                true);

                        $db->Replace("oc_groups", array(
                            'gid' => 'Leiter'
                        ),
                            array('gid'),
                            true);
                        $db->Replace("oc_group_user", array(
                            'gid' => 'Leiter',
                            'uid' => $this->getUserName(),
                        ),
                            array('gid', 'uid'),
                            true);



                    }catch(\Exception $e){

                        }
                    }
            }
        }
    }

    public function exitGroup($g)
    {

        // takes a group object, and, if the user is in the group, they exit the group
        if (is_object($g)) {
            $app = Application::getFacadeApplication();
            $db = $app['database']->connection();

            $gID = $g->getGroupID();

            $ue = new \Concrete\Core\User\Event\UserGroup($this);
            $ue->setGroupObject($g);
            $app['director']->dispatch('on_user_exit_group', $ue);

            $q = 'delete from UserGroups where uID = ? and gID = ?';
            $r = $db->executeQuery($q, array($this->uID, $gID));
        }
    }

}
