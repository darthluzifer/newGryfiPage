<?php
OC::$CLASSPATH['OC_User_IMAP']='user_external/lib/imap.php';
OC::$CLASSPATH['OC_User_SMB']='user_external/lib/smb.php';
OC::$CLASSPATH['OC_User_FTP']='user_external/lib/ftp.php';
OC::$CLASSPATH['OC_User_Concrete5']='user_external/lib/concrete5.php';
OC_User::setupBackends();