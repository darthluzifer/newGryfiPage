<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 23.03.17
 * Time: 14:49
 */

namespace Concrete\Package\BasicTablePackage\Src\Import;


use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Doctrine\ORM\Query\Expr\Base;

class ComparisonSet
{
    /**
     * @var BaseEntity
     */
    protected $currentModel;

    /**
     * @var BaseEntity
     */
    protected $importModel;

    /**
     * @var BaseEntity
     */
    protected $resultModel;

    /**
     * @return BaseEntity
     */
    public function getCurrentModel()
    {
        return $this->currentModel;
    }

    /**
     * @param BaseEntity $currentModel
     * @return ComparisonSet
     */
    public function setCurrentModel(BaseEntity $currentModel)
    {
        $this->currentModel = $currentModel;
        return $this;
    }

    /**
     * @return BaseEntity
     */
    public function getImportModel()
    {
        return $this->importModel;
    }

    /**
     * @param BaseEntity $importModel
     * @return ComparisonSet
     */
    public function setImportModel(BaseEntity $importModel)
    {
        $this->importModel = $importModel;
        return $this;
    }

    /**
     * @return BaseEntity
     */
    public function getResultModel()
    {
        return $this->resultModel;
    }

    /**
     * @param BaseEntity $resultModel
     * @return ComparisonSet
     */
    public function setResultModel(BaseEntity $resultModel)
    {
        $this->resultModel = $resultModel;
        return $this;
    }

    public function compareAndCreateResultModel(){
        if($this->currentModel == null){
            $this->resultModel = $this->importModel;
            return $this;
        }

        //TODO what happens if importmodel is null

        $classname = get_class($this->currentModel);
        $resultModel = new $classname;
        foreach ($this->currentModel->getFieldTypes() as $sqlFieldName => $fieldType){
            switch ($fieldType) {

                default:
                    if($sqlFieldName ==$this->currentModel->getIdFieldName()){
                        $this->resultModel->set($sqlFieldName, $this->currentModel->getId());
                    }else{
                        $this->resultModel->set($sqlFieldName, $this->importModel->get($sqlFieldName));
                    }
                    break;
            }
        }

    }

    public function isCurrentAndResultSame(){
        if($this->resultModel == null){
            //TODO maybe throw exception instead
            $this->compareAndCreateResultModel();
        }
        $fieldTypes = $this->resultModel->getFieldTypes();
        foreach($fieldTypes as $sqlFieldName => $field){
            if($this->currentModel->get($sqlFieldName) != $this->resultModel->get($sqlFieldName)){
                return false;
            }
        }
        return true;

    }


}