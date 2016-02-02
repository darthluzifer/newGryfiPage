<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;

use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Doctrine\ORM\Mapping\Table;
use Concrete\Package\BasicTablePackage\Src\Group as Group;
use Doctrine\Common\Collections\ArrayCollection as ArrayCollection;
/**
 * Class CanEditOption
 * @package Concrete\Package\BasicTablePackage\Src\BlockOptions
 * @Entity
 */
class CanEditOption extends TableBlockOption{
    protected $possibleValues = array(
        "test" => 1,
        "test2" => 1,
    );



    /**
     * @var string
     * @Column(type="string")
     */
    protected $optionType;

    /**
     * @var ArrayCollection of Group
     * @ManyToMany(targetEntity="Concrete\Package\BasicTablePackage\Src\Group")
     * @JoinTable(name="caneditoptions_groups",
     *      joinColumns={@JoinColumn(name="tableblockoption_id", referencedColumnName="id")},
     *      inverseJoinColumns={@JoinColumn(name="group_id", referencedColumnName="gID")}
     *      )
     */
    protected $Groups;

    public function __construct()
    {
        $this->Groups = new ArrayCollection();

    }



/*
    public function setOwnFieldType($bid){
        $this->fieldType= new DropdownMultilinkField("testmultilink", "Gruppen", "testmultilink");
        $this->fieldType->setLinkTable("Groups");
        $this->fieldType->setShowColumn("gName");
        $this->fieldType->setIdField("gID");
        $this->fieldType->setNtoMTable('btBasicTableOption2Group');
        $this->fieldType->setLinkFieldSelf('optionID');
        $this->fieldType->setLinkFieldExt('groupID');
        $this->fieldType->setIdFieldSelf('id');
        $this->fieldType->setIdFieldExt('gID');
        $this->fieldType->setRowId($_SESSION['blockoptions'.$this->bID."rowid"]);

    }
*/
    public function getLabel(){
        return t('Welche Gruppen können Eintäge editieren?');
    }


}