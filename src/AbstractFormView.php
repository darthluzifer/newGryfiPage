<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 21.10.16
 * Time: 07:44
 */

namespace Concrete\Package\BasicTablePackage\Src;


use Concrete\Core\Form\Service\Form;

abstract class AbstractFormView
{
    protected $entity;
    protected $form;
    protected $parentpostname = null;
    protected $errorMsg = null;
    protected $clientSideValidationActivated = true;

    public function __construct(BaseEntity $entity, $clientSideValidationActivated = true)
    {
        $this->entity = $entity;
        $this->clientSideValidationActivated = $clientSideValidationActivated;
    }

    public function setParentPostName($postname){
        $this->parentpostname = $postname;
        return $this;
    }

    public function setErrorMsg($errorMsg){
        $this->errorMsg =$errorMsg;
        return $this;
    }

    public function getFilledVariables(){
        $fields =$this->entity->getFieldTypes();
        $variables =array();
        foreach ($fields as $field){
            //if id or another directedit possibility, skip (because of possible circle)
            if(($field instanceof DirectEditInterface && $this instanceof AbstractSubFormView) || !$field->showInForm()){
                continue;
            }

            if(is_null($this->entity)){
                $setValue = null;
            }else{
                $setValue = $this->entity->get($field->getSQLFieldName());
            }
            //set the value
            $field->setSQLValue($setValue);

            if(strlen($this->parentpostname)>0) {
                //change the post name
                $field->setPostName($this->getPostName() . "[" . $field->getPostName() . "]");
            }
            if(isset($this->errorMsg[$field->getPostName()])){
                $field->setErrorMessage($this->errorMsg[$field->getPostName()]);
            }

            //get the form view
            $variables[$field->getSQLFieldName]['input'] = $field->getFormView($this->form, $this->clientSideValidationActivated);

            $field->setErrorMessage(null);
        }

    }

    abstract public function getFormView($form);
}