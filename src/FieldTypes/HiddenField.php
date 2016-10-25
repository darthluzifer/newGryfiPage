<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 04.10.16
 * Time: 15:14
 */

namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;


use Concrete\Core\Form\Service\Form;

class HiddenField extends Field
{

    protected $showInTable = false;

    /**
     * @param Form $form
     * @param bool $clientSideValidationActivated
     * @return string
     */
    public function getFormView($form, $clientSideValidationActivated = true){
        return $this->getInputHtml($form, $clientSideValidationActivated);
    }

    /**
     * @return string
     */
    public function getInputHtml($form, $clientSideValidationActivated=true)
    {
        $returnString = "";


        $returnString .= '<input type="hidden" id="' . $this->getHtmlId() . '" name="' . $this->getPostName() . '" value="' . $this->getValue() . '" />';

        return $returnString;
    }

}