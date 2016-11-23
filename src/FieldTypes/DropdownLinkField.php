<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Doctrine\Common\Proxy\Exception\InvalidArgumentException;
use Doctrine\ORM\Mapping\ClassMetadataInfo;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Pages\Types\Permissions;
use Concrete\Core\Block\View\BlockView as View;

/**
 * Class DropdownLinkField
 * @IgnoreAnnotation("package")
 *  Concrete\Package\BasicTablePackage\Src\FieldTypes
 * A Dropdownfield which lists other instances
 */
class DropdownLinkField extends DropdownField{
    protected $linktable;
    protected $sqlfilter = " 1=1 ";
    protected $sqlvars = array();
    protected $showcolumn;
    protected $idField = 'id';
    /**
     * @var BaseEntity
     */
    protected $sourceEntity;

    /**
     * @var String
     */
    protected $sourceField;

    /**
     * @var string
     */
    protected $targetEntity;

    /**
     * @var callable
     */
    protected $getDisplayString;
    /**
     * @var string
     */
    protected $targetField;

    /**
     * @var callable
     */
    protected $filter;

    protected $isBidirectional = false;

    protected $associationType;

    const DEFAULT_ASSOCIATION_TYPE = ClassMetadataInfo::MANY_TO_ONE;


    //TODO check if $callable's first parameter is of class Entity
    /**
     * set the Info for the Link table
     * @param BaseEntity $sourceEntity
     * @param $sourceField
     * @param $targetEntity
     * @param null $targetField
     * @param null $associationType
     * @param callable|null $getDisplayString to overrride the default getDisplayStringFunction provided by the Entity
     * @param array|callable|null $filter
     * @return $this
     */
    public function setLinkInfo($sourceEntity, $sourceField, $targetEntity, $targetField = null, $associationType = null, callable $getDisplayString = null, callable $filter = null){
        $this->sourceEntity = $sourceEntity;
        $this->sourceField = $sourceField;
        $this->targetEntity = $targetEntity;
        $this->targetField = $targetField;

        if($associationType == null){
            $this->associationType = static::DEFAULT_ASSOCIATION_TYPE;
        }


        $this->getDisplayString = $getDisplayString;
        if($this->getDisplayString == null){
            $this->getDisplayString = $targetEntity::getDefaultgetDisplayStringFunction();
        }
        $this->filter = $filter;
        return $this;
    }

    /**
     * @param DropdownLinkField $source
     * @param DropdownLinkField $target
     */
    public static function copyLinkInfo(DropdownLinkField $source, DropdownLinkField &$target){
        $target->setLinkInfo(
            $source->getSourceEntity()
            , $source->getSourceField()
            , $source->getTargetEntity()
            , $source->getTargetField()
            , $source->getAssociationType()
            , $source->getGetDisplayStringFunction()
            , $source->getFilter()
        );
    }

    public function setGetDisplayString(callable $getDisplayString){
        $this->getDisplayString = $getDisplayString;
        return $this;
    }

    public function setFilter(callable $filter){
        $this->filter = $filter;
        return $this;
    }

    public function getFilter(){
        return $this->filter;
    }

    public function setIsBidirectional($bool){
        $this->isBidirectional = $bool;
        return $this;
    }

    public function getIsBidirectional(){
        return $this->isBidirectional;
    }






    public function getTableView(){
        $value = $this->getSQLValue();
        if(is_null($value)){
            return "";
        }
        /**
         * @var callable $displayStringFunction
         */
        $displayStringFunction = $this->getDisplayString;
      return $displayStringFunction($value);
    }





    /**
     * @return array of options
     */
    public function getOptions(){
        /**
         * @var $em EntityManager
         */
        $em = $this->getEntityManager();


        $modelList=$this->em->getRepository($this->targetEntity)->findAll();

        $options = array();
        if(count($this->options)==0) {
            if (count($modelList) > 0) {

                foreach ($modelList as $model) {
                    if ($this->getDisplayString != null) {
                        $displayFunction = $this->getDisplayString;
                        $options[$model->getId()] = trim($displayFunction($model));
                    }
                }
            }
        }else{
            return $this->options;
        }

        if($this->getNullable() !==false){
            $options = array(""=>"")+$options;
        }
        $this->setOptions($options);
        return $this->options;


    }


    public function getFullOptions(){
        /**
         * @var $em EntityManager
         */
        $em = $this->getEntityManager();


//TODO implement filter for options
        $modelList=$this->em->getRepository($this->targetEntity)->findAll();

        $options = array();
        if (count($modelList) > 0) {

            /**
             * @var BaseEntity $model
             */
            foreach ($modelList as $model) {
                $model->setDefaultFieldTypes();
                $options[$model->getId()] = $model->toTableAssoc();
                $displayStringFunction = $this->getDisplayString;
                $options[$model->getId()]->uniqueIdString=$displayStringFunction($model);

            }
        }


        return $options;
    }



    /**
     * @return BaseEntity
     */
    public function getSQLValue(){
        return $this->value;

    }

    public function setSQLValue($value){
        if($value instanceof $this->targetEntity || is_null($value)){
            $this->value = $value;
        }else{
            throw new InvalidArgumentException("Parameter \$value is ".get_class($value).", should be ".$this->targetEntity." ");
        }
        return $this;
    }


    public function getValue(){
        return $this->value;
    }

    public function validatePost($value){

        $values = array_keys($this->getOptions());
        if(count($values)==0){
            return true;
        }
        if(in_array($value, $values)){
            $modelForIdField = new $this->targetEntity;
            $model = $this->getEntityManager()
                ->getRepository($this->targetEntity)
                ->findOneBy(array(
                    $modelForIdField->getIdFieldName() => $value
                ));

            if($model != null && $model!=false){
                $this->getEntityManager()->persist($model);
                $this->setSQLValue($model);
            }else{
                $this->setSQLValue(null);
            }

        }else{
            if($this->nullable !== false && $value == null){
                return true;
            }
            return false;
        }
        //because of directeditfield references of referenced object could have been changed, persist them too


        return true;
    }

    public function getSourceEntity(){
        return $this->sourceEntity;
    }

    public function getSourceField(){
        return $this->sourceField;
    }

    public function getTargetEntity(){
        return $this->targetEntity;
    }

    public function getTargetField(){
        return $this->targetField;
    }

    public function getGetDisplayStringFunction(){
        return $this->getDisplayString;
    }


    public function getInputHtml($form, $clientSideValidationActivated=true)
    {
        $value = $this->getValue();
        $default = $this->getDefault();
        if($value == null && $default != null){
            $value = $default;
        }
        if($this->value != null){
            $setValue = $value->getId();
        }else{

            $setValue = "";

        }
        $html = static::select($this->getHtmlId(), $this->getPostName(), $this->getOptions(), $setValue);

        $html .= $this->getHtmlErrorMsg();
        return $html;
    }


    public function setAssociationType($type){
        $this->associationType = $type;
        return $this;
    }

    public function getAssociationType(){
        return $this->associationType;
    }



}