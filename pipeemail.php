<?php

defined('C5_EXECUTE') or die("Access Denied.");
//vars
chdir(__DIR__);

$logfile = "emaillog.txt";

//open database properties of concrete5
$logtext = "";
$dbprop = (include('concrete5/application/config/database.php'));

$dbprop = $dbprop['connections']['concrete'];
//open stream
$fd = fopen("php://stdin", "r");



//comment for productive use:
//file_put_contents($logfile, " ");


logtext("
---------------------------------------------------------------------
date: ".date("Y-m-d H:i:s")."
");

//define attachment dir
if(!is_dir("mailattachements")){
	if(!mkdir("mailattachements")) {

		logtext("Failure on creating directory mailattachements");
		exit();
	}
}

$uniqueid = uniqid();
$attachementDir = "mailattachements/".$uniqueid."/";
if(!mkdir("mailattachements/$uniqueid")){

	logtext("Failure on creating directory $attachementDir");
	exit();
}






//load php mailparser
require_once __DIR__.'/vendor/autoload.php';


$message = "";
while (!feof($fd)) {
	$message .= fread($fd, 1024);
}
fclose($fd);

$Parser = new PhpMimeMailParser\Parser();
$message2 = $message;
$Parser->setText($message);

//split the string into array of strings, each of the string represents a single line, received
$lines = explode("\n", $message2);

// initialize variable which will assigned later on
$from = "";
$subject = "";
$headers = "";
$message = "";
$is_header= true;


//because their parsing of addresses does not work, we use the old one
//loop through each line
for ($i=0; $i < count($lines); $i++) {
	if ($is_header) {
		// hear information. instead of main message body, all other information are here.


		// Split out the subject portion
		if (preg_match("/^Subject: (.*)/", $lines[$i], $matches)) {
			$subject = $matches[1];
		}
		//Split out the sender information portion
		elseif (preg_match("/^From: (.*)/", $lines[$i], $matches)) {
			$from = $matches[1];
		}

		//split aut to info
		elseif (preg_match("/^To: (.*)/", $lines[$i], $matches)) {
			$to = $matches[1];
		}else{
			$headers .= $lines[$i]."\n";
		}

	} else {
		// content/main message body information
		$message .= $lines[$i]."\n";
	}
	if (trim($lines[$i])=="") {
		// empty line, header section has ended
		$is_header = false;
	}
}

$subject = $Parser->getHeader("subject");


$message = $Parser->getMessageBody("html");
$messageplain = $Parser->getMessageBody("text");

if(strlen(trim($message))==0){
	$message = $messageplain;
}
logtext("Attachement dir ist $attachementDir");
$attachements = $Parser->saveAttachments($attachementDir);

$result = array();
//now get the email out of the header of the email
preg_match_all('/\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,6}\b/i', $from, $result, PREG_PATTERN_ORDER);
logtext("Result of regex is ".json_encode($result));
if(is_array($result)){
	if(isset($result[0])){
		$from = $result[0][0];
	}
}



//now get the users where the mail should be sendt to:
$explodeFrom = explode("@", $to);
$groupWithName = $explodeFrom[0];
$group = "";
for($i = 0; $i < strlen($groupWithName);$i++){
	if($groupWithName[$i] == " " OR $groupWithName[$i] == "<"){
		$group = "";
	}else{
		$group.=$groupWithName[$i];
	}
}



//connection to Database
$dsn = 'mysql:host=localhost;dbname='.$dbprop['database'];
$username = $dbprop['username'];
$password = $dbprop['password'];

$dbh = new PDO($dsn, $username, $password/*, $options*/);

//TODO first check if from is in user table (to prevent spam)

$sql = "SELECT count(*) as number FROM Users u WHERE LOWER(u.uEmail) = LOWER(?)";
$statement = $dbh->prepare($sql);
logtext("Parameter of Emailcheck is: $from");
$statement->bindParam(1, $from);
$statement->execute();
if($statement->errorCode() != '00000'){
	exit();
}
$result = $statement->fetchAll(PDO::FETCH_ASSOC);

logtext("Result of emailcheck is ".json_encode($result));
/*
if($result[0]['number']< 1){
	logtext("Misuse of email forwarding from address $from");
	exit();
}*/
//get the emails of the group
$sql = "SELECT u.uEmail FROM Groups g JOIN UserGroups ug ON g.gID = ug.gID JOIN Users u ON u.uID = ug.uID WHERE LOWER(g.gName) = LOWER(?)";





logtext("SQL STATEMENT: $sql");

$statement = $dbh->prepare($sql);

logtext("Group is: $group");

$group = checkgroup($group);

logtext("Checked Group is: $group");


$statement->bindParam(1, $group);


$statement->execute();
if($statement->errorCode() != '00000'){
	exit();
}
$result = $statement->fetchAll(PDO::FETCH_ASSOC);

if(count($result)==0){
	exit();
}



logtext("SQL Result: ".json_encode($result));

$emails = array();
$skipped = false;
foreach($result as $rownum => $value){
	if(!($value['uEmail'] == $to)){
		$emails[]=$value['uEmail'];
		//send_mail( $value['uEmail'], $subject,$message, $from, $headers );
	}else{
		$skipped = true;
	}
}






//mail( "lucius.bachmann@clubpage.ch", $subject,$message, $from, $headers );

//now confirm send of email

$confirmtext = "


The Following Message was sendt to: ".implode(",",$emails)."

Header was:

Subject: $subject

Message:
$message


Messageplain:
$messageplain



----------------------------------------------------------------------

";

$logtext .= $confirmtext;


logtext($logtext);



send_mail("lucius.bachmann@clubpage.ch", $subject, $message,"lucius.bachmann@clubpage.ch", $emails, $messageplain, $attachements);


function send_mail($to, $subject, $message, $from, $emails, $messageplain, $attachements){
	require 'class.phpmailer.php';





	//$mail->addCustomHeader("Content-Type", 'multipart/mixed');
	foreach ($emails as $email) {
		$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output
		$mail->wrapText();

		$mail->addAddress($email);
		$mail->setFrom($from);  // Add a recipient
		/*$mail->addAddress('ellen@example.com');               // Name is optional
        $mail->addReplyTo('info@example.com', 'Information');
        $mail->addCC('cc@example.com');
        $mail->addBCC('bcc@example.com');
    */
		// Set email format to HTML




		$mail->Subject = $subject;

		$mail->Body=$message;

		$mail->AltBody = $messageplain;

		$attachmentdir = "";
		foreach ($attachements as $path) {
			$attachmentdir = dir($path);
			$mail->addAttachment($path);
		}

		$mail->CharSet = "utf8";
		if (!$mail->send()) {
			logtext("Sending to $email failed");
		} else {
			logtext("Sending to $email successful");
		}
	}
	foreach($attachements as $path){
		unlink($path);
	}

	rmdir($attachmentdir);
}


function checkgroup($group){
	/*
	for($i=0;$i < strlen($group); $i++){
		if(preg_match("/[a-zA-Z]/", $group[$i])){
			break;
		}
	}
	return substr($group,$i);
	*/
	$group = str_replace('"', "", $group);
	$group = trim($group);

	return $group;
}

function logtext($text){
	global $logfile;
	file_put_contents($logfile, file_get_contents($logfile)."\n".$text);
}

?>
