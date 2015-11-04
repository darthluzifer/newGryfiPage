<?php
namespace Application\Block\BasicTableBlock\FieldTypes;


use Concrete\Core\Block\BlockController;
use Loader;
use Page;
use User;
use Core;
use Application\Block\BasicTableBlock\Field as Field;
use Application\Block\BasicTableBlock\FieldTypes\Helperblocks\Content\Controller as ContentController;
use Concrete\Core\Block\BlockType as BlockType;
use Application\Block\BasicTableBlock\FieldTypes\Helperblocks\Content\Application\Block\BasicTableBlock\FieldTypes\Helperblocks\Content;
use Concrete\Core\Legacy\FilePermissions as FilePermissions;
use Concrete\Core\Legacy\TaskPermission as TaskPermission;
//use Application\Block\BasicTableBlock\FieldTypes\Helperblocks\Content\Test as Test;

class WysiwygField extends Field{
	/**
	 * 
	 * @var \ContentController
	 */
	protected $blockController;	
	public function __construct($sqlFieldname,$label, $postName, $showInTable = false, $showInForm = true){
		
		$this->sqlFieldname = $sqlFieldname;
		$this->label = $label;
		$this->postName = $postName;
		$this->showInTable = $showInTable;
		$this->showInForm = $showInForm;
		$this->blockController = new ContentController();
		//$this->blockController->setSQLParams($targetTable, $targetCol, $targetIdField, $targetId)
		
	}
	
	
	public function setValue($value){
		$this->isSQLValue = false;
		$this->value = $value;
		$this->blockController->setValue($value);
	}
	
	public function setSQLValue($value){
		$this->isSQLValue = true;
		$this->value = $value;
		$this->blockController->setValue($value);
	}
	
	public function getSQLValue(){
		return $this->value;
	}
	
	public function getTableView(){
		return $this->blockController->getContent();
	}
	

	
	public function getFormView($form){
		$fp = FilePermissions::getGlobal();
		$tp = new TaskPermission();

		$this->blockController->edit();
		$controller = $this->blockController;
		$html = '';
		//$html = "<label for='".$this->getPostName()."'>".$this->getPostName()."</label>";
		$html.=$form->label($this->getPostName(), t($this->getLabel()));
		$html.='<textarea style="display: none" id="'.$this->getPostName().'" name="'.$this->getPostName().'">'.$controller->getContentEditMode().'</textarea>';
		
		//$html.='<div id="'.$this->getPostName().'">'.$controller->getContentEditMode().'</div>
		$html.='
		<script type="text/javascript">
		var CCM_EDITOR_SECURITY_TOKEN = \''.Loader::helper('validation/token')->generate('editor')."';
		$(function() {
		    $('#".$this->getPostName()."').redactor({
		        minHeight: '300',
		        'concrete5': {
		            filemanager: ".$fp->canAccessFileManager().",
		            sitemap: ".$tp->canAccessSitemap().",
		            lightbox: true
		        },
		        'plugins': [
		            'fontcolor', 'concrete5inline', 'concrete5', 'underline'
		        ]
		    });
		});
		</script>
		";
		$html.='</div>';
		//return '';
		return $html;
	}
	
	
	
	public function getValue(){
		$this->value = $this->blockController->getValue();
	
		return $this->value;
	}
	
}