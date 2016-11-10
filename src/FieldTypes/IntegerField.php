<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Core\Block\View\BlockView;
use Concrete\Core\Form\Service\Form;
use Doctrine\Common\Proxy\Exception\InvalidArgumentException;
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
class IntegerField extends Field {
	protected $step = 1;
    protected $min;
    protected $max;

    const NOINTERRORMSG = " must be an integer";
    const MINERRORMSG = " must be an higher than %s";
    const MAXERRORMSG = " must be lower than %s";
    const STEPERRORMSG = " must be in steps of %s";

    /**
     * @var EntityManager
     */
    protected $em;



	public function addValidationAttributes($attributes){

            $attributes = parent::addValidationAttributes($attributes);
            if(strlen($this->min) > 0){
                $attributes['min']=$this->min;
            }
        if(strlen($this->max) > 0){
            $attributes['max']=$this->max;
        }

        if(strlen($this->step)>0){
            $attributes['step']=$this->step;
        }

            return $attributes;
    }

    /**
     * @param int $step
     * @return $this
     */
    public function setStep($step)
    {
        if(filter_var($step, FILTER_VALIDATE_INT)===false){
            throw new \InvalidArgumentException("Step for Integer Field has to be Integer");
        }
        $this->step = $step;
        return $this;
    }

    /**
     * @param mixed $min
     * @return $this
     */
    public function setMin($min)
    {
        $this->min = $min;
        return $this;
    }

    /**
     * @param mixed $max
     * @return $this
     */
    public function setMax($max)
    {
        $this->max = $max;
        return $this;
    }







	public function validatePost($value){
        if(strlen($value)==0){
            $value = 0;
        }

	    if(!$this->nullable && strlen($value)==0) {
	        $this->errMsg = $this->getLabel().t(static::NULLERRORMSG);
	        return false;
        }

        if(filter_var($value, FILTER_VALIDATE_INT)===false){
            $this->errMsg = $this->getLabel().t(static::NOINTERRORMSG);
            return false;
        }
        $value = filter_var($value, FILTER_VALIDATE_INT);
        if(strlen($this->min)>0){
            if($value < $this->min){
                $this->errMsg = $this->getLabel().t(static::MINERRORMSG,$this->min);
                return false;
            }
        }

        if(strlen($this->max)>0){
            if($value > $this->max){
                $this->errMsg = $this->getLabel().t(static::MAXERRORMSG,$this->max);
                return false;
            }
        }

        if(strlen($this->step)>0){
            if($this->step != 'any') {
                $min = 0;
                if(strlen($this->min)>0){
                    $min = $this->min;
                }
                 $interval = $value - $min;

                if ($interval % $this->step == 0) {
                    $this->errMsg = $this->getLabel() . t(static::STEPERRORMSG, $this->step);
                    return false;
                }
            }
        }

		$this->setValue($value);
		return true;
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
        $returnString = static::inputType($this->getHtmlId(), $this->getPostName(), "number", $value, $attributes, $form);
        $returnString .= $this->getHtmlErrorMsg();
        return $returnString;
    }


}
