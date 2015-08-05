<?php
namespace Application\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Field as Field;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Blocks\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;

class DropdownField extends Field{
	
	protected $options = array();

	public function __construct($sqlFieldname,$label, $postName){
		parent::__construct($sqlFieldname, $label, $postName);

	}
	
	/**
	 * Set the possible Options to choose from.
	 * @param array $options array of the options like array('dbvalue' => 'displayvalue')
	 * @return void
	 */
	public function setOptions (array $options){
		$this->options = $options;
	}
	
	
	public function getOptions(){
		return $this->options;
	}

	
	public function setValue($value){
		
		$this->value = $value;
	}

	public function getTableView(){
		$options = $this->getOptions();
		return $options[$this->getValue()];
	}


	public function getFormView($form){
		$html = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";
		$html .=$form->select($this->getPostName(), $this->getOptions(),$this->getValue());
		return $html;
	}



	public function getValue(){
		return $this->value;
	}





	public function validatePost($value){
		$values = array_keys($this->getOptions());
		if(in_array($value, $values)){
			return true;
		}else{
			return false;
		}
	}



}