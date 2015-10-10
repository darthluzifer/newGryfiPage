<?php
namespace Application\Block\Budgettable;

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
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btBudget'/*name of the table where the data is stored*/);
	protected $fields = array();
	
	
	
	protected $tableName = "btBudget";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
	protected $editKey = null;
	
	protected $bID = null;
	
    
    
    function __construct($obj = null)
    {

    	
    	parent::__construct($obj);
    	
    	$this->fields=array(
    			"id" => new Field("id", "ID", "nr"),
    			"name" => new Field("name", "Name", "name"),
    			"description" => new Field("description", "Beschreibung", "description"),
    			"price" => new Field("price", "Summe", "price"),
    			
    			 
    			
    	);
    	
    	
    	 
    	
    	
    	$this->postFieldMap = array(
    			"nr" => $this->fields['id'],
    			"name" => $this->fields['name'],
    			"description" => $this->fields['description'],
    			"price" => $this->fields['price'],
    			
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
        return t("BasicBudget");
    }

}
