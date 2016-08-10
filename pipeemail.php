<?php

defined('C5_EXECUTE') or die("Access Denied.");
//vars
chdir(__DIR__);

$logtext = "";
$dbprop = (include('../testNewGryfiPage/concrete5/application/config/database.php'));

$dbprop = $dbprop['connections']['concrete'];

$fd = fopen("php://stdin", "r");
$message = "";
while (!feof($fd)) {
	$message .= fread($fd, 1024);
}
fclose($fd);

//split the string into array of strings, each of the string represents a single line, received
$lines = explode("\n", $message);

// initialize variable which will assigned later on
$from = "emailFrom@example.com";
$subject = "";
$headers = "";
$message = "";
$is_header= true;

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
/*
$options = array(
	PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
);*/

$dbh = new PDO($dsn, $username, $password/*, $options*/);

//TODO first check if from is in user table (to prevent spam)

//get the emails of the group
$sql = "SELECT u.uEmail FROM Groups g JOIN UserGroups ug ON g.gID = ug.gID JOIN Users u ON u.uID = ug.uID WHERE LOWER(g.gName) = LOWER(?)";

$logtext.="\n";
$logtext.="SQL STATEMENT: $sql";

$statement = $dbh->prepare($sql);
$statement->bindParam(1, $group);
$logtext.="\n";
$logtext.="Group is: $group";

$group = checkgroup($group);

$logtext.="\n";
$logtext.="Checked Group is: $group";


$statement->execute();
if($statement->errorCode() != '00000'){
	exit();
}
$result = $statement->fetchAll(PDO::FETCH_ASSOC);

ob_start();
var_dump($result);
$vardumpres = ob_get_contents();
$logtext.="\n";
$logtext.="SQL Result: $vardumpres";

$emails = array();
$skipped = false;
foreach($result as $rownum => $value){
	if(!($value['uEmail'] == $to)){
		$emails[]=$value['uEmail'];
		send_mail( $value['uEmail'], $subject,$message, $from, $headers );
	}else{
		$skipped = true;
	}
}


$headers.= "Bcc: ".implode(",",$emails)."\n";




//mail( "lucius.bachmann@clubpage.ch", $subject,$message, $from, $headers );

//now confirm send of email

$confirmtext = "
Hey $from
The Following Message was sendt to: ".implode(",",$emails)."

Subject: $subject

$message

";

$logtext .= $confirmtext;



send_mail($from, "Confirmation of Email forwarding of $subject ", $confirmtext, "lucius.bachmann@gmx.ch");

if(file_exists("emaillog.txt")){
	unlink("emaillog.txt");
}
file_put_contents("emaillog.txt", $logtext);

function send_mail($to, $subject, $message, $from, $headers){
	global $logtext;
	require 'class.phpmailer.php';

	$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output
	$mail->wrapText();

	$mail->setFrom($from);
	$mail->addAddress($to);     // Add a recipient
	/*$mail->addAddress('ellen@example.com');               // Name is optional
	$mail->addReplyTo('info@example.com', 'Information');
	$mail->addCC('cc@example.com');
	$mail->addBCC('bcc@example.com');
*/
	                                // Set email format to HTML

	$mail->Subject = $subject;
	$mail->Body    = $message;
	$mail->addCustomHeader("Content-Type", 'multipart/mixed');

	if(!$mail->send()) {
		echo 'Message could not be sent.';
		echo 'Mailer Error: ' . $mail->ErrorInfo;
		$logtext.= '\n';
		$logtext.= 'Message could not be sent.';
		$logtext.= '\n';
		$logtext.= 'Mailer Error: ' . $mail->ErrorInfo;

	} else {
		echo 'Message has been sent';
		$logtext.= '\n';
		$logtext.= 'Message sent.';

	}
}


function checkgroup($group){
	for($i=0;$i < strlen($group); $i++){
		if(preg_match("/[a-z]/i", $group[$i])){
			break;
		}
	}
	return substr($group,$i);
}

?>
