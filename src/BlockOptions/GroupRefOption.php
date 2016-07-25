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
        $this->Groups = $Groups;
    }
}