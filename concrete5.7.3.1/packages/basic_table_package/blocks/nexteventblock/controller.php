<?php
namespace Concrete\Package\BasicTablePackage\BBlock\Nexteventblock;

use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\DateField;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\Controller as BasicTableBlockController;
use Loader;
use Page;
use User;
use Core;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\Field as Field;
use Aws\S3\Enum\Permission as Permission;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\FileField as FileField;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\DropdownLinkField as DropdownLinkField;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\DropdownMultilinkField as DropdownMultilinkField;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Concrete\Package\BasicTablePackage\BBlock\BasicTableBlock\FieldTypes\WysiwygField;
use Concrete\Package\BasicTablePackage\BBlock\Eventtable\Controller as Eventtable;

class Controller extends BasicTableBlockController
{

    public $options = array();
    protected $btTable = 'btBasicTableInstance';
    protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btEvents'/*name of the table where the data is stored*/);
	protected $fields = array();
	
	
	
	protected $tableName = "btEvents";
	
	protected $executed = false;
	
	protected $isFormview = false;
	
	protected $editKey = null;
	
	protected $bID = null;
	
    
    
    function __construct($obj = null)
    {

    	
    	parent::__construct($obj);
    	
    	$this->fields=array(
    			"id" => new Field("id", "ID", "nr"),
    			"date_from" => new DateField("date_from", "Datum von", "dateFrom"),
    			"date_to" => new Field("date_to", "Datum bis", "dateTo"),
    			"time_from" => new Field("time_from", "Zeit von", "timeFrom"),
    			"time_to" => new Field("time_to", "Zeit bis", "timeTo"),
    			"title" => new Field("title", "Titel", "titleEvent"),
    			"description" => new WysiwygField("description", "Beschreibung", "descEvent"),
    			"infofile" => new FileField("infofile", "Info Datei", "eventFile"),
    			"registerfile" => new FileField("registerfile", "Anmelde Formular", "registerFile"),
    			"testmultiLink" => new DropdownMultilinkField("testmultilink", "Gruppen", "testmultilink"),
    	);
    	
    	
    	$this->fields['testmultiLink']->setLinkTable("Groups");
    	$this->fields['testmultiLink']->setShowColumn("gName");
    	$this->fields['testmultiLink']->setIdField("gID");
    	$this->fields['testmultiLink']->setNtoMTable('btEventInGroup');
    	$this->fields['testmultiLink']->setLinkFieldSelf('eventID');
    	$this->fields['testmultiLink']->setLinkFieldExt('groupID');
    	$this->fields['testmultiLink']->setIdFieldSelf('id');
    	$this->fields['testmultiLink']->setIdFieldExt('gID');
    	$this->fields['testmultiLink']->setRowId($_SESSION[$this->tableName.$this->bID."rowid"]);
    	 
    	 
    	
    	$this->postFieldMap = array(
    			"nr" => $this->fields['id'],
    			"dateFrom" => $this->fields['datum_from'],
    			"dateTo" => $this->fields['date_to'],
    			"timeFrom" => $this->fields['time_from'],
    			"timeTo" => $this->fields['time_to'],
    			"titleEvent" => $this->fields['title'],
    			"description" => $this->fields['descEvent'],
    			"eventFile" => $this->fields['infofile'],
    			"registerFile" => $this->fields['registerfile'],
    			"testSelect" => $this->fields['testselect'],
    			"testlink" => $this->fields['testlink'],
    			"testmultilink" => $this->fields['testmultilink'],
    			
    	);
        
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

}
