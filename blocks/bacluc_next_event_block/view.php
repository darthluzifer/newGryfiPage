<?php
//use Application\Block\BasicTableBlock\Controller as Controller;

defined('C5_EXECUTE') or die("Access Denied.");
// basically a stub that includes some other files
$u = new User();
$uID = $u->getUserID();
$c = Page::getCurrentPage();
//$controller = new Controller();


$canAccessComposer = false;
if (is_object($composer)) {
	$ccp = new Permissions($composer);
	if ($ccp->canAccessComposer()) {
		$canAccessComposer = true;
	}
}
if(!$controller->isExecuted()){
	if($controller->displayForm() && false){
		include(__DIR__.'/views/form_view.php');
	}else{
		include(__DIR__.'/views/table_view.php');
		$controller->setExecuted();
	}
}


?>



