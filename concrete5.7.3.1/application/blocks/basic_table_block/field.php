<?php
namespace Application\Block\BasicTableBlock;

use Concrete\Core\Block\BlockController;
use Loader;
use Page;
use User;
use Core;

class Field{
	protected $sqlFieldname;
	protected $label;
	protected $validation;
	protected $value;
	protected $postName;
	protected $errMsg="";
	protected $isSQLValue = false;
	
	public function __construct($sqlFieldname,$label, $postName){
		
		$this->sqlFieldname = $sqlFieldname;
		$this->label = $label;
		$this->postName = $postName;
	}
	
	public function setValue($value){
		$this->isSQLValue = false;
		$this->value = $value;
	}
	
	public function setSQLValue($value){
		$this->isSQLValue = true;
		$this->value = $value;
	}
	
	public function getSQLValue(){
		return $this->value;
	}
	
	public function getTableView(){
		return $this->getValue();
	}
	
	
	
	public function getFormView($form){
		$returnString = "<label for='".$this->getPostName()."'>".$this->getPostName()."</label>";
		$returnString.=$form->text($this->getPostName(), $this->getValue(),array('title' => $this->getPostName(),
				'value' => $this->getValue(),
				'id' => $this->getPostName()
			)
		);
		return $returnString;
	}
	
	public function getLabel(){
		return $this->label;
	}
	
	public function getValue(){
		return $this->value;
	}
	
	public function getPostName(){
		return $this->postName;
	}
	
	public function getSQLFieldName(){
		return $this->sqlFieldname;
	}
	
	public function validatePost($value){
		$this->setValue($value);
		return true;
	}
	
	public function getErrorMsg(){
		return $this->errorMsg;
	}
	
	
	
	
}