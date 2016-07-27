<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Doctrine\ORM\Mapping\Table;
use Concrete\Package\BasicTablePackage\Src\Group as Group;
use Doctrine\Common\Collections\ArrayCollection as ArrayCollection;
use Doctrine\ORM\PersistentCollection;
/**
 * Class GroupRefOption
 * @package Concrete\Package\BasicTablePackage\Src\BlockOptions
 * @Entity
 */
class GroupRefOption extends TableBlockOption{
    /**
     * @var string
     * @Column(type="string")
     */
    protected $optionType =__CLASS__;
    /**
     * @var ArrayCollection of Group
     * @ManyToMany(targetEntity="Concrete\Package\BasicTablePackage\Src\Group",cascade="persist")
     * @JoinTable(name="grouprefoption_groups",
     *      joinColumns={@JoinColumn(name="tableblockoption_id", referencedColumnName="id", onDelete = "CASCADE")},
     *      inverseJoinColumns={@JoinColumn(name="group_id", referencedColumnName="gID", onDelete = "CASCADE")}
     *      )
     */
    protected $Groups;
    public function __construct()
    {
        $this->Groups = new ArrayCollection();
        $this->optionType == __CLASS__;
        $this->setDefaultFieldTypes();
    }
    public function getLabel(){
        return t('Welche Gruppen betrifft dieser Block?');
    }
    public function getFieldType(){
        if($this->fieldTypes['optionValue']==null){
            $this->setDefaultFieldTypes();
        }
        if($this->optionName != null){
            $this->fieldTypes['Groups']->setLabel($this->optionName);
            $this->fieldTypes['Groups']->setPostName(str_replace(" ", "", $this->optionName));
        }
        return $this->fieldTypes['Groups'];
    }
    public function getValue(){
        if($this->Groups instanceof PersistentCollection){
            $this->Groups = new ArrayCollection($this->Groups->toArray());
        }
        return $this->Groups;
    }
    public function setValue($Groups){
        if($Groups instanceof PersistentCollection){
            $Groups = new ArrayCollection($Groups->toArray());
        }
        if($Groups instanceof  Entity){

            $idfieldname =$Groups->getIdFieldName();
            $optionValue = $this->getEntityManager()
                ->getRepository($Groups::getFullClassName())
                ->findOne(array(
                    $Groups->getIdFieldName() => $Groups->$idfieldname
                ));
        }elseif($Groups instanceof ArrayCollection){

            foreach($this->Groups->toArray() as $key => $value){
                $this->Groups->removeElement($value);
            }
            foreach($Groups->toArray() as $key => $value){
                $idfieldname =$value->getIdFieldName();
                $this->Groups->add(
                    /*$this->getEntityManager()
                    ->getRepository(get_class($value))
                    ->findOneBy(array(
                        $value->getIdFieldName() => $value->$idfieldname
                    ))*/
                    $this->getEntityManager()->getReference(get_class($value), $value->$idfieldname)
                );
            }

        }



    }
}