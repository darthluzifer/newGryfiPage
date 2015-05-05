<?php
namespace Application\Block\eventTable;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Controller as BasicTableBlockController;
use Loader;
use Page;
use User;
use Core;

class Controller extends BasicTableBlockController
{

    public $options = array();
    protected $btTable = 'btBasicTableInstance';
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btEvents'/*name of the table where the data is stored*/);
	protected $fields = array(
			"id" => "int",
			"date_from" => "date",
			"date_to" => "date",
			"time_from"=> "time",
			"time_to" => "time",
			"title" => "text",
			"description" => "text",
			"infofile" => "file",
			"registerfile" => "file" 
	);
	
	
	protected $tableName = "btEvents";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
	protected $editKey = null;
	
	protected $bID = null;
	
    
    
    function __construct($obj = null)
    {
        parent::__construct($obj);
        $c = Page::getCurrentPage();

        if (is_object($c)) {
            $this->cID = $c->getCollectionID();
        }
        if ($this->bID) {
            $db = Loader::db();
            $v = array($this->bID);
            $q = "SELECT optionID, optionName, displayOrder FROM btBasicTableActionOption WHERE bID = ? ORDER BY displayOrder ASC";
            $r = $db->query($q, $v);
            $this->options = array();
            if ($r) {
                while ($row = $r->fetchRow()) {
                    $opt = new Option;
                    $opt->optionID = $row['optionID'];
                    $opt->cID = $this->cID;
                    $opt->optionName = $row['optionName'];
                    $opt->displayOrder = $row['displayOrder'];
                    $this->options[] = $opt;
                }
            }
        }
        
        if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
        	$this->editKey = $_SESSION[$this->tableName.$this->bID."rowid"];
        }
    }

    /**
     * Used for localization. If we want to localize the name/description we have to include this
     */
    public function getBlockTypeDescription()
    {
        return t("Show a simple Table width Data of Events");
    }

    public function getBlockTypeName()
    {
        return t("BasicEvent");
    }
    

    function action_save_row()
    {
    	 
    	$this->isFormview = false;
    	$u = new User();
    	$db = Loader::db();
    	$bo = $this->getBlockObject();
    	if ($this->post('rcID')) {
    		// we pass the rcID through the form so we can deal with stacks
    		$c = Page::getByID($this->post('rcID'));
    	} else {
    		$c = $this->getCollectionObject();
    	}
    
    	if ($this->requiresRegistration()) {
    		if (!$u->isRegistered()) {
    			$this->redirect('/login');
    		}
    	}
    
    
    
    	$antispam = Loader::helper('validation/antispam');
    	if ($antispam->check('', 'survey_block')) { // we do a blank check which will still check IP and UserAgent's
    		$duID = 0;
    		if ($u->getUserID() > 0) {
    			$duID = $u->getUserID();
    		}
    
    		/** @var \Concrete\Core\Permission\IPService $iph */
    		$iph = Core::make('helper/validation/ip');
    		$ip = $iph->getRequestIP();
    		$ip = ($ip === false)?(''):($ip->getIp($ip::FORMAT_IP_STRING));
    		$v = array();
    		foreach($this->getFields() as $key => $value){
    			if($key == 'id'){}
    			else{
    				$v[]=$_REQUEST[$key];
    			}
    		}
    
    		if($this->editKey == null){
    			$q = $this->createInsertString();
    		}else{
    			$q = $this->createUpdateString();
    			$v[]=$this->editKey;
    		}
    
    		$db->query($q, $v);
    
    		if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
    			unset($_SESSION[$this->tableName.$this->bID."rowid"]);
    		}
    		//setcookie("ccmPoll" . $this->bID . '-' . $this->cID, "voted", time() + 1296000, DIR_REL . '/');
    		$this->redirect($c->getCollectionPath());
    	}
    
    }
    
    
    function action_add_new_row_form(){
    	$this->isFormview = true;
    	 
    }
    
    function action_edit_row_form(){
    	if ($this->requiresRegistration()) {
    		if (!$u->isRegistered()) {
    			$this->redirect('/login');
    		}
    	}
    	$this->editKey = $_POST['rowid'];
    	$_SESSION[$this->tableName.$this->bID."rowid"]=$this->editKey;
    	 
    	if($_POST['action'] == 'edit'){
    		$this->prepareFormEdit();
    	}else{
    		$this->deleteRow();
    	}
    }
    
    public function deleteRow(){
    
    	$db = Loader::db();
    	$q = "DELETE FROM ".$this->tableName." WHERE id=?";
    	$v = array($this->editKey);
    	$r = $db->query($q,$v);
    	if($r){
    		return true;
    	}else{
    		return false;
    	}
    }

    function createInsertString(){
    	$sql = "INSERT INTO ".$this->tableName." (";
    	$sqlmiddle = ")VALUES(";
    	$first = true;
    	$second = true;
    	foreach($this->fields as $fieldname => $type){
    		if($first){
    			$first = false;
    		}elseif ($second){
    			$second = false;
    			$sql.= $fieldname;
    			if($type === 'text'){
    				$sqlmiddle.= "?";
    			}else{
    				$sqlmiddle.= "?";
    			}
    		}else{
    			$sql.= ','.$fieldname;
    			if($type === 'text'){
    				$sqlmiddle.= ",?";
    			}else{
    				$sqlmiddle.= ",?";
    			}
    		}
    	}
    	 
    	return $sql.$sqlmiddle.')';
    	 
    	 
    }
    
    function createUpdateString(){
    	$sql = "UPDATE ".$this->tableName." SET ";
    	$first = true;
    	$second = true;
    	foreach($this->fields as $fieldname => $type){
    		if($first){
    			$first = false;
    		}elseif ($second){
    			$second = false;
    			$sql.= $fieldname."=?";
    			 
    		}else{
    			$sql.= ', '.$fieldname."=?";
    			 
    		}
    	}
    	$sql.= "WHERE id=?";
    
    	return $sql;
    
    
    }

    public function displayTable()
    {
    	// Prepare the database query
    	$db = Loader::db();
    	$q = "SELECT * from ".$this->tableName;
    
    	$r = $db->query($q);
    
    	$tabledata = array();
    	while ($row = $r->fetchRow()) {
    		$tabledata[]=$row;
    	}
    
    	return $tabledata;
    
    }
    
    public function getFields(){
    	return $this->fields;
    }
    
    public function setExecuted(){
    	$this->executed = true;
    }
    
    public function isExecuted(){
    	return $this->executed;
    }
    
    public function getRowValues(){
    	$db = Loader::db();
    	$q = "SELECT * FROM ".$this->tableName." WHERE id=?";
    	$v = array($this->editKey);
    	 
    	$r = $db->query($q, $v);
    	 
    	$returnArray = array();
    	if($r){
    		$values = $r->fetchRow();
    		foreach($this->getFields() as $key => $value){
    			if($key == 'id'){}
    			else{
    				$returnArray[$key]=$values[$key];
    			}
    		}
    	}else{
    		 
    		//dummy function because we have no values
    		foreach($this->getFields() as $key => $value){
    			if($key == 'id'){}
    			else{
    				$returnArray[$key]="";
    			}
    		}
    	}
    	return $returnArray;
    }
    
    

}
