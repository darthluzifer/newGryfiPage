<?php
namespace Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged;

use Concrete\Core\Package\Package;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\BasicTableInstance;
use Core;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Doctrine\DBAL\Schema\Table;
use Page;
use User;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Loader;

use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Test as Test;

class Controller extends BlockController
{



    protected $pkgAutoloaderRegistries = array(
        'Src' => 'Concrete\Package\Src'
    );

    /**
     * the options that can be set
     * @var array
     */
    public $options = array();

    /**
     * the table where the block metadata is stored
     * @var string
     */
    protected $btTable = 'btBasicTableInstance';


    protected $btHandle = 'basic_table_block_packaged';
    /**
     * don't really know why necessary
     * @var array
     */
    //protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btBasicTable'/*name of the table where the data is stored*/);

    /**
     * @var array variable to store the fields
     * array of Appliaction\Block\BasicTableBlock\Field
     */
    protected $fields = array();

    /**
     * Tablename of the table displayed
     * @var string
     */
	protected $tableName = "btBasicTable";

    /**
     * if the block is already executed
     * @var bool
     */
	protected $executed = false;

    /**
     * If the block is in form view
     * @var bool
     */
	protected $isFormview = false;

    /**
     * the currently edited id
     * @var null int
     */
	protected $editKey = null;

    /**
     * the Block id
     * @var null int
     */
	protected $bID = null;

    /**
     * to handle a post request more easy, here is the reverse map postname -> field
     * (in fields is the postname stored)
     * @var array
     */
	protected $postFieldMap = array();

    /**
     * if validatePost throws an error, here are the errormessages stored
     * @var array
     */
	protected $errorMsg = array();

    /**
     * table title
     * @var string
     */
	protected $header = "BasicTablePackaged";

    /**
     * @var string
     */
	protected $SQLFilter = " 1=1";

    /**
     *
     * @var array
     */
	protected $addFields = array();

    /**
     * @var \Concrete\Package\BasicTablePackage\Src\BasicTableInstance
     */
    protected $basicTableInstance;


    protected $package;

    protected $entityManager;

    /**
     *
     * Controller constructor.
     * @param null $obj
     */
    function __construct($obj = null)
    {
        parent::__construct($obj);




        //define the fields
        $this->fields=array(
        		"id" => new Field("id", "ID", "nr"),
        		"value" => new Field("value", "Value", "wert"),
        );


        $this->generatePostFieldMap();
        
        
        $c = Page::getCurrentPage();

        if (is_object($c)) {
            $this->cID = $c->getCollectionID();
        }

        /*
        //load the options
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
        }*/
        //if editkey is set in session, save in property
        if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
        	$this->editKey = $_SESSION[$this->tableName.$this->bID."rowid"];
        }

        //check if it is in form view
        if(isset($_SESSION[$this->tableName]['prepareFormEdit'])){
        	$this->isFormview = $_SESSION[$this->tableName]['prepareFormEdit'];
        }
        //translate the header
        $this->header = t($this->header);


        //load the current options
        $pkg = Package::getByHandle('basic_table_package');
        $em = $pkg->getEntityManager();
        $this->package = $pkg;
        $this->entityManager = $em;
        if($obj instanceof Block) {


            $bt = $em->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $obj->getBlo));

            $this->basicTableInstance = $bt;
        }
    }




    /**
     * Returns the id of the block
     * TODO change that tablename is not used
     * @return string
     */
    function getHTMLId(){
    	return $this->tableName.$this->bID;
    }

    /**
     * Returns the path where the basic table files are stored
     * @return string
     */
    function getBasicTablePath(){
    	return __DIR__;
    }

    /**
     * @return string
     */
    public function getBlockTypeDescription()
    {
        return t("Show a simple Table with Data to create, edit, delete");
    }

    /**
     * @return string
     */
    public function getBlockTypeName()
    {
        return t("BasicTablePackaged");
    }

    /**
     * returns the javascript error messages translated
     * @return array
     */
    public function getJavaScriptStrings() {
    	return array('file-required' => t('You must select a file.'));
    }

    /**
     * Returns the HTML for the possible actions
     * TODO extract html to view
     * @param $object //view object
     * @param array $row //row (with the rowid)
     * @return string
     */
    function getActions($object, $row = array()){
    	//".$object->action('edit_row_form')."
    	$string="
    	<td class='actioncell'>
    	<form method='post' action='".$object->action('edit_row_form')."'>
    		<input type='hidden' name='rowid' value='".$row['id']."'/>
    		<input type='hidden' name='action' value='edit' id='action_".$row['id']."'>";
    	$string.= $this->getEditActionIcon($row);
    	$string.=$this->getDeleteActionIcon($row);	
    		
    		
    	$string.="</form>
    	</td>";
    	return $string;
    }

    /**
     * Returns the HTML for the edit button
     * @param $row
     * @return string
     */
    function getEditActionIcon($row){
    	return "<button type='submit' 
    					value = 'edit' 
    					class='btn inlinebtn actionbutton edit' 
    					onclick=\"
    								$('#action_".$row['id']."').val('edit');
    			\">
    								<i class ='fa fa-pencil'> </i>
    			 </button>";
    }

    /**
     * Returns the HTML for the delete button
     * @param $row
     * @return string
     */
    function getDeleteActionIcon($row){
    	return "<button type='submit'
    					value = 'delete'
    					class='btn inlinebtn actionbutton delete'
    					onclick=\"
    								$('#action_".$row['id']."').val('delete');
    			\">
    								<i class ='fa fa-trash-o'> </i>
    			 </button>";
    }

    


    function delete()
    {
        $db = Loader::db();
        $v = array($this->bID);

        $q = "DELETE FROM btBasicTableActionOption WHERE bID = ?";
        $db->query($q, $v);


        parent::delete();
    }

    /**
     * if save is pressed, the data is saved to the sql table
     * @throws \Exception
     */
    function action_save_row()
    {
    	//form view is over
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


        if(isset($_POST['cancel'])){
        	if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
        		unset($_SESSION[$this->tableName.$this->bID."rowid"]);
        	}
        	//setcookie("ccmPoll" . $this->bID . '-' . $this->cID, "voted", time() + 1296000, DIR_REL . '/');
        	$_SESSION[$this->tableName]['prepareFormEdit'] = false;
        	$this->redirect($c->getCollectionPath());
        	return;
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


                $error = false;
                $errormsg = "";
                $savevalues = $_REQUEST;

                //add additional fields
                foreach($this->addFields as $key => $value){
					$savevalues[$key]=$value;
				}

                //selfsavefields are for example n:m relations. They implement the SelfSaveInterface
                $selfsavefields = array();

                foreach($this->getFields() as $key => $value){
                	if($key == 'id'){}
                	else{
                		$field = $this->postFieldMap[$value->getPostName()];
                		if($value instanceof SelfSaveInterface){
                			if($value->validatePost($savevalues[$value->getPostName()])){
	                			//$value->setValue($_REQUEST[$value->getPostName()]);
	                			$selfsavefields[]=$value->getSQLValue();
                			}
                		
                		}elseif($value->validatePost($savevalues[$value->getPostName()])){
                			$v[]=$value->getSQLValue();
                		}else{
                			$error = true;
                			$this->errorMsg[] = $field->getErrorMsg();
                		}
                	}
                }
                
                if($error){
                	//TODO send error msg to client
                    $this->prepareFormEdit();
                	$_SESSION['BasicTableFormData'][$this->bID]['inputValues']=$_REQUEST;
                	return false;
                }
                
                if($this->editKey == null){
                	$q = $this->createInsertString();
                	$this->editKey = $db->lastInsertId();
                }else{
                	$q = $this->createUpdateString();
                	$v[]=$this->editKey;
                }

                //save values
                $db->query($q, $v);

                //if the data is inserted, the saveself fields can only save afterwards
                foreach($selfsavefields as $num => $selfsavefield){
                	$selfsavefield->setRowId($this->editKey);
                	$selfsavefield->saveValues();
                }
                
                if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
                	unset($_SESSION[$this->tableName.$this->bID."rowid"]);
                }
                //setcookie("ccmPoll" . $this->bID . '-' . $this->cID, "voted", time() + 1296000, DIR_REL . '/');
                
                $_SESSION[$this->tableName]['prepareFormEdit'] = false;
                $this->redirect($c->getCollectionPath());
           	}
        
    }

    /**
     * action display form for new entry
     */
    function action_add_new_row_form(){
    	$this->prepareFormEdit();
    	
    }

    /**
     * action to open a form to edit/delete (manipulate) an existing row
     */
    function action_edit_row_form(){
        //TODO check permissions
    	if ($this->requiresRegistration()) {
    		if (!$u->isRegistered()) {
    			$this->redirect('/login');
    		}
    	}

        //get the editkey
    	$this->editKey = $_POST['rowid'];
        //save it in the session
    	$_SESSION[$this->tableName.$this->bID."rowid"]=$this->editKey;

        if($_POST['action'] == 'edit'){
    		$this->prepareFormEdit();
    	}else{
    		$this->deleteRow();
    	}
    }
    
    public function prepareFormEdit(){
    	$_SESSION[$this->tableName]['prepareFormEdit'] = true;
    	$this->isFormview = true;
    }
    
    public function deleteRow(){

    	$db = Loader::db();
    	$q = "DELETE FROM ".$this->tableName." WHERE id=?";
    	$v = array($this->editKey);
    	$r = $db->query($q,$v);
    	$_SESSION[$this->tableName]['prepareFormEdit'] = false;
    	if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
    		unset($_SESSION[$this->tableName.$this->bID."rowid"]);
    	}
    	if($r){
    		return true;
    	}else{
    		return false;
    	}
    }

    /**
     * check if block is in form view or not
     * @return bool
     */
    function displayForm(){
    	return $this->isFormview;
    }
    
    function createInsertString(){
    	$sql = "INSERT INTO ".$this->tableName." (";
    	$sqlmiddle = ")VALUES(";
    	$first = true;
    	$second = true;
    	foreach($this->fields as $fieldname => $type){
    		//instances if SelfSaveInterface save their values by themselfes.
    		
    		if(!($type instanceof SelfSaveInterface)){
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
    	}
    	
    	return $sql.$sqlmiddle.')';
    	
    	
    }
    
    function createUpdateString(){
    	$sql = "UPDATE ".$this->tableName." SET ";
    	$first = true;
    	$second = true;
    	
    	foreach($this->fields as $fieldname => $type){
    	
    		if(!($type instanceof SelfSaveInterface)){
	    		if($first){
	    			$first = false;
	    		}elseif ($second){
	    			$second = false;
	    			$sql.= $fieldname."=?";
	    			
	    		}else{
	    			$sql.= ', '.$fieldname."=?";
	    			
	    		}
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
        /*
        foreach ($this->options as $opt) {
            $v1 = array($newBID, $opt->getOptionName(), $opt->getOptionDisplayOrder());
            $q1 = "INSERT INTO btBasicTableActionOption (bID, optionName, displayOrder) VALUES (?, ?, ?)";
            $db->query($q1, $v1);

            
        }*/

        return parent::duplicate($newBID);

    }


    //todo
    public function uninstall(){

    }

    function save($args)
    {
        parent::save($args);

        if(!$this->basicTableInstance instanceof BasicTableInstance){

            $bt = $this->entityManager->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $this->bID));

            $this->basicTableInstance = $bt;
        }

        if(count($this->basicTableInstance->get("tableBlockOptions")) == 0){
            $blockOption = new TableBlockOption();
            $blockOption->set('BasicTableInstance', $this->basicTableInstance);
            $blockOption->set('optionType', get_class(new CanEditOption()));

            $blockOption->set("optionValue", "test");
            $this->basicTableInstance->addBlockOption($blockOption);

            $this->entityManager->persist($blockOption);
            $this->entityManager->persist($this->basicTableInstance);
            $this->entityManager->flush();

        }




        
    }

    /**
     * funciton to retrieve the table data
     * @return array
     */
    public function displayTable()
    {
        // Prepare the database query
        $db = Loader::db();
		$q = "SELECT * from ".$this->tableName." WHERE ".$this->SQLFilter;
		
		$r = $db->query($q);
		
		$tabledata = array();
		while ($row = $r->fetchRow()) {
			$tabledata[]=$row;
		}
		
		return $tabledata;
        
    }

    /**
     * @return array of Application\Block\BasicTableBlock\Field
     */
    public function getFields(){
    	return $this->fields;
    }


    /**
     * sets the block to executed status
     */
    public function setExecuted(){
    	$this->executed = true;
    }

    /**
     * @return bool
     */
    public function isExecuted(){
    	return $this->executed;
    }

    /**
     * retrieve one row
     * @return array
     */
    public function getRowValues(){

    	$returnArray = array();
    	if(isset($_SESSION['BasicTableFormData'][$this->bID]['inputValues'])){
    		
    		foreach($_SESSION['BasicTableFormData'][$this->bID]['inputValues'] as $key => $value){
    			if(is_object($this->postFieldMap[$key])){
    				$returnArray[$this->postFieldMap[$key]->getSQLFieldName()]=$value;
    			}
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
	    			elseif($type instanceof SelfSaveInterface){
	    				$returnArray[$key]=$value->getValues();
	    			}
	    			else{
	    				$value->setSQLValue($values[$key]);
	    				$returnArray[$key]=$value->getValue();
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
    
    function action_myAction(){
    	echo json_encode(array('hi' => 'test'));
    	exit();
    }
    
    function getHeader(){
    	return $this->header;
    }


    /**
     *
     */
    protected function generatePostFieldMap(){
        if(count($this->fields)>0) {
            foreach ($this->fields as $key => $field) {
                $this->postFieldMap[$field->getPostName()]=$this->fields[$key];
            }
        }
    }


    public function getBlockOptions(){
        return $this->blockOptions;
    }

}
