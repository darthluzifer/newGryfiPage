<?php
namespace Application\Block\ExampleExtendBasicTable;

use Application\Block\BasicTableBlock\FieldTypes\DateField;
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
use Application\Block\BasicTableBlock\FieldTypes\WysiwygField;

class Controller extends BasicTableBlockController
{
    /**
     * tablename
     * @var string
     */
	protected $tableName = "btBasicExtension";


    /**
     * Controller constructor.
     * defines the fields
     * @param null $obj
     */
    function __construct($obj = null)
    {

    	
    	parent::__construct($obj);
    	
    	$this->fields=array(
                //id field, normal
    			"id" => new Field("id", "ID", "nr"),
                //date fields
    			"date_from" => new DateField("date_from", "Datum von", "dateFrom"),
                "date_to" => new DateField("date_to", "Datum bis", "dateTo"),

                "time_from" => new Field("time_from", "Zeit von", "timeFrom"),
    			"time_to" => new Field("time_to", "Zeit bis", "timeTo"),
    			"title" => new Field("title", "Titel", "titleEvent"),

                //Wysiswyg field
                "description" => new WysiwygField("description", "Beschreibung", "descEvent"),
    			//file field
                "infofile" => new FileField("infofile", "Info Datei", "eventFile"),
    			"registerfile" => new FileField("registerfile", "Anmelde Formular", "registerFile"),

                //foreign key n:m relation
                "testmultiLink" => new DropdownMultilinkField("testmultilink", "Gruppen", "testmultilink"),
    	);
    	
    	//
    	$this->fields['testmultiLink']->setLinkTable("Groups");
    	$this->fields['testmultiLink']->setShowColumn("gName");
    	//column where the foreign key is stored
        $this->fields['testmultiLink']->setIdField("gID");
    	$this->fields['testmultiLink']->setNtoMTable('btEventInGroup');
    	$this->fields['testmultiLink']->setLinkFieldSelf('eventID');
    	$this->fields['testmultiLink']->setLinkFieldExt('groupID');
    	$this->fields['testmultiLink']->setIdFieldSelf('id');
    	$this->fields['testmultiLink']->setIdFieldExt('gID');
    	$this->fields['testmultiLink']->setRowId($_SESSION[$this->tableName.$this->bID."rowid"]);
    	 
    	 
    	//to handle the
    	$this->generatePostFieldMap();
        
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
        return t("BasicExtension");
    }

}
