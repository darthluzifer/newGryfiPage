<?php
namespace Concrete\Package\BasicTablePackage\BasicTableBlock\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Field as Field;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Doctrine\Common\Proxy\Exception\InvalidArgumentException;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Pages\Types\Permissions;
use Concrete\Core\Block\View\BlockView as View;

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

    public function setLinkInfo(Entity $sourceEntity,string $sourceField,String $targetEntity,string $targetField = null, callable $getDisplayString=null, array $filter = null){
        $this->sourceEntity = $sourceEntity;
        $this->sourceField = $sourceField;
        $this->targetEntity = $targetEntity;
        $this->targetField = $targetField;
        $this->getDisplayString = $getDisplayString;
        $this->filter = $filter;
    }

    public function setGetDisplayString(callable $getDisplayString){
        $this->getDisplayString = $getDisplayString;
    }

    public function setFilter(array $filter){
        $this->filter = $filter;
    }

    public function setIsBidirectional($bool){
        $this->isBidirectional = $bool;
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
    }

    /**
     * sets the sql filter string for prepare and the vars to insert
     * @param String $sqlfilter
     * @param array $sqlvars
     */
    public function setSQLFilter( $sqlfilter, array $sqlvars = array()){
        $this->sqlfilter = $sqlfilter;
        $this->sqlvars = $sqlvars;
    }

    /**
     * sets the columnname which should be shown
     * @param String $showcolumnname
     */
    public function setShowColumn( $showcolumnname){
        $this->showcolumn = $showcolumnname;
    }

    /**
     * set if the col is nullable
     * @param Boolean $isNullable
     */
    public function setNullable($isNullable = true){
        $this->isNullable = $isNullable;
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

        

        $modelList=$this->entityManager->getRepository($this->targetEntity)->findAll();

        $options = array();
        if(count($this->options)==0) {
            if (count($modelList) > 0) {

                foreach ($modelList as $model) {
                    if ($this->getDisplayString != null) {
                        $options[$model->getId()] = $this->getDisplayString($model);
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


    public function getSQLValue(){
        if($this->value != null){
            $modelForIdField = new $this->targetEntity;
            $model = $this->getEntityManager()
                ->getRepository($this->targetEntity)
                ->findOne(array(
                    $modelForIdField->getIdFieldName() => $this->value
                ));

            if($model != null && $model!=false){
                return $model;
            }
        }else{
            return false;
        }
    }

    public function setSQLValue($value){
        if($value instanceof $this->targetEntity){
            $this->value = $value->get($value->getIdFieldName());
        }else{
            throw new InvalidArgumentException("Parameter \$value is ".get_class($value).", should be ".$this->targetEntity." sein");
        }
    }



}