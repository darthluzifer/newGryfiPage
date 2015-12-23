<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;

use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
class CanEditOption extends TableBlockOption{
    protected $possibleValues = array(
        "test" => 1,
        "test2" => 1,
    );



    /**
     * @\Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption
     */
    protected $fieldType;

    public function __construct(){

    }

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

    public function getLabel(){
        return t('Welche Gruppen können Eintäge editieren?');
    }


}