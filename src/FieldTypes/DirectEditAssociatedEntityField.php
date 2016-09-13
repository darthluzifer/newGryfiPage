<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.08.16
 * Time: 18:59
 */

namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;


use Concrete\Package\BasicTablePackage\Src\Entity;

class DirectEditAssociatedEntityField extends DropdownLinkField implements DirectEditInterface
{



    /**
     * @param $form
     * @return string
     */
    public function getFormView($form){
        /**
         * @var Entity $value
         */
        $value = $this->getSQLValue();
        $html = "
        <div class='subentityedit col-xs-12'>
            
            <label>".$this->getLabel()."</label>
            <div class='row'>
        ";

        $classname = $this->targetEntity;

        /**
         * @var Entity $entityForFields
         */
        $entityForFields = new $classname();


        //get the fields to show in the form

        $fields = $entityForFields->getFieldTypes();


        //build the form
        /**
         * @var Field $field
         */
        foreach ($fields as $field){
            //if id or another directedit possibility, skip (because of possible circle)
            if($field->getSQLFieldName() == $entityForFields->getIdFieldName() || $field instanceof DirectEditInterface){
                continue;
            }

            if(is_null($value)){
                $setValue = null;
            }else{
                $setValue = $value->get($field->getSQLFieldName());
            }
            //set the value
            $field->setSQLValue($setValue);
            //change the post name
            $field->setPostName($this->getPostName()."[".$field->getPostName()."]");
            //get the form view
            $html.=$field->getFormView($form);
        }









        // TODO put the id in the form somehow

        $html.="</div>
           </div>
        ";
        //TODO get javascript logic for editing existing object or create new one

        return $html;
    }

    public function validatePost($value)
    {
        if($value == null || !is_array($value)){
            $this->setSQLValue(null);
        }
        //TODO first check if new entry or existing should be used

        //create entity or modify it
        $newModel = new $this->targetEntity;

        $fields = $newModel->getFieldTypes();

        /**
         * @var Field $field
         */
        foreach ($fields as $field){
            if($field->getSQLFieldName() == $newModel->getIdFieldName() || $field instanceof DirectEditInterface){
                continue;
            }
            if($field->validatePost($value[$field->getPostName()])){
                $newModel->set($field->getSQLFieldName(), $field->getSQLValue());
            }
        }



        //persist it

        $this->getEntityManager()->persist($newModel);
        //set the value
        $this->setSQLValue($newModel);
        return true;
    }
}