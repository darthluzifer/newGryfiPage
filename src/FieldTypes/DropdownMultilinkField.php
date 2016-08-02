<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownLinkField as DropdownLinkField;
use Concrete\Package\EntitiesExample\Src\Entity;
use Doctrine\ORM\PersistentCollection;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Block\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Class DropdownMultilinkField
 * @package Concrete\Package\BasicTablePackage\Src\FieldTypes
 * Field for an n;m relation with bootstrap tagsinput
 * TODO change to twitter tagsinput, bootstrap tagsinput is depricated
 */
class DropdownMultilinkField extends DropdownLinkField{
    protected $linktable;
    protected $ntomtable;
    protected $sqlfilter = " 1=1 ";
    protected $sqlvars = array();
    protected $showcolumn;
    protected $isNullable = false;
    protected $linkfieldself;
    protected $linkfieldext;
    protected $rowid;
    protected $idfieldext;
    protected $idfieldself;
    protected $values = array();
    protected $allowAdd = false;



    /**
     * set the tablename of the n to m table
     * @param String $tablename
     */
    public function setNtoMTable( $tablename){
        $this->ntomtable = $tablename;
    }

    /**
     * set the colname of the column that points to the self table
     * @param String $colname
     */
    public function setLinkFieldSelf( $colname){
        $this->linkfieldself = $colname;
    }

    /**
     * set the colname of the column that points to the extern table
     * @param String $colname
     */
    public function setLinkFieldExt( $colname){
        $this->linkfieldext = $colname;
    }


    /**
     * set the colname of the idfield of the own table
     * @param String $colname
     */
    public function setIdFieldSelf( $colname){
        $this->idfieldself = $colname;
    }

    public function getIdFieldSelf(){
        return $this->idfieldself;
    }

    /**
     * set the colname id Field in the linktable
     * @param String $colname
     */
    public function setIdFieldExt( $colname){
        $this->idfieldext = $colname;
    }

    /**
     * set the id of the row the col is in
     * @param String $colname
     */
    public function setRowId( $id){
        $this->rowid = $id;
        $this->value = array();
    }

    public function setAllowAdd($isAllowed = true){
        $this->allowAdd = $isAllowed;
    }

    public function setValue($value){

        $this->value = $value;
    }

    public function getTableView(){
        $values = $this->getValues();
        if($values instanceof  PersistentCollection || $values instanceof  ArrayCollection){
            $values = $values->toArray();
        }

        $string = "";
        if(is_array($values)){
            $first = true;

            foreach($values as $valuenum => $value){
                $appendString = "";
                if(is_object($value)){
                    $classname = get_class($value);
                    if($value instanceof  Entity){
                        $function = $classname::getDefaultGetDisplayStringFunction();
                        $appendString = $function($value);
                    }
                }else{
                    $appendString = $value;
                }

                if($first){
                    $first = false;
                }else{
                    $string.=", ";
                }
                $string.= $appendString;
            }
        }
        return $string;
    }


    public function getFormView($form){
        $html = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";



        $values = $this->getValues();
        if($values instanceof  ArrayCollection){

            $values =$values->toArray();
        }elseif(is_array($values)){

        }else{

            $values = array();
        }

        $valueStrings = array();

        //to display the values, we have to convert them to strings with our getDisplayString function
        $displayFunction = $this->getDisplayString;
        foreach($values as $num => $entity){
            if($entity instanceof  Proxy){
                $entity->__load();
            }

            $valueStrings[]= $displayFunction($entity);
        }


        $valuestring = implode(", ", $valueStrings);
        $html .= "<input type='text' width = '100%' id='".$this->getPostName()."' name ='".$this->getPostName()."' value='$valuestring'/>";


        $options = $this->getOptions();
        $sourcetext = "'".implode("', '", $options)."'";
        $allowadd = 'false';
        if($this->allowAdd){
            $allowadd = 'true';
        }

        $html .="
				<script type = 'text/javascript'>
					$(document).ready(function(e){
						$('#".$this->getPostName()."').tagsinput({
						  freeInput: $allowadd,
						  typeahead: {
						    source: [$sourcetext],
						    showHintOnFocus:true
						  }
						});
					});
				</script>
				";
        return $html;
    }



    public function getValue(){
        return $this->value;
    }





    public function validatePost($value){


        $postvalues = explode(",", $value);
        $targetModelForIdField = new $this->targetEntity;
        $options = $this->getOptions();

        $flipoptions = array_flip($options);

        $sqlArray = new ArrayCollection();
        foreach($postvalues as $num => $postvalue){
            $postvalue = trim($postvalue);
            if(in_array($postvalue, $options) ){
                $findItem = $this->getEntityManager()
                    ->getRepository($this->targetEntity)
                    ->findOneBy(array(
                        $targetModelForIdField->getIdFieldname()=>$flipoptions[$postvalue]
                    ));
                $sqlArray->add($findItem);
            }else{
               //TODO throw exception, if invalid values should produce an error message
            }
        }
        $this->setSQLValue($sqlArray);
        return true;
    }

    /**
     * get the Values of
     * @return ArrayCollection
     */
    private function getValues(){
        if(count($this->value)==0 && !is_null($this->rowid)) {
            $modelForIdField = new $this->targetEntity;
            /**
             * @var $model \Entity
             */
            $model = $this->getEntityManager()
                ->getRepository($this->targetEntity)
                ->findOneBy(array(
                    $modelForIdField->getIdFieldName() => $this->rowid
                ));
            $values = $model->get($this->sourceField);
            if(count($values)>0 && $values != null) {
                foreach ($model->get($this->sourceField) as $valnum => $value) {
                    $this->value[$value->getId()]=$this->getDisplayString($value);
                }
            }
        }

        return $this->value;

    }



    public function setSQLValue($value){
        if(count($value)==0){
            $this->value=new ArrayCollection();
        }elseif($value instanceof ArrayCollection){
            //check if values are of the right entitiy
            foreach($value->toArray() as $valnum => $valueitem){
                if(!$valueitem instanceof $this->targetEntity){
                    throw new InvalidArgumentException("Item number $valnum is ".get_class($valueitem).", should be ".$this->targetEntity." sein");
                }

                //s$this->em->persist($valueitem);
            }
            $this->value = $value;
        }


    }



}