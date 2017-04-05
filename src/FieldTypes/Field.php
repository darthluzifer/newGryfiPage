<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Core\Block\View\BlockView;
use Concrete\Core\Form\Service\Form;
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
     * @var bool
     */
    protected $notSet = false;

    protected $default = null;
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

            if(!$this->nullable){
                $attributes['required']='true';
                $attributes['data-parsley-required']='true';
            }

            return $attributes;
    }



	public function getFormView($form, $clientSideValidationActivated = true){
		$returnString = "<label for='".$this->getHtmlId()."'>".$this->getLabel()."</label>";

        $returnString .= $this->getInputHtml($form, $clientSideValidationActivated);
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


        public function getNullable(){
            return $this->nullable;
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


    /**
     * Create an HTML fragment of attribute values, merging any CSS class names as necessary.
     *
     * @param string $defaultClass Default CSS class name
     * @param array $attributes A hash array of attributes (name => value), possibly including 'class'.
     *
     * @return string A fragment of attributes suitable to put inside of an HTML tag
     */
    public static function parseMiscFields($defaultClass, $attributes)
    {
        $attributes = (array) $attributes;
        if ($defaultClass) {
            $attributes['class'] = trim((isset($attributes['class']) ? $attributes['class'] : '') . ' ' . $defaultClass);
        }
        $attr = '';
        foreach ($attributes as $k => $v) {
            $attr .= " $k=\"$v\"";
        }

        return $attr;
    }

    /**
     * Internal function that creates an <input> element of type $type. Handles the messiness of evaluating $valueOrMiscFields. Assigns a default class of ccm-input-$type.
     *
     * @param string $key The name/id of the element.
     * @param string $type Accepted value for HTML attribute "type"
     * @param string|array $valueOrMiscFields The value of the element or an array with additional fields appended to the element (a hash array of attributes name => value), possibly including 'class'.
     * @param array $miscFields (used if $valueOrMiscFields is not an array) Additional fields appended to the element (a hash array of attributes name => value), possibly including 'class'.
     * @param Form $form
     *
     * @return string

     */
    public static function inputType($id,$key, $type, $valueOrMiscFields, $miscFields,$form)
    {
        if (is_array($valueOrMiscFields)) {
            $value = '';
            $miscFields = $valueOrMiscFields;
        } else {
            $value = $valueOrMiscFields;
        }

        $value = h($value);

        return "<input type=\"$type\" id=\"$id\" name=\"$key\" value=\"$value\"" . static::parseMiscFields("form-control ccm-input-$type", $miscFields) . ' />';
    }

    /**
     * @param $form
     * @param $clientSideValidationActivated
     * @param $returnString
     * @return string
     */
    public function getInputHtml($form, $clientSideValidationActivated)
    {
        $attributes = array('title' => $this->getPostName(),
            'value' => $this->getValue(),
            'id' => $this->getHtmlId(),
        );

        if ($clientSideValidationActivated) {
            $attributes = $this->addValidationAttributes($attributes);
        }

        $value = $this->getValue();
        $default = $this->getDefault();
        if($value == null && $default != null){
            $value = $default;
        }
        /**
         * @var Form $form
         */
        $returnString = static::inputType($this->getHtmlId(), $this->getPostName(), "text", $value, $attributes, $form);
        $returnString .= $this->getHtmlErrorMsg();
        return $returnString;
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
