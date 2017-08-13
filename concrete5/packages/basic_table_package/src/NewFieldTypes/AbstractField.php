<?php
namespace Concrete\Package\BasicTablePackage\Src\NewFieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Core\Block\View\BlockView;
use Concrete\Core\Form\Service\Form;
use Concrete\Package\BasicTablePackage\Src\NewFieldTypes\EditRepresentation;
use Concrete\Package\BasicTablePackage\Src\NewFieldTypes\FieldType;
use Concrete\Package\BasicTablePackage\Src\NewFieldTypes\Validator;
use Concrete\Package\BasicTablePackage\Src\NewFieldTypes\ViewRepresentation;
use Doctrine\ORM\EntityManager;
use Loader;
use Page;
use User;
use Core;
use Concrete\Core\Package\Package as Package;

/**
 * Class Field
 * @IgnoreAnnotation("package")
 *  Concrete\Package\BasicTablePackage\Src\FieldTypes
 * A normal textfield, provides most of the methods for subfieldTypes
 */
abstract class AbstractField implements FieldType
{
	protected $sqlFieldname;
	protected $label;
	protected $value;
	protected $postName;
	protected $errMsg=null;
	protected $showInForm = true;
	protected $showInTable = true;
    protected $nullable = true;
    const REPLACE_BRACE_IN_ID_WITH='-';
    /**
     * @var bool
     */
    protected $notSet = false;

    protected $default = null;

    const NULLERRORMSG = ' cannot be empty.';

    /**
     * @var EntityManager
     */
    protected $em;

    /**
     * @var Validator
     */
    protected $validator;

    /**
     * @var EditRepresentation
     */
    protected $editRepresentation;

    /**
     * @var ViewRepresentation
     */
    protected $viewRepresentation;



	public function __construct($sqlFieldname,$label, $postName, $showInTable = true, $showInForm = true){

		$this->sqlFieldname = $sqlFieldname;
		$this->label = $label;
		$this->postName = $postName;
		$this->showInTable = $showInTable;
		$this->showInForm = $showInForm;

	}





	public function setSQLValue($value){
		$this->validator->setSQLValue($value);
		$this->value = $this->validator->getSQLValue();
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
	    $this->viewRepresentation->setValue($this->value);
		return $this->viewRepresentation->getViewRepresentation();
	}

    /**
     * @param $default
     * @return $this
     */
	public function setDefault($default){
	    $this->default = $default;
        return $this;
    }

    public function getDefault(){
        return $this->default;
    }

	public function addValidationAttributes($attributes){

        return $this->editRepresentation->addValidationAttributes($attributes);
//            if(!$this->nullable){
//                $attributes['required']='true';
//                //parsley dependendt, TODO extract
//                $attributes['data-parsley-required']='true';
//            }
//
//            return $attributes;
    }



	public function getFormView($form, $clientSideValidationActivated = true){
	    $this->editRepresentation->setValue($this->value);
		return $this->editRepresentation->getEditRepresentation( $form, $clientSideValidationActivated);
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


	public function getPostName(){
		return $this->postName;
	}

	public function getSQLFieldName(){
		return $this->sqlFieldname;
	}

	public function validatePost($value){
	    if($this->validator->validatePost($value) === false) {
	        $this->errMsg = $this->validator->getErrorMsg();
	        return false;
        }

		$this->value = $this->validator->getSQLValue();
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


        public function getNullable(){
            return $this->nullable;
        }




    public function getHtmlId(){
        return str_replace(array('[',']'), static::REPLACE_BRACE_IN_ID_WITH, $this->getPostName());
    }




    /**
     * @param $form
     * @param $clientSideValidationActivated
     * @param $returnString
     * @return string
     */
    public function getInputHtml($form, $clientSideValidationActivated)
    {

        return $this->editRepresentation->getInputHtml($form, $clientSideValidationActivated);
    }

    /**
     * @return bool
     */
    public function isNotSet()
    {
        return $this->notSet;
    }

    /**
     * @param bool $notSet
     */
    public function setNotSet($notSet)
    {
        $this->notSet = $notSet;
    }


}
