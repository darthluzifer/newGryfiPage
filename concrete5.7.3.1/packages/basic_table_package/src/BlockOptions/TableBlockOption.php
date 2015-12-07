<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionSetOrderException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionValueException;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Src\BlockOptions\CanEditOption;
/**
 * Class BasicTableBlockOption
 * @package Application\Block\BasicTableBlock
 * @Entity
 * @Table(name="BasicTableBlockOption")
 */
class TableBlockOption extends Entity{
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     * @Column(type="string")
     */
    protected $optionType;

    /**
     * @var string
     * @Column(type="string")
     */
    protected $optionValue;

    /**
     * @var
     */
    protected $BasicTableInstance;



    /**
     * @var array
     */
    protected $optionTypes = array();

    /**
     *
     */
    public function __construct(){

        $this->optionTypes[get_class(new CanEditOption())] = new CanEditOption();

    }




    public function set($name, $value)
    {
        //to check the value, optionType and optionValue have to be set
        $checkvalue = false;

        //check if OptionType is valid
        if($name == 'optionType'){
            if(!isset($this->optionTypes[$value])){
                throw new InvalidBlockOptionException("The TableBlockOption $value is not a valid TableBlockOption");
            }
            if(isset($this->optionValue)){
                if(!$this->optionTypes[$value]->checkValue($this->optionValue)){
                    $this->optionValue = null;
                }
            }
        }

        //check if option value is valid
        if($name == 'optionValue'){
            if(!isset($this->optionType)) {
                throw new InvalidBlockOptionSetOrderException("You cannot set the option value without setting the option type");
            }
            if(!$this->optionTypes[$value]->checkValue($this->optionValue)){
                throw new InvalidBlockOptionValueException("The value $value is invalid for TableBlockOption ".$this->optionType);
            }
        }
        parent::set($name, $value);

    }

    protected function checkValue($value){
        return true;
    }
}