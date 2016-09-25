<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.08.16
 * Time: 18:03
 */

namespace Concrete\Package\BaclucPersonPackage\Src\FieldTypes\AddressField;


use Concrete\Package\BaclucPersonPackage\Src\AddressInterface;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownMultilinkFieldAssociated;

class AddressField extends DropdownMultilinkFieldAssociated
{
    public function getFormView($form, $clientSideValidationActivated = true)
    {
        $addresses = $this->getValue();
        //make html before rows
        $html = "";
        foreach($addresses as $address){
            $html.=$this->buildFormRow($address);
        }
        //append add button

        //close html around

        return $html;

    }

    protected function buildFormRow(AddressInterface $rowvalue){
        $classname = get_class($rowvalue);
        /**
         * @var callable $displayfunction
         */
        $displayfunction = $classname::getDefaultGetDisplayStringFunction();
        return $displayfunction($rowvalue);
    }

}