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
     * @OneToMany(targetEntity="Concrete\Package\BasicTablePackage\Src\BlockOptions\GroupRefOptionGroup",mappedBy="GroupRefOption")
     * @JoinTable(name="grouprefoption_grouprefoptions_groups",
     *      joinColumns={@JoinColumn(name="tableblockoption_id", referencedColumnName="id", onDelete = "CASCADE")},
     *      inverseJoinColumns={@JoinColumn(name="grouprefoptions_group_id", referencedColumnName="group_id", onDelete = "CASCADE")}
     *      )
     */
    protected $GroupAssociations;
    public function __construct()
    {
        $this->GroupAssociations = new ArrayCollection();
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
            $this->fieldTypes['GroupAssociations']->setLabel($this->optionName);
            $this->fieldTypes['GroupAssociations']->setPostName(str_replace(" ", "", $this->optionName));
        }
        return $this->fieldTypes['GroupAssociations'];
    }
    public function getValue(){
        if($this->GroupAssociations instanceof PersistentCollection){
            $this->GroupAssociations = new ArrayCollection($this->GroupAssociations->toArray());
        }
        return $this->GroupAssociations;
    }
    public function setValue($GroupAssociations){
        if($GroupAssociations instanceof PersistentCollection){
            $GroupAssociations = new ArrayCollection($GroupAssociations->toArray());
        }
        if($GroupAssociations instanceof  Entity){

            $idfieldname =$GroupAssociations->getIdFieldName();
            $optionValue = $this->getEntityManager()
                ->getRepository($GroupAssociations::getFullClassName())
                ->findOne(array(
                    $GroupAssociations->getIdFieldName() => $GroupAssociations->$idfieldname
                ));
        }elseif($GroupAssociations instanceof ArrayCollection){

            foreach($this->GroupAssociations->toArray() as $key => $value){
                $this->GroupAssociations->removeElement($value);
            }
            foreach($GroupAssociations->toArray() as $key => $value){
                $idfieldname =$value->getIdFieldName();
                $this->getEntityManager()->persist($value);
                $this->GroupAssociations->add($value);
            }

        }



    }
}