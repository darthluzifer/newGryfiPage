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

use Concrete\Package\BasicTablePackage\Src\Exceptions\ConsistencyCheckException;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DateField as DateField;
use Concrete\Core\Package\Package;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownLinkField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownMultilinkField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownMultilinkFieldAssociated;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\FloatField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\HiddenField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\IntegerField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\BooleanField;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Proxy\Exception\InvalidArgumentException;
use Doctrine\DBAL\Types\BooleanType;
use Doctrine\ORM\PersistentCollection;
use Doctrine\ORM\Proxy\Proxy;
use Doctrine\ORM\QueryBuilder;
use Doctrine\ORM\Mapping\ClassMetadata;


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
    protected $defaultFormView = false;
    protected $defaultSubFormView = false;
    protected $checkingConsistency = false;

    public static $staticEntityfilterfunction;
    public static $baseEntityfilterFunction;

    public function __construct(){
       // $this->setDefaultFieldTypes();
        $this->setDefaultFormViews();
    }

    public function setDefaultFormViews(){

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

    /**
     * @return \Closure
     * @override
     */
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

                    case 'boolean':
                        $this->fieldTypes[$fieldname] = new BooleanField($fieldname, t($fieldname), t("post" . $fieldname));
                        break;
                    case 'date':
                        $this->fieldTypes[$fieldname] = new DateField($fieldname, t($fieldname), t("post" . $fieldname));
                        break;
                    case 'integer':
                        $this->fieldTypes[$fieldname] = new IntegerField($fieldname, t($fieldname), t("post" . $fieldname));
                        break;
                    case 'float':
                        $this->fieldTypes[$fieldname] = new FloatField($fieldname, t($fieldname), t("post" . $fieldname));
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
                $this->fieldTypes[$associationMeta['fieldName']]->setLinkInfo($this,$associationMeta['fieldName'],$associationMeta['targetEntity'],$associationMeta['mappedBy'],$associationMeta['type'],$associationMeta['targetEntity']::getDefaultGetDisplayStringFunction() );
            }elseif($metadata->isCollectionValuedAssociation($associationMeta['fieldName'])){
                 //create instance of targetentity to check wether it is a assocationentity or a direct assocation
                $targetEntityInstance = new $associationMeta['targetEntity'];
                if($targetEntityInstance instanceof  ExtendedAssociationEntity){

                }elseif($targetEntityInstance instanceof AssociationBaseEntity){
                    $this->fieldTypes[$associationMeta['fieldName']] = new DropdownMultilinkFieldAssociated($associationMeta['fieldName'], t($associationMeta['fieldName']), t("post" . $associationMeta['fieldName']));
                }else {
                    $this->fieldTypes[$associationMeta['fieldName']] = new DropdownMultilinkField($associationMeta['fieldName'], t($associationMeta['fieldName']), t("post" . $associationMeta['fieldName']));
                }
                $this->fieldTypes[$associationMeta['fieldName']]->setLinkInfo($this,$associationMeta['fieldName'],$associationMeta['targetEntity'],$associationMeta['mappedBy'],$associationMeta['type'],$associationMeta['targetEntity']::getDefaultGetDisplayStringFunction());
            }
        }

        if($this->getId()==null){
            $this->setDefaultValues();
        }

    }

    /**
     * @return $this
     */
    public function setDefaultValues(){
        return $this;
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
                $sqlValue = $this->get($sqlfieldname);
                if($sqlValue instanceof BaseEntity){
                    $jsonObj->{$value->getPostname()}=$sqlValue->getId();
                }else {
                    if($sqlValue === true){
                        $sqlValue = 1;
                    }
                    if($sqlValue === false){
                        $sqlValue = 0;
                    }
                    $jsonObj->{$value->getPostname()} = $value->setSQLValue($sqlValue)->getTableView();
                }
            }
        }
        return $jsonObj;
    }

    public function getTypeaheadTemplate(){

        $template = "<div>{{uniqueIdString}}</div>";

        return $template;
    }


    public function getDefaultFormView($form, $clientSideValidationActivated = true){
        if($this->defaultFormView !== false){
            return $this->defaultFormView;
        }
        return false;

    }


    public function getDefaultSubFormView($form,$clientSideValidationActivated = true){
        if($this->defaultSubFormView !== false){
            return $this->defaultSubFormView->getFormView($form,$clientSideValidationActivated);
        }
        return $this->getDefaultFormView($form,$clientSideValidationActivated);

    }

    public static function getBaseEntityFromProxy(BaseEntity $item){
        if(!($item instanceof Proxy)){
            return $item;
        }
        //to get em, we need package first
        $pkg = Package::getByHandle("basic_table_package");
        $em = $pkg->getEntityManager();
        return $em->getRepository(get_class($item))
            ->findOneBy(
                array(
                    $item->getIdFieldName()=>$item->getId()
                )
            );
    }

    /**
     * Because of possible cycles, checkConsistency Function of every Entity must be a semaphore
     * @return array
     * @throws ConsistencyCheckException
     */
    public function checkConsistency(){
        if($this->checkingConsistency){
            throw new ConsistencyCheckException("Already checking Consistency of this Entity");
        }
        $this->checkingConsistency = true;
        $this->checkingConsistency = false;
        return array();
    }

    public static function getEntityManagerStatic(){
        $pkg = Package::getByHandle("basic_table_package");
        return $pkg->getEntityManager();
    }


    /**
     * @param null $classname if no classname is passed, the static classname is used
     * @param callable|null $addFilterFunction
     * if $addFilterFunciton is BaseEntity::$staticEntityfilterfunction, then
     * the function gets switched to  $addFilterFunction = static::$staticEntityfilterfunction;
     * null : no filter
     * if you really want to use the filter of BaseEntity, use:
     * BaseEntity::$baseEntityfilterFunction
     *
     * @return QueryBuilder
     *
     * $addFilterFunction must be of signature and is called in this function:
     * /**
     * @param QueryBuilder $query
     * @param array $queryConfig
     *  array of:
     * array(
    'fromEntityStart' => array('shortname'=> 'e0'
     *                                                       , 'class'=>get_class($this->model)
     *                                             )
     *       ,'firstAssociationFieldname'=> array('shortname' => 'e1'
     *                                                                           , 'class' => 'Namespace\To\Entity\Classname')
     *
     * );
     * @return QueryBuilder

     *
     */
    public static function getBuildQueryWithJoinedAssociations($classname, callable $addFilterFunction =null){

        if($classname == null){
            throw new InvalidArgumentException("the first parameter cannot be null");
        }

        //if the staticEntityfilterfunction was passed, then use the staticEntityfilterFunciton of the Entity called
        if($addFilterFunction == self::$staticEntityfilterfunction){
            $fullclassname = $classname;
            if($classname[0]!='\\'){
                $fullclassname = '\\'.$classname;
            }
            $addFilterFunction = $fullclassname::$staticEntityfilterfunction;
        }


        //TODO check if addFilterFunciton has the right signature

        //
        $selectEntities = static::getSelectEntitiesOf($classname);



        /**
         * @var QueryBuilder $query
         */
        $query = static::getEntityManagerStatic()->createQueryBuilder();

        //add select

        $entities = $selectEntities;

        $selectString = "";
        $entityCounter = 0;
        foreach($entities as $fieldname => $entityName){
            if($entityCounter > 0){
                $selectString.=",";
            }
            $selectString.=" e".$entityCounter++;
        }
        $query->select($selectString);


        $query->from(reset(array_keys($entities)), "e0");

        $entityCounter = 1;
        $first = true;
        /**
         * build an array with
         * array(sqlfieldname => array('shortname'=> e1, 'class'=> classname))
         * first entry is fromEntityStart
         */
        foreach($selectEntities as $fieldName => $entityName){
            if($first){

                //first entity is the from clause, so no join required
                $first = false;
                continue;
            }
            $query->leftJoin("e0.".$fieldName, "e".$entityCounter++);

        }

        $queryConfig = static::getQueryConfigOf($classname);


        if($addFilterFunction != null){
          $query = $addFilterFunction($query,$queryConfig);
        }

        return $query;
    }


    /**
     * @param $classname
     * @return array of the associated entities with $classname, or static::getFullClassName if $classname is null
     * is in form of:
     * array(
        Namespace\To\StartEntity\Classname => null,
     * 'associationfieldname' => Namespace\To\Association\Classname
     * );
     */
    public static function getSelectEntitiesOf($classname){

        $selectEntities = array($classname=>null);

        /**
         * @var ClassMetadata $metadata
         */
        $metadata = static::getEntityManagerStatic()->getMetadataFactory()->getMetadataFor($classname);
        foreach($metadata->getAssociationMappings() as $mappingnum => $mapping){
            $targetEntityInstance = new $mapping['targetEntity'];
            $selectEntities[$mapping['fieldName']] = $mapping['targetEntity'];

        }

        return $selectEntities;

    }

    /**
     * @param string $classname
     * @return array
     * array(
    'fromEntityStart' => array('shortname'=> 'e0'
     *                                                       , 'class'=>get_class($this->model)
     *                                             )
     *       ,'firstAssociationFieldname'=> array('shortname' => 'e1'
     *                                                                           , 'class' => 'Namespace\To\Entity\Classname')
     *
     * );
     */
    public static function getQueryConfigOf($classname){
        if($classname == null){
            throw new InvalidArgumentException("the parameter cannot be null");
        }

        $selectEntities = static::getSelectEntitiesOf($classname);
        $first = true;
        $entityCounter = 1;
        foreach($selectEntities as $fieldName => $entityName){
            if($first){
                $queryConfig['fromEntityStart']= array('shortname'=> "e0"
                ,'class' => $classname
                );
                //first entity is the from clause, so no join required
                $first = false;
                continue;
            }else{
                $queryConfig[$fieldName]= array('shortname'=> "e".$entityCounter
                ,'class' => $entityName
                );
            }

        }

        return $queryConfig;

    }



}

/**
 * @param QueryBuilder $query
 * @param array $queryConfig
 * @return QueryBuilder
 * if you want to change the defaultFilterFunction of an Entity, put this statement under your class,
 * but with your classname of course
 */
BaseEntity::$staticEntityfilterfunction = function(QueryBuilder $query, array $queryConfig = array()){
    return $query;
};

/**
 * @param QueryBuilder $query
 * @param array $queryConfig
 * @return QueryBuilder
 * the filter funciton of base entity
 */
BaseEntity::$baseEntityfilterFunction = function(QueryBuilder $query, array $queryConfig = array()){
    return $query;
};
