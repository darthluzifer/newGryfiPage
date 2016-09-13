<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Doctrine\Common\Proxy\Exception\InvalidArgumentException;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Pages\Types\Permissions;
use Concrete\Core\Block\View\BlockView as View;

/**
 * Class DropdownLinkField
 * @package Concrete\Package\BasicTablePackage\Src\FieldTypes
 * A Dropdownfield which lists other instances
 */
class DropdownLinkField extends DropdownField{
    protected $linktable;
    protected $sqlfilter = " 1=1 ";
    protected $sqlvars = array();
    protected $showcolumn;
    protected $isNullable = false;
    protected $idField = 'id';
    /**
     * @var Entity
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
     * @var array
     */
    protected $filter;

    protected $isBidirectional = false;

    //TODO check if $callable's first parameter is of class Entity
    /**
     * set the Info for the Link table
     * @param Entity $sourceEntity
     * @param $sourceField
     * @param $targetEntity
     * @param null $targetField
     * @param callable|null $getDisplayString to overrride the default getDisplayStringFunction provided by the Entity
     * @param array|null $filter
     */
    public function setLinkInfo($sourceEntity, $sourceField, $targetEntity, $targetField = null, callable $getDisplayString=null, array $filter = null){
        $this->sourceEntity = $sourceEntity;
        $this->sourceField = $sourceField;
        $this->targetEntity = $targetEntity;
        $this->targetField = $targetField;
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
        $target->setLinkInfo($source->getSourceEntity()
            , $source->getSourceField()
            ,$source->getTargetEntity()
            , $source->getTargetField()
            ,$source->getGetDisplayStringFunction()
            ,$source->getFilter()
        );
    }

    public function setGetDisplayString(callable $getDisplayString){
        $this->getDisplayString = $getDisplayString;
        return $this;
    }

    public function setFilter(array $filter){
        $this->filter = $filter;
        return $this;
    }

    public function setIsBidirectional($bool){
        $this->isBidirectional = $bool;
        return $this;
    }

    public function getIsBidirectional(){
        return $this->isBidirectional;
    }

    /**
     * set the tablename of the linktable (Table, the foreign key points to
     * @param String $tablename
     */
    public function setLinkTable( $tablename){
        $this->linktable = $tablename;
        return $this;
    }

    /**
     * sets the sql filter string for prepare and the vars to insert
     * @param String $sqlfilter
     * @param array $sqlvars
     */
    public function setSQLFilter( $sqlfilter, array $sqlvars = array()){
        $this->sqlfilter = $sqlfilter;
        $this->sqlvars = $sqlvars;
        return $this;
    }

    /**
     * sets the columnname which should be shown
     * @param String $showcolumnname
     */
    public function setShowColumn( $showcolumnname){
        $this->showcolumn = $showcolumnname;
        return $this;
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
     * set if the col is nullable
     * @param Boolean $isNullable
     */
    public function setNullable($isNullable = true){
        $this->isNullable = $isNullable;
        return $this;
    }

    /**
     *
     * @return boolean
     */
    public function getNullable(){
        return $this->isNullable;
    }

    /**
     * set the Fieldname of the idField to save in db
     * @param String $idfieldname
     */
    public function setIdField( $idfieldname){
        $this->idField = $idfieldname;
        return $this;
    }

    /**
     *
     * @return string
     */
    public function getIdField(){
        return $this->idField;
    }

    /**
     * @return array of options
     */
    public function getOptions(){
        /**
         * @var $em EntityManager
         */
        $em = $this->getEntityManager();

        
//TODO implement filter for options
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

        if($this->getNullable()){
            $options = array(""=>"")+$options;
        }
        $this->setOptions($options);
        return $this->options;


    }


    /**
     * @return Entity
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
        if(is_null($this->value)){
            return "";
        }

        if($this->options == null){
            $this->getOptions();
        }

        return $this->options[$this->value->getId()];
    }

    public function validatePost($value){
        $values = array_keys($this->getOptions());
        if(in_array($value, $values)){
            $modelForIdField = new $this->targetEntity;
            $model = $this->getEntityManager()
                ->getRepository($this->targetEntity)
                ->findOne(array(
                    $modelForIdField->getIdFieldName() => $value
                ));

            if($model != null && $model!=false){
                $this->setSQLValue($model);
            }else{
                $this->setSQLValue(null);
            }

        }else{
            return false;
        }
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

    public function getFilter(){
        return $this->filter;
    }



}