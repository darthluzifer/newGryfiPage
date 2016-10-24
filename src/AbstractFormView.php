<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 21.10.16
 * Time: 07:44
 */

namespace Concrete\Package\BasicTablePackage\Src;


use Concrete\Core\Form\Service\Form;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field;

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

    public function getFilledVariables($clientSideValidationActivated = true){
        $fields =$this->entity->getFieldTypes();
        $variables =array();
        foreach ($fields as $field){
            /**
             * @var Field $field
             */
            //if id or another directedit possibility, skip (because of possible circle)
            if(($field instanceof DirectEditInterface && strlen($this->parentpostname)>0) || !$field->showInForm()){
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
                $field->setPostName($this->parentpostname . "[" . $field->getPostName() . "]");
            }
            if(isset($this->errorMsg[$field->getPostName()])){
                $field->setErrorMessage($this->errorMsg[$field->getPostName()]);
            }

            //get the form view
            $variables[$field->getSQLFieldName()]['input'] = $field->getInputHtml($this->form, $clientSideValidationActivated);
            $variables[$field->getSQLFieldName()]['label']=$field->getLabel();
            $field->setErrorMessage(null);
        }

        return $variables;

    }

    abstract public function getFormView($form, $clientSideValidationActivated=true);
}