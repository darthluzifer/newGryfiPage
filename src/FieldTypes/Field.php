<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Doctrine\ORM\EntityManager;
use Loader;
use Page;
use User;
use Core;
use Concrete\Core\Package\Package as Package;

/**
 * Class Field
 * @package Concrete\Package\BasicTablePackage\Src\FieldTypes
 * A normal textfield, provides most of the methods for subfieldTypes
 */
class Field{
	protected $sqlFieldname;
	protected $label;
	protected $validation;
	protected $value;
	protected $postName;
	protected $errMsg="";
	protected $isSQLValue = false;
	protected $showInForm = true;
	protected $showInTable = true;

    /**
     * @var EntityManager
     */
    protected $em;
	
	public function __construct($sqlFieldname,$label, $postName, $showInTable = true, $showInForm = true){
		
		$this->sqlFieldname = $sqlFieldname;
		$this->label = $label;
		$this->postName = $postName;
		$this->showInTable = $showInTable;
		$this->showInForm = $showInForm;
		
	}
	
	public function setValue($value){
		$this->isSQLValue = false;
		$this->value = $value;
        return $this;
	}


	
	public function setSQLValue($value){
		$this->isSQLValue = true;
		$this->value = $value;
        return $this;
	}

	public function setLabel($label){
		$this->label = $label;
        return $this;
	}

	public function setPostName($postname){
		$this->postName = $postname;
        return $this;
	}
	
	public function getSQLValue(){
		return $this->value;
	}
	
	public function getTableView(){
		return $this->getValue();
	}
	
	
	
	public function getFormView($form){
		$returnString = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";
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
	
	public function showInForm(){
		return $this->showInForm;
	}
	
	public function showInTable(){
		return $this->showInTable;
	}

    /**
     * @return EntityManager
     */
    public function getEntityManager(){
        if($this->em == null){

            $pkg = Package::getByHandle('basic_table_package');
            $this->em = $pkg->getEntityManager();
            return $this->em;
        }else{
            return $this->em;
        }
    }

    /**
     * @param boolean $showInForm
     * @return $this
     */
    public function setShowInForm($showInForm){
        $this->showInForm = $showInForm;
        return $this;
    }

    /**
     * @param boolean $showInTable
     * @return $this
     */
    public function setShowInTable($showInTable){
        $this->showInTable = $showInTable;
        return $this;
    }



}