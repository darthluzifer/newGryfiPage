<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.08.16
 * Time: 19:01
 */

namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;


use Concrete\Core\Device\DeviceInterface;
use Concrete\Core\Html\Object\Collection;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\PersistentCollection;
use Concrete\Core\Support\Facade\Application;
use Symfony\Component\HttpFoundation\Session\Session;

class DirectEditAssociatedEntityMultipleField extends DropdownMultilinkField implements DirectEditInterface
{
    const PREPEND_BEFORE_REALNAME = "bacluc_inline_form";

    protected $subErrorMsg = array();

    public function getFormView($form, $clientSideValidationActivated = true){


        /**
         * @var Entity $value
         */
        $values = $this->getSQLValue();

        $this->loadSubErrorMsg();

        if($values instanceof  \Doctrine\Common\Collections\Collection ){
            $values = $values->toArray();
        }
        $html = "
        <div class='subentityedit col-xs-12'>

            <label>".$this->getLabel()."</label>
            <div class='row'>

        ";
        if(count($values)>0){
            $html.="<button type='button' value='' class='btn bacluc-inlineform actionbutton add'><i class ='fa fa-plus'></i></button>";
        }

        $classname = $this->targetEntity;

        /**
         * @var Entity $entityForFields
         */
        $entityForFields = new $classname();


        //get the fields to show in the form

        $fields = $entityForFields->getFieldTypes();


        $html.="<div class='bacluc-realrows '>";
        //build the forms
        $rownum = 0;
        if(count($values)>0) {

            foreach($values as $value) {
                $html.="<div class='col-xs-12'>
                    <div class='subentityrowedit row'>
                ";
                /**
                 * @var Field $field
                 */
                foreach ($fields as $field) {
                    //if id or another directedit possibility, skip (because of possible circle)
                    if ($field->getSQLFieldName() == $entityForFields->getIdFieldName() || $field instanceof DirectEditInterface) {
                        continue;
                    }

                    if (is_null($value)) {
                        $setValue = null;
                    } else {
                        $setValue = $value->get($field->getSQLFieldName());
                    }
                    //set the value
                    $field->setSQLValue($setValue);

                    $oldpostname = $field->getPostName();
                    //change the post name
                    $field->setPostName($this->getPostName() . "[".$rownum."][" . $field->getPostName() . "]");

                    if(isset($this->subErrorMsg[$rownum][$oldpostname])){
                        $field->setErrorMessage($this->subErrorMsg[$rownum][$oldpostname]);
                    }

                    //get the form view
                    $html .= $field->getFormView($form, $clientSideValidationActivated);
                    //reset the post name
                    $field->setPostName($oldpostname);
                    $field->setErrorMessage(null);
                }
                //add delete button
                $html.="<button type='button' value='' class='btn bacluc-inlineform actionbutton delete'><i class ='fa fa-trash'></i></button>";

                //close row
                $html.="</div>
                </div>";
                $rownum++;


            }

        }
        $html.="</div>";

        //now add empty hidden rowform to add
        $html.="<div class='hidden_form_row'> ";
        $html.="<div class='col-xs-12'>
                    <div class='subentityrowedit row'>
                ";
        foreach ($fields as $field) {
            //if id or another directedit possibility, skip (because of possible circle)
            if ($field->getSQLFieldName() == $entityForFields->getIdFieldName() || $field instanceof DirectEditInterface) {
                continue;
            }
            //set the value
            $field->setSQLValue(null);
            //change the post name
            $field->setPostName( static::PREPEND_BEFORE_REALNAME.$field->getPostName());

            //get the form view
            $html .= $field->getFormView($form, $clientSideValidationActivated);
        }
        $html.="<button type='button' value='' class='btn bacluc-inlineform actionbutton delete'><i class ='fa fa-trash'></i></button>";

        //now add information to add new row
        $html.="<div class='rownum hiddenforminfo'>".$rownum."</div>";
        $html.="<div class='parent_postname hiddenforminfo'>".$this->getPostName()."</div>";
        $html.="<div class='parent_idname hiddenforminfo'>".$this->getHtmlId()."</div>";
        $html.="<div class='replace_brace_in_id_with hiddenforminfo'>".static::REPLACE_BRACE_IN_ID_WITH."</div>";
        $html.="<div class='prepended_before_realname hiddenforminfo'>".static::PREPEND_BEFORE_REALNAME."</div>";
        $html.="<div class='options_url hiddenforminfo'>".$this->view->action("get_options_of_field")."?fieldname=".$this->getPostName()."</div>";
        $html.="<div class='options_template hiddenforminfo'>".$entityForFields->getTypeaheadTemplate()."</div>";

        $html.="</div>
        </div>";
        $html.="</div>";

        //now add add button
        $html.="<button type='button' value='' class='btn bacluc-inlineform actionbutton add'><i class ='fa fa-plus'></i></button>";


        $html.="";






        $html.=$this->getHtmlErrorMsg();

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
            $this->setSQLValue(new ArrayCollection());
        }
        //TODO get the existing values


        //TODO compare with the sent, update if necessary

        //for first version, create for every post new entity, and persist it
        $collectarraycollection = new ArrayCollection();
        $error = false;

        if(count($value)>0) {
            foreach ($value as $rownum =>$postvalues) {
                if (!is_array($postvalues)) {
                    continue;
                }
                //create entity or modify it
                $newModel = new $this->targetEntity;

                $fields = $newModel->getFieldTypes();

                /**
                 * @var Field $field
                 */
                foreach ($fields as $field) {
                    if ($field->getSQLFieldName() == $newModel->getIdFieldName()
                        || $field instanceof DirectEditInterface
                    ) {
                        continue;
                    }
                    if ($field->validatePost($postvalues[$field->getPostName()])) {
                        $newModel->set($field->getSQLFieldName(), $field->getSQLValue());
                    }else{
                        $this->subErrorMsg[$rownum][$field->getPostName()] = $field->getErrorMsg();
                        $error = true;
                    }
                }

                if($error){
                    $this->errMsg = $this->getLabel().t(DirectEditAssociatedEntityField::SUBFORMERROR);
                    $this->saveSubErrorMsg();
                    return false;
                }


                //persist it

                $this->getEntityManager()->persist($newModel);
                $collectarraycollection->add($newModel);
            }
        }
        //set the value
        $this->setSQLValue($collectarraycollection);
        return true;

    }

    protected function saveSubErrorMsg(){
        $app = Application::getFacadeApplication();

        /**
         * @var Session $session
         */
        $session = $app['session'];

        $session->set($this->postName."subformerrors", $this->subErrorMsg);
    }

    protected function loadSubErrorMsg(){
        $app = Application::getFacadeApplication();

        /**
         * @var Session $session
         */
        $session = $app['session'];
        if(count($this->subErrorMsg)>0){
            $session->remove($this->postName."subformerrors");
            return $this->subErrorMsg;
        }


        $this->subErrorMsg=$session->get($this->postName."subformerrors", array());
        $session->remove($this->postName."subformerrors");
        return $this->subErrorMsg;

    }

}
