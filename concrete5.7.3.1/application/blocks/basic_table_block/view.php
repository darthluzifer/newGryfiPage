<?php
defined('C5_EXECUTE') or die("Access Denied.");
// basically a stub that includes some other files
$u = new User();
$uID = $u->getUserID();
$c = Page::getCurrentPage();

$canAccessComposer = false;
if (is_object($composer)) {
	$ccp = new Permissions($composer);
	if ($ccp->canAccessComposer()) {
		$canAccessComposer = true;
	}
}
if(!$controller->isExecuted()){
	
	if($controller->displayForm()){
		$this->inc('views/form_view.php');
	}else{
		$this->inc('views/table_view.php');
		$controller->setExecuted();
	}
}

?>




