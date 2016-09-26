<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.09.16
 * Time: 21:59
 */

namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;


class EmailField extends Field
{
    const EMAILFORMATERROR = " has to be a valid email address";


    public function getFormView($form, $clientSideValidationActivated = true){
        $returnString = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";
        $returnString.=$form->text($this->getPostName(), $this->getValue(),array('title' => $this->getPostName(),
                'value' => $this->getValue(),
                'id' => $this->getPostName()
            )
        );
        $returnString.=$this->getHtmlErrorMsg();
        return $returnString;
    }

    public function validatePost($value){
        if(!$this->nullable && strlen($value)==0) {
            $this->errMsg = $this->getLabel().t(static::NULLERRORMSG);
            return false;
        }

        if(!filter_var($value, FILTER_VALIDATE_EMAIL)){
            $this->errMsg = $this->getLabel().t(static::EMAILFORMATERROR);
            return false;

        }

        $this->setValue($value);
        return true;
    }
}