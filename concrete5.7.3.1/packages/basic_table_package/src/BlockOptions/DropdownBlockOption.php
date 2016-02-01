<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Core\Support\Facade\Log;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionSetOrderException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionValueException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\FieldTypes\DropdownField;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use OpenCloud\Common\Log\Logger;

/**
 * Class TextBlockOption
 * @package Application\Block\BasicTableBlock
 * @Entity
 * @Entity
 * @Table(name="DropDownBlockOptions")
 */
class DropdownBlockOption extends TableBlockOption{





    protected $possibleValues = array(
        "test" => 1,
        "test2" => 1,
    );

    /**
     *
     */
    public function __construct(){
        parent::__construct();
        $field = new DropdownField("value",t('Wert'),t('postWert'));
        $field->setOptions($this->possibleValues);
        $this->setControllerFieldType("value",$field);
    }


    /**
     * text block option does not need to check the values
     * @param $value
     * @return bool
     */
    protected function checkValue($value){
        return true;
    }
}