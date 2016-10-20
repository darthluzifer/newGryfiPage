<?php

/**
 * This is a simple helper class that provides visibility to the object
 * properties outside of this class. By default, all properties are readable
 * and writable from outside of the entity class but each property can be
 * protected from both outside actions (read or write) with the $protect,
 * $protectRead and $protectWrite arrays as follows:
 * 
 * $protect      - All properties defined within this array are neither writable
 *                 nor readable. They are protected to be used only by this
 *                 entity class.
 * $protectRead  - All properties defined within this array are protected from
 *                 reading outside of this class. It means that they can only
 *                 be read within this entity class.
 * $protectWrite - All properties defined within this array are protected from
 *                 writing outside of this class. It means that they can only
 *                 be written within this entity class.
 * 
 * @author Antti Hukkanen <antti.hukkanen(at)mainiotech.fi>
 * @copyright 2014 Mainio Tech Ltd.
 * @license MIT
 */

namespace Concrete\Package\BasicTablePackage\Src;

use Concrete\Package\BasicTablePackage\Src\FieldTypes\DateField as DateField;
use Concrete\Core\Package\Package;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownLinkField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownMultilinkField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownMultilinkFieldAssociated;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\HiddenField;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\PersistentCollection;


/**
 * Class Entity
 * @IgnoreAnnotation("package")\n*  Concrete\Package\BasicTablePackage\Src
 * here are the most important methods for entities, so that they don't have to be implemented in every Entity, And that there are no errors if they are not implementet.
 */
abstract class BaseEntity
{
    use EntityGetterSetter;

    protected $protect = array();
    protected $protectRead = array();
    protected $protectWrite = array();
    protected $fieldTypes = array();
    protected $em;

    public function __construct(){
       // $this->setDefaultFieldTypes();
    }

    public static function getFullClassName(){
        return get_class();
    }


    public function setControllerFieldType($name, Field $field){
        if(property_exists($this, $name)
            && !in_array($name, $this->protect)
            && !in_array($name, $this->protectWrite)
            && !in_array($name, $this->fieldTypes)
        ) {
            $this->fieldTypes[$name]=$field;
        }
    }

    public function getFieldTypes(){
        if(count($this->fieldTypes) == 0){
            $this->setDefaultFieldTypes();
        }
        return $this->fieldTypes;
    }

    public static function getDefaultGetDisplayStringFunction(){
        $function = function(BaseEntity $item){
            $returnString = "";
            $metadata = $item->getEntityManager()->getMetadataFactory()->getMetadataFor(get_class($item));
            $fieldTypes = $item->get('fieldTypes');
            foreach ($metadata->getFieldNames() as $fieldnum => $fieldname) {
                    try {
                        $mapping = $metadata->getFieldMapping($fieldname);

                        if(isset($fieldTypes[$fieldname])){
                            $field = $fieldTypes[$fieldname];
                        }else {
                            switch ($mapping['type']) {

                                case 'datetime':
                                    $field = new DateField("justlocal", "justlocal", "justlocal");
                                    break;
                                default:
                                    $field = new Field("justlocal", "justlocal", "justlocal");
                                    break;
                            }
                        }
                        $sqlvalue = $item->$fieldname;
                        $field->setSQLValue($sqlvalue);
                        $returnString.=$field->getValue()." ";


                    }catch(MappingException $e){
                        //wenn das feld ein association mapping ist, dann gibts error
                        // $this->fieldTypes[$field] = new Field($field, t($field), t("post" . $field));
                    }
                }
            return $returnString;
        };
        return $function;
    }

    public function getAsAssoc(){
        $returnArray = array();
        foreach($this->fieldTypes as $key => $value){

            $returnArray[$key]=$this->get($key);
        }
        return $returnArray;
    }


    public function getEntityManager(){
        if($this->em == null){

            $pkg = Package::getByHandle('basic_table_package');
            $this->em = $pkg->getEntityManager();
            return $this->em;
        }else{
            return $this->em;
        }
    }

    public function getId(){
        return $this->get('id');
    }

    public function getIdFieldName(){
        return 'id';
    }

    /**
     * @throws \Doctrine\Common\Persistence\Mapping\MappingException
     * @throws \Exception
     */
    public function setDefaultFieldTypes(){


        $className = get_class($this);
        $em = $this->getEntityManager();

        $metadata = $this->getEntityManager()->getMetadataFactory()->getMetadataFor($className);

        //get the default field types for fieldnames
        foreach ($metadata->getFieldNames() as $fieldnum => $fieldname) {
            try {
                $mapping = $metadata->getFieldMapping($fieldname);
                switch ($mapping['type']) {

                    case 'date':
                        $this->fieldTypes[$fieldname] = new DateField($fieldname, t($fieldname), t("post" . $fieldname));
                        break;
                    default:
                        $this->fieldTypes[$fieldname] = new Field($fieldname, t($fieldname), t("post" . $fieldname));
                        break;
                }
                if($fieldname == static::getIdFieldName()){
                    $this->fieldTypes[$fieldname] = new HiddenField($fieldname, t($fieldname), t("post" . $fieldname));
                }
            }catch(MappingException $e){
                //wenn das feld ein association mapping ist, dann gibts error
               // $this->fieldTypes[$field] = new Field($field, t($field), t("post" . $field));
            }
        }
        if(strpos(get_called_class(), "CanEditOption")!== false){
            //var_dump($metadata->getAssociationMappings());
        }
        //get the default field types for associations:
        foreach($metadata->getAssociationMappings() as $className => $associationMeta){
            /*
             * to get defaultDisplayfunction, you have to use the full namespace, because in $className the namespace is missing, but it is in $associationMeta['targetEntitty']
             * */
            if($metadata->isSingleValuedAssociation($associationMeta['fieldName'])){

                $this->fieldTypes[$associationMeta['fieldName']] = new DropdownLinkField($associationMeta['fieldName'], t($associationMeta['fieldName']), t("post" . $associationMeta['fieldName']));
                $this->fieldTypes[$associationMeta['fieldName']]->setLinkInfo($this,$associationMeta['fieldName'],$associationMeta['targetEntity'],$associationMeta['mappedBy'],$associationMeta['targetEntity']::getDefaultGetDisplayStringFunction() );
            }elseif($metadata->isCollectionValuedAssociation($associationMeta['fieldName'])){
                 //create instance of targetentity to check wether it is a assocationentity or a direct assocation
                $targetEntityInstance = new $associationMeta['targetEntity'];
                if($targetEntityInstance instanceof  ExtendedAssociationEntity){

                }elseif($targetEntityInstance instanceof AssociationBaseEntity){
                    $this->fieldTypes[$associationMeta['fieldName']] = new DropdownMultilinkFieldAssociated($associationMeta['fieldName'], t($associationMeta['fieldName']), t("post" . $associationMeta['fieldName']));
                }else {
                    $this->fieldTypes[$associationMeta['fieldName']] = new DropdownMultilinkField($associationMeta['fieldName'], t($associationMeta['fieldName']), t("post" . $associationMeta['fieldName']));
                }
                $this->fieldTypes[$associationMeta['fieldName']]->setLinkInfo($this,$associationMeta['fieldName'],$associationMeta['targetEntity'],$associationMeta['mappedBy'],$associationMeta['targetEntity']::getDefaultGetDisplayStringFunction());
            }
        }

    }

    /**
     * @param ArrayCollection|PersistentCollection $coll1
     * @param ArrayCollection|PersistentCollection $coll2
     * @return ArrayCollection;
     */
    public function mergeCollections($coll1, $coll2){
        if($coll1 instanceof PersistentCollection){
            $coll1 = new ArrayCollection($coll1->toArray());
        }
        if($coll2 instanceof PersistentCollection){
            $coll2 = new ArrayCollection($coll2->toArray());
        }
        /**
         * @var ArrayCollection $coll1
         */
        /**
         * @var ArrayCollection $coll2;
         */
            $result = new ArrayCollection();
            foreach($coll2->toArray() as $key => $value){
                //wenn element in beiden Arrays
                if(!$result->contains($value)){
                    $result->add($value);
                }
            }

            //now delete not anymore existent elements
            foreach($coll1->toArray() as $key => $value){
                if(!$result->contains($value)){
                    if($value instanceof AssociationBaseEntity){
                        $this->getEntityManager()->remove($value);
                    }
                }
            }

            return $result;

    }

    public function toTableAssoc(){
        $jsonObj = new \stdClass();
        if(count($this->fieldTypes)>0){
            foreach ($this->fieldTypes as $sqlfieldname => $value){

                $jsonObj->{$value->getPostname()}=$value->setSQLValue($this->get($sqlfieldname))->getTableView();
            }
        }
        return $jsonObj;
    }

    public function getTypeaheadTemplate(){

        $template = "<div>{{uniqueIdString}}</div>";

        return $template;
    }

}
