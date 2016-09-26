<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Core\Support\Facade\Log;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionSetOrderException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionValueException;
use Concrete\Package\BasicTablePackage\Src\EntityGetterSetter;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownField;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use OpenCloud\Common\Log\Logger;

/**
 * Class TextBlockOption
 * @package Application\Block\BasicTableBlock
 * @Entity
 * @Table(name="DropDownBlockOptions")
 */
class DropdownBlockOption extends TableBlockOption{

    use EntityGetterSetter;




    protected $possibleValues = null;

    /**
     *
     */
    public function __construct(){
        parent::__construct();

    }

    public function setDefaultFieldTypes(){
        $field = new DropdownField("optionValue",t('Value'),t('postValue'));
        $this->setControllerFieldType("optionValue",$field);
    }

    public function setPossibleValues($possibleValues){
        parent::setPossibleValues($possibleValues);
        $this->getFieldType()->setOptions($this->possibleValues);
    }



}