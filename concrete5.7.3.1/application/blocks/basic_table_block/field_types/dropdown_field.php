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

	
	public function setValue($value){
		
		$this->value = $value;
	}

	public function getTableView(){
		return $this->options[$this->getValue()];
	}


	public function getFormView($form){
		return $form->select($this->getPostName(), $this->options,$this->getValue());
	}



	public function getValue(){
		return $this->value;
	}





	public function validatePost($value){
		$values = array_keys($this->options);
		if(in_array($value, $values, true)){
			return true;
		}else{
			return false;
		}
	}



}