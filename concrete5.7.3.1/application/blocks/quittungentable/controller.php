<?php
namespace Application\Block\Quittungentable;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Controller as BasicTableBlockController;
use Loader;
use Page;
use User;
use Core;
use Application\Block\BasicTableBlock\Field as Field;
use Aws\S3\Enum\Permission as Permission;
use Application\Block\BasicTableBlock\FieldTypes\FileField as FileField;
use Application\Block\BasicTableBlock\FieldTypes\DropdownField as DropdownField;
use Application\Block\BasicTableBlock\FieldTypes\DropdownLinkField as DropdownLinkField;
use Application\Block\BasicTableBlock\FieldTypes\DropdownMultilinkField as DropdownMultilinkField;
use Application\Block\BasicTableBlock\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Application\Block\BasicTableBlock\FieldTypes\DateField as DateField;

class Controller extends BasicTableBlockController
{

    public $options = array();
    protected $btTable = 'btBasicTableInstance';
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btQuittungen'/*name of the table where the data is stored*/);
	protected $fields = array();
	
	
	
	protected $tableName = "btQuittungen";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
	protected $editKey = null;
	
	protected $bID = null;
	
    
    
    function __construct($obj = null)
    {

    	
    	parent::__construct($obj);
    	
    	$this->fields=array(
    			"id" => new Field("id", "ID", "nr"),
    			"date" => new DateField("date", "Datum", "date"),
    			"description" => new Field("description", "Beschreibung", "description"),
    			"price" => new Field("price", "Summe", "price"),
    			"quittungfoto" => new FileField("quittungfoto", "Foto", "quittungfoto"),
    			"groupID" => new DropdownLinkField("groupID", "Gruppe", "gruppe"),
    			"budgetID" => new DropdownLinkField("budgetID", "Budget", "budget"),
    			"budgetposten" => new DropdownLinkField("budgetposten", "Budgetposten", "budgetposten"),
    			"userID" => new DropdownLinkField("userID", "User", "user"),
    			 
    			
    	);
    	
    	
    	$this->fields['groupID']->setLinkTable("Groups");
    	$this->fields['groupID']->setShowColumn("gName");
    	$this->fields['groupID']->setIdField("gID");
    	$this->fields['groupID']->setNullable(false);
    	 
    	
    	$this->fields['budgetID']->setLinkTable("btBudget");
    	$this->fields['budgetID']->setShowColumn("name");
    	$this->fields['budgetID']->setIdField("id");
    	$this->fields['budgetID']->setSQLFilter(" parentBudgetId IS NULL OR parentBudgetId = ? ", array(''));
    	$this->fields['budgetID']->setNullable(true);    	 
    	
    	$this->fields['budgetposten']->setLinkTable("btBudget");
    	$this->fields['budgetposten']->setShowColumn("name");
    	$this->fields['budgetposten']->setIdField("id");
    	$this->fields['budgetposten']->setSQLFilter(" parentBudgetId IS NOT NULL AND NOT parentBudgetId = ? ", array(''));
    	$this->fields['budgetposten']->setNullable(true);
    	 
    	$this->fields['userID']->setLinkTable("Users");
    	$this->fields['userID']->setShowColumn("uName");
    	$this->fields['userID']->setIdField("uID");
    	$this->fields['userID']->setNullable(false);
    	 
    	
    	
    	$this->postFieldMap = array(
    			"nr" => $this->fields['id'],
    			"date" => $this->fields['date'],
    			"description" => $this->fields['description'],
    			"price" => $this->fields['price'],
    			"quittungfoto" => $this->fields['quittungfoto'],
    			"gruppe" => $this->fields['groupID'],
    			"budget" => $this->fields['budgetID'],
    			"budgetposten" => $this->fields['budgetposten'],
    			"user" => $this->fields['user'],
    			//"testmultilink" => $this->fields['testmultilink'],
    			
    	);
        
        if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
        	$this->editKey = $_SESSION[$this->tableName.$this->bID."rowid"];
        }
        //var_dump($this->editKey);
    }

    /**
     * Used for localization. If we want to localize the name/description we have to include this
     */
    public function getBlockTypeDescription()
    {
        return t("Store and show bills");
    }

    public function getBlockTypeName()
    {
        return t("BasicQuittungen");
    }

}
