<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Core\Block\View\BlockView;
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
	protected $errMsg=null;
	protected $isSQLValue = false;
	protected $showInForm = true;
	protected $showInTable = true;
    protected $nullable = true;
    const REPLACE_BRACE_IN_ID_WITH='-';
    /**
     * @var BlockView
     */
    protected $view;



    const NULLERRORMSG = ' cannot be empty.';

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

	public function addValidationAttributes($attributes){

            if(!$this->nullable){
                $attributes['required']='true';
                $attributes['data-parsley-required']='true';
            }

            return $attributes;
    }



	public function getFormView($form, $clientSideValidationActivated = true){
		$returnString = "<label for='".$this->getHtmlId()."'>".$this->getLabel()."</label>";

        $attributes = array('title' => $this->getPostName(),
            'value' => $this->getValue(),
            'id' => $this->getHtmlId(),
        );

        if($clientSideValidationActivated){
            $attributes = $this->addValidationAttributes($attributes);
        }


		$returnString.=$form->text($this->getPostName(), $this->getValue(),$attributes);
		$returnString.=$this->getHtmlErrorMsg();
		return $returnString;
	}


	public function getHtmlErrorMsg(){
		if($this->errMsg != null){
			return "
				<div class='alert alert-danger'>".$this->errMsg."</div>
			";
		}
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
	    if(!$this->nullable && strlen($value)==0) {
	        $this->errMsg = $this->getLabel().t(static::NULLERRORMSG);
	        return false;
        }

		$this->setValue($value);
		return true;
	}

	public function getErrorMsg(){
		return $this->errMsg;
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


		/**
		 * set the error message to display
     * @param string $msg
     * @return $this
     */
		public function setErrorMessage($msg){
			$this->errMsg = $msg;
			return $this;
		}


    /**
     * @param boolean $nullable
     * @return $this
     */
		public function setNullable($nullable){
		    $this->nullable = $nullable;
            return $this;
        }


    /**
     * @return BlockView
     */
    public function getView()
    {
        return $this->view;
    }

    /**
     * @param BlockView $view
     * @return $this
     */
    public function setView($view)
    {
        $this->view = $view;
        return $this;
    }

    public function getHtmlId(){
        return str_replace(array('[',']'), static::REPLACE_BRACE_IN_ID_WITH, $this->getPostName());
    }

}
