<?php  
namespace Concrete\Package\EmailListSignup\Block\EmailListSignup;
use \Concrete\Core\Block\BlockController;
use UserInfo;
use Loader;
use \Concrete\Package\EmailListSignup\Models\EmailListSignup as EmailListSignup;
use Config;
use Page;
use View;
class Controller extends BlockController {
	
	public $helpers = array('form');

	var $pobj;
	
	protected $btDescription = "Email List Signup Form";
	protected $btName = "Email List Signup";
	protected $btTable = 'btEmailListSignup';
	protected $btInterfaceWidth = "400";
	protected $btInterfaceHeight = "500";
	
	public function view() {
		if ($this->get('emailListSignupSuccess')) {
			$this->sendMessage('emailListSignupSuccess', $this->submitSuccessMsg);
		}
		$this->set('labelFieldText', $this->labelText);
		$this->set('inFieldText', $this->inFieldText);
		$this->set('submitButtonText', $this->submitButtonText);
	}
	
	public function action_submit_form() {

		//Populate data object
		Loader::model('email_list_signup', 'email_list_signup');
		$signup = new EmailListSignup();
		$signup->sID = null; //workaround for adodb-active-record bug -- insert fails if we don't explicitly initialize field to null when $ADODB_ACTIVE_CACHESECS > 0 (which is set in /concrete/config/base.php)
		$signup->email = $this->post('email');
		$signup->ip = $this->getRequestIP()->getIp();

		//Validate
		$ip = Loader::helper('validation/ip');
		if ($ip->isBanned()) {
			$error = Loader::helper('validation/error');
			$error->add($ip->getErrorMessage());
		} else {
			$error = $signup->validate();
		}

		//Save to db
		if (!$error->has()) {
			$ok = $signup->save();
			if (!$ok) {
				$dbErrMsg = Loader::db()->ErrorMsg(); //Must call this before Config::get(), otherwise ErrorMsg() returns empty!
				if (Config::get('SITE_DEBUG_LEVEL') > 0) {
					$error->add("Database Error: The signup record could not be added to the database for the following reason: " . $dbErrMsg);
				} else {
					$error->add("Error: Sorry, but there was an error with the system and you could not be registered at this time.");
				}
			}
		}

		//Send error/success message to view
		if ($error->has()) {
			$this->sendMessage('emailListSignupError', $this->errorMessageString($this->submitErrorHeaderMsg, $error));
		} else {
			$this->send_notification_email($signup);
			
			//Redirect back to the original page that the form/block was on,
			// telling it we were successful so it can display a message.
			$c = Page::getCurrentPage();
			$absolute_url = Loader::helper('navigation')->getCollectionURL($c);
			$redirect = $absolute_url; //Location headers should be absolute URL's (see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30)
			$redirect .= (strstr($redirect, '?') ? '&' : '?') . 'emailListSignupSuccess=1';
			header("Location: " . $redirect);
			die;
		}
	}
	
	private function errorMessageString($header, $error) {
			$msg = '';
			$msg .= $header;
			$msg .= '<br />';
			$msg .= '<ul class="error">';
			foreach($error->getList() as $e) {
				$msg .= "<li>{$e}</li>";
			}
			$msg .= '</ul>';
			return $msg;
	}
	
	private function sendMessage($messageKey, $messageText) {
		if ($this->displayMsgInBlock) {
			$this->set($messageKey, $messageText);
		} else {
			$GLOBALS[$messageKey] = $messageText; //Make available to the overall page template so messages can be displayed outside of the block area
		}
	}
	
	private function getRequestIP() {
		if (version_compare(APP_VERSION, '5.4.2', '>=')) {
			return Loader::helper('validation/ip')->getRequestIP();
		} else {
			//Copied from /concrete/helpers/validation/ip.php
			// (for some reason, the getRequestIP() method of the ValidationIpHelper class is protected instead of public)
			// **NOTE THAT THIS WAS FIXED IN 5.4.2 -- BUT KEEP THIS AROUND FOR COMPATIBILITY WITH OLDER VERSIONS**
			if ( array_key_exists ('HTTP_CLIENT_IP', $_SERVER ) && $_SERVER['HTTP_CLIENT_IP']){
				return $_SERVER['HTTP_CLIENT_IP'];
			}
			else if ( array_key_exists ('HTTP_X_FORWARDED_FOR', $_SERVER ) && $_SERVER['HTTP_X_FORWARDED_FOR']) {
				return $_SERVER['HTTP_X_FORWARDED_FOR'];
			}
			else{
				return $_SERVER['REMOTE_ADDR'];
			}
		}
	}
	
	private function send_notification_email($signup) {
		//Send confirmation email to user
		$mh1 = Loader::helper('mail');
		$mh1->to($signup->email);
		$mh1->from($this->confirmationEmailFrom);
		$mh1->addParameter('confirmation_url', $this->generateConfirmationUrl($signup));
		$mh1->load('signup_user_confirmation', 'email_list_signup');
		$mh1->setSubject($this->confirmationEmailSubject);
		$mh1->sendMail(); 

		//Notify Admin
		$mh2 = Loader::helper('mail');
		$mh2->to($this->getAdminEmail());
		$mh2->from($this->getAdminEmail());
		$mh2->addParameter('signup_email', $signup->email);
		$mh2->load('signup_submission_admin_notify', 'email_list_signup');
		$mh2->setSubject(t('['.SITE.'] New Email List Signup Pending'));
		$mh2->sendMail(); 
	}
	
	private function generateConfirmationUrl($signup) {
		
		$url = BASE_URL
			 . View::url('confirm_signup')
			 . "?b={$this->bID}"
			 . "&e={$signup->email}"
			 . "&c={$signup->confirmationHash}";
		return $url;
	}
	
	private function getAdminEmail() {
		$adminUserInfo=UserInfo::getByID(USER_SUPER_ID);
		$adminEmail = $adminUserInfo->getUserEmail();
		return $adminEmail;
	}
	
	public function add() {
		//Defaults for new blocks
		$this->set('labelText', 'Join our mailing list:');
		$this->set('inFieldText', 'Enter your email address');
		$this->set('submitButtonText', 'Sign Up');
		$this->set('submitErrorHeaderMsg', 'Could not sign you up due to the following problems(s):');
		$this->set('submitSuccessMsg', 'Thanks for signing up! Check your inbox for further instructions.');
		$this->set('displayMsgInBlock', 1);
		$this->set('confirmationEmailFrom', $this->getAdminEmail());
		$this->set('confirmationEmailSubject', 'Please confirm your subscription to the '.SITE.' Mailing List');
		$this->set('confirmationSuccessMsg', 'Thank you for subscribing to our mailing list!');
	}

}
