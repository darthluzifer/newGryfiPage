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
class FloatField extends IntegerField {
    protected $step = 'any';

    const NOFLOATERRORMSG = " must be an float";

    /**
     * @var EntityManager
     */
    protected $em;




    /**
     * @param int $step
     * @return $this
     */
    public function setStep($step)
    {
        if(filter_var($step, FILTER_VALIDATE_FLOAT)===false){
            throw new \InvalidArgumentException("Step for Float Field has to be Float");
        }
        $this->step = $step;
        return $this;
    }








    public function validatePost($value){
        if(strlen($value)==0){
            $value = 0;
        }

        if(strpos($value,",")!== false){
            if(strpos($value,".")!==false){
                //point and comma are in string, so we have to look which one is only once
                $offsetComma = strpos($value,",");
                $secondComma = strpos($value,",",$offsetComma+1);

                $offsetPoint = strpos($value,".");
                $secondPoint = strpos($value,".",$offsetPoint+1);
                if($secondComma !== false && $secondPoint !== false){
                    //if multiple points and multiple commas, it is no float
                    $this->errMsg = $this->getLabel().t(static::NOFLOATERRORMSG);
                    return false;
                }elseif ($secondComma !== false && $secondPoint === false){
                    //remove commas, the point is the decimal sign
                    $value = str_replace(",","",$value);
                }elseif ($secondComma === false && $secondPoint !== false){
                    //remove points, the comma is the decimal sign
                    $value = str_replace(".","",$value);
                    //replace comma with point, because this is right
                    $value = str_replace(",",".", $value);
                }elseif ($secondComma === false && $secondPoint === false){
                    //both appear just once, the last one is the decimal operator
                    if($offsetComma > $offsetPoint){
                        //remove the point
                        $value = str_replace(".","",$value);
                        //replace comma with point, because this is right
                        $value = str_replace(",",".", $value);
                    }else{
                        //replace comma with nothing, because not needed
                        $value = str_replace(",","", $value);
                    }
                }
            }else{
                //TODO detect thousend seperation point
                $value = str_replace(",",".",$value);
            }

        }

        if(!$this->nullable && strlen($value)==0) {
            $this->errMsg = $this->getLabel().t(static::NULLERRORMSG);
            return false;
        }

        if(filter_var($value, FILTER_VALIDATE_FLOAT)===false){
            $this->errMsg = $this->getLabel().t(static::NOFLOATERRORMSG);
            return false;
        }
        $value = filter_var($value, FILTER_VALIDATE_FLOAT);
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


        /**
         * @var Form $form
         */
        $returnString = static::inputType($this->getHtmlId(), $this->getPostName(), "number", $this->getValue(), $attributes, $form);
        $returnString .= $this->getHtmlErrorMsg();
        return $returnString;
    }

}
