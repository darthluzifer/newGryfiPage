<?php
namespace Application\Block\BasicTableBlock;

use Concrete\Core\Block\BlockController;
use Loader;
use Page;
use User;
use Core;

class Controller extends BlockController
{

    public $options = array();
    protected $btTable = 'btBasicTableInstance';
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btBasicTable'/*name of the table where the data is stored*/);
	protected $fields = array(
			"id" => "int",
			"value" => "text"
	);
	
	
	protected $tableName = "btBasicTable";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
    
    
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
    }

    /**
     * Used for localization. If we want to localize the name/description we have to include this
     */
    public function getBlockTypeDescription()
    {
        return t("Show a simple Table with Data to create, edit, delete");
    }

    public function getBlockTypeName()
    {
        return t("BasicTable");
    }

    function getQuestion()
    {
        return $this->question;
    }

    function getPollOptions()
    {
        return $this->options;
    }

    function delete()
    {
        $db = Loader::db();
        $v = array($this->bID);

        $q = "DELETE FROM btBasicTableActionOption WHERE bID = ?";
        $db->query($q, $v);


        parent::delete();
    }

    function action_save_new_row()
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
                $v = array(
                	$_REQUEST['id'],	
                    $_REQUEST['value']
                );
                $q = $this->createInsertString();
                
                $db->query($q, $v);
                //setcookie("ccmPoll" . $this->bID . '-' . $this->cID, "voted", time() + 1296000, DIR_REL . '/');
                $this->redirect($c->getCollectionPath());
           	}
        
    }
    
    
    function action_add_new_row_form(){
    	$this->isFormview = true;
    	
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
    				$sqlmiddle.= "'?'";
    			}else{
    				$sqlmiddle.= "?";
    			}
    		}else{
    			$sql.= ','.$fieldname;
    			if($type === 'text'){
    				$sqlmiddle.= ",'?'";
    			}else{
    				$sqlmiddle.= ",?";
    			}
    		}
    	}
    	
    	return $sql.$sqlmiddle.')';
    	
    	
    }

    function requiresRegistration()
    {
        return $this->requiresRegistration;
    }

    function hasVoted()
    {
        return false;
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

}
