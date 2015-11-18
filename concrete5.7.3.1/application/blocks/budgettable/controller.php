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
	

	protected $SQLFilter = " parentBudgetId IS NULL";
	
    protected $parentId = null;
    
    function __construct($obj = null)
    {

    	
    	parent::__construct($obj);
    	
    	$this->fields=array(
    			"id" => new Field("id", "ID", "nr"),
    			"name" => new Field("name", "Name", "name"),
    			"description" => new Field("description", "Beschreibung", "description"),
    			"price" => new Field("price", "Summe", "price"),
    			"parentBudgetId" => new Field("parentBudgetId", "BudgetId", "parentBudgetId", false, false),
    			 
    			
    	);
    	
    	
    	 
    	
    	
    	$this->postFieldMap = array(
    			"nr" => $this->fields['id'],
    			"name" => $this->fields['name'],
    			"description" => $this->fields['description'],
    			"price" => $this->fields['price'],
    			"parentBudgetId" => $this->fields['parentBudgetId'],
    			//"testmultilink" => $this->fields['testmultilink'],
    			
    	);
        
        if(isset($_SESSION[$this->tableName.$this->bID."rowid"])){
        	$this->editKey = $_SESSION[$this->tableName.$this->bID."rowid"];
        	
        }
        
        if(isset($_SESSION[$this->tableName.$this->bID."parentid"])){
        	$this->parentId = $_SESSION[$this->tableName.$this->bID."parentid"];
        	$this->SQLFilter = ' parentBudgetId = '.$this->parentId;
        	 
        	$this->addFields['parentBudgetId']=$this->parentId;        }
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
    
    function getActions($object, $row = array()){
    	//".$object->action('edit_row_form')."
    	$string="
    	<td class='actioncell'>
    	<form method='post' action='".$object->action('edit_row_form')."'>
    		<input type='hidden' name='rowid' value='".$row['id']."'/>
    		<input type='hidden' name='action' value='edit' id='action_".$row['id']."'>";
    	$string.= $this->getEditActionIcon($row);
    	$string.=$this->getDetailsActionIcon($row); 
    	$string.=$this->getDeleteActionIcon($row);
    	
    
    	$string.="</form>
    	</td>";
    	return $string;
    }
    

    function getDetailsActionIcon($row){
    	return "<button type='submit'
    					value = 'detail'
    					class='btn inlinebtn actionbutton details'
    					onclick=\"
    								$('#action_".$row['id']."').val('detail');
    			\">
    								<i class ='fa fa-bars'> </i>
    			 </button>";
    }
    
    
    function action_edit_row_form(){
    	if ($this->requiresRegistration()) {
    		if (!$u->isRegistered()) {
    			$this->redirect('/login');
    		}
    	}
    	if($_POST['action'] == 'edit'){

    		$this->editKey = $_POST['rowid'];
    		$_SESSION[$this->tableName.$this->bID."rowid"]=$this->editKey;
    		$this->prepareFormEdit();
    	}elseif($_POST['action'] == 'detail'){
    		$this->prepareDetails();
    	}elseif($_POST['action'] == 'delete'){

    		$this->editKey = $_POST['rowid'];
    		$_SESSION[$this->tableName.$this->bID."rowid"]=$this->editKey;
    		$this->deleteRow();
    	}
    }
    
    function getParents(){
    	$db = Loader::db();
    	//hole id (um höhere stufe anzuzeigen
    	//name für anzeige
    	//parentbudgetid falls noch mehr parents
    	$parents = array();
    	
    	if($this->parentId != null){
	    	$sql = "SELECT count(id) as count FROM ".$this->tableName." WHERE id = ?";
	    	$r = $db->query($sql, array($this->parentId));
		    $row = $r->fetchRow();
	    	if($row['count']>0){
	    		$sql = "SELECT id,name, parentBudgetId FROM ".$this->tableName." WHERE id = ?";
		    	 
		    	
		    	$r = $db->query($sql, array($this->parentId));
		    	$name = "";
		    	
		    	while ($row = $r->fetchRow()) {
		    		//array soll folgende reihenfolge haben
		    		//topelement/subelement/..../parent of current
		    		
		    		$parents[] =
		    			array('id' => $row['id'],
		    				'name' => $row['name'],
		    				);
	    		
		    		if($row['parentBudgetId'] != null){
		    			$r = $db->query($sql, array($row['parentBudgetId']));
		    		}
		    	}
	    	}
    	}
    	$parents[] = array('id' => '',
		    				'name' => t("Hauptebene")
		    			);
		    				
		    		
    	return $parents;
    }
    
    function getHeader($object){
    	$parents = $this->getParents();
    	
    	$html = "";
    	if(count($parents)>0){
	    	$html = "<form method='post' action='".$object->action('edit_row_form')."'>
	    		<input type='hidden' name='rowid' id='detailid' value=''/>
	    		<input type='hidden' name='action' value='detail' >";
	    	$first = true;
	    	for($i = count($parents)-1; $i >=0; $i--){
	    		$value = $parents[$i];
	    		if($first){
	    			$first=false;
	    		}else{
	    			$html .= "/";
	    		}
	    		if(!isset($value['id'])){
	    			var_dump($parents);
	    			continue;
	    		}
	    		$html.="<button type='submit'
	    					value = 'detail'
	    					class='btn inlinebtn actionbutton'
	    					onclick=\"
	    								$('#detailid').val('".$value['id']."');
	    			\">
	    								".$value['name']."
	    			 </button>";
	    	}
	    	$html.="</form>";
    	}
    	return $html;
    }
    
    
    function prepareDetails(){
    	//hole budgetNamen
	    $this->parentId = $_POST['rowid'];
    	
    	if($this->parentId == ''){
	    	$this->parentId = null;
	    	unset($_SESSION[$this->tableName.$this->bID."parentid"]);
	    	$this->SQLFilter = ' parentBudgetId IS NULL ';
	    }else{	
	    	//verändere Filter
	    	$_SESSION[$this->tableName.$this->bID."parentid"] = $this->parentId;
	    	$this->SQLFilter = ' parentBudgetId = '.$this->parentId;
	    }
    }

}
