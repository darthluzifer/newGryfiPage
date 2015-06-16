<?php
namespace Application\Block\BasicTableBlock;

use Concrete\Core\Block\BlockController;
use Loader;
use Page;
use User;
use Core;
use Application\Block\BasicTableBlock\Field as Field;

class Controller extends BlockController
{

    public $options = array();
    protected $btTable = 'btBasicTableInstance';
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btBasicTable'/*name of the table where the data is stored*/);
	protected $fields = array();
	
	
	protected $tableName = "btBasicTable";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
	protected $editKey = null;
	
	protected $bID = null;
	
	protected $postFieldMap = array();
    
	protected $errorMsg = array();
    
    function __construct($obj = null)
    {
        parent::__construct($obj);
        
        $this->fields=array(
        		"id" => new Field("id", "ID", "nr"),
        		"value" => new Field("value", "Value", "wert"),
        );
        
        $this->postFieldMap = array(
        		"nr" => $this->fields['id'],
        		"wert" => $this->fields['value']
        		
        );
        
        
        
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
	
    function getBasicTablePath(){
    	return __DIR__;
    }
    public function getBlockTypeDescription()
    {
        return t("Show a simple Table with Data to create, edit, delete");
    }

    public function getBlockTypeName()
    {
        return t("BasicTable");
    }
    
    function getActions($object, $row = array()){
    	$string="
    	<td>
    	<form method='post' action='".$object->action('edit_row_form')."'>
    		<input type='hidden' name='rowid' value='".$row['id']."'/>
    		<input type='hidden' name='action' value='edit' id='action_".$row['id']."'>
    		
    		<button type='submit' value = 'edit' class='btn inlinebtn actionbutton edit' onclick=\"$('#action_".$row['id']."').val('edit');'\"><i class ='fa fa-pencil'> </i> </button>
    			<input type='hidden' name='rowid' value='".$row['id']."'/>
    		<button type='submit' value='delete' class='btn inlinebtn actionbutton delete'  onclick=\"$('#action_".$row['id']."').val('delete');\"><i class ='fa fa-trash-o'> </i></button>
    	</form>
    	</td>";
    	return $string;
    }

    


    function delete()
    {
        $db = Loader::db();
        $v = array($this->bID);

        $q = "DELETE FROM btBasicTableActionOption WHERE bID = ?";
        $db->query($q, $v);


        parent::delete();
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
//TODO: Validation
                $error = false;
                $errormsg = "";
                foreach($this->getFields() as $key => $value){
                	if($key == 'id'){}
                	else{
                		$field = $this->postFieldMap[$value->getPostName()];
                		if($value->validatePost($_REQUEST[$value->getPostName()])){
                			$v[]=$_REQUEST[$value->getPostName()];
                		}else{
                			$error = true;
                			$this->errorMsg[] = $field->getErrorMsg();
                		}
                	}
                }
                if($error){
                	$this->prepareFormEdit();
                	$_SESSION['BasicTableFormData'][$this->bID]['inputValues']=$_REQUEST;
                	return false;
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
    
    public function prepareFormEdit(){
    	$this->isFormview = true;
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
    
    function displayForm(){
    	return $this->isFormview;
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
    	$sql.= " WHERE id=?";
    	 
    	return $sql;
    	 
    	 
    }

    function requiresRegistration()
    {
        return $this->requiresRegistration;
    }

    

    function duplicate($newBID)
    {

        $db = Loader::db();

        foreach ($this->options as $opt) {
            $v1 = array($newBID, $opt->getOptionName(), $opt->getOptionDisplayOrder());
            $q1 = "INSERT INTO btBasicTableActionOption (bID, optionName, displayOrder) VALUES (?, ?, ?)";
            $db->query($q1, $v1);

            
        }

        return parent::duplicate($newBID);

    }

    function save($args)
    {
        parent::save($args);
        $db = Loader::db();

        if (!is_array($args['survivingOptionNames'])) {
            $args['survivingOptionNames'] = array();
        }

        $slashedArgs = array();
        foreach ($args['survivingOptionNames'] as $arg) {
            $slashedArgs[] = addslashes($arg);
        }
        $db->query(
            "DELETE FROM btBasicTableActionOption WHERE optionName NOT IN ('" . implode(
                "','",
                $slashedArgs) . "') AND bID = " . intval($this->bID));

        if (is_array($args['pollOption'])) {
            $displayOrder = 0;
            foreach ($args['pollOption'] as $optionName) {
                $v1 = array($this->bID, $optionName, $displayOrder);
                $q1 = "INSERT INTO btBasicTableActionOption (bID, optionName, displayOrder) VALUES (?, ?, ?)";
                $db->query($q1, $v1);
                $displayOrder++;
            }
        }

        
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

    	$returnArray = array();
    	if(isset($_SESSION['BasicTableFormData'][$this->bID]['inputValues'])){
    		foreach($_SESSION['BasicTableFormData'][$this->bID]['inputValues'] as $key => $value){
    			
    			$returnArray[$this->postFieldMap[$key]->getSQLFieldName()]=$value;
    			unset($_SESSION['BasicTableFormData'][$this->bID]['inputValues']);
    		}
    	}else{
	    	
	    	$db = Loader::db();
	    	$q = "SELECT * FROM ".$this->tableName." WHERE id=?";
	    	$v = array($this->editKey);
	    	
	    	$r = $db->query($q, $v);
	    	
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
    	}
	    return $returnArray;
    }
    
    function getErrorMessages(){
    	return $this->errorMsg;
    }

}
