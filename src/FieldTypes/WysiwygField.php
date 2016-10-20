<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;


use Concrete\Core\Block\BlockController;
use Loader;
use Page;
use User;
use Core;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\HelperBlocks\Content\Controller as ContentController;
use Concrete\Core\Block\BlockType as BlockType;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\HelperbBlock\Content\Application\Block\BasicTableBlock\FieldTypes\HelperbBlock\Content;
use Concrete\Core\Legacy\FilePermissions as FilePermissions;
use Concrete\Core\Legacy\TaskPermission as TaskPermission;
use Concrete\Core\Editor\RedactorEditor;
//use Application\Block\BasicTableBlock\FieldTypes\HelperbBlock\Content\Test as Test;
/**
 * Class WysiwygField
 * @IgnoreAnnotation("package")\n*  Concrete\Package\BasicTablePackage\Src\FieldTypes
 * A Wysiwyg field, uses Helperclass which extends the ContentController of the Concrete Core,
 * so that he doesn't store the content in the Database himself,
 * but provides a method for this fieldtype to get the content and provide it for the blockcontroller to save it in the model
 */
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
        return $this;
	}

	public function setSQLValue($value){
		$this->isSQLValue = true;
		$this->value = $value;
		$this->blockController->setValue($value);
        return $this;
	}

	public function getSQLValue(){
		return $this->value;
	}

	public function getTableView(){
		return $this->blockController->getContent();
	}



	public function getFormView($form, $clientSideValidationActivated = true){
		$fp = FilePermissions::getGlobal();
		$tp = new TaskPermission();

//		$this->blockController->edit();
		$controller = $this->blockController;
		$html = '';
		//$html = "<label for='".$this->getPostName()."'>".$this->getPostName()."</label>";
		$html.=$form->label($this->getHtmlId(), t($this->getLabel()));
		$editor = new RedactorEditor();
		$html.=$editor->outputStandardEditor($this->getPostName(), $this->getValue());

	  $html.=$this->getHtmlErrorMsg();
		return $html;
	}



	public function getValue(){
		$this->value = $this->blockController->getValue();

		return $this->value;
	}

}
