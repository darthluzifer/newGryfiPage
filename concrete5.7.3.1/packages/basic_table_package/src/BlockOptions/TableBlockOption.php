<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Core\Support\Facade\Log;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionSetOrderException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionValueException;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use OpenCloud\Common\Log\Logger;

/**
 * @Entity
 * @InheritanceType("JOINED")
 * @DiscriminatorColumn(name="discr", type="string")
 * @Table{name="TableBlockOption"}
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
     * @ManyToOne(targetEntity="Concrete\Package\BasicTablePackage\Src\BasicTableInstance", inversedBy="tableBlockOptions", cascade={"persist"})
     * @JoinColumn(name="bID", referencedColumnName="bID", nullable=false, onDelete="CASCADE")
     **/
    protected $BasicTableInstance;



    /**
     * @var array
     */
    protected $optionTypes = array();


    protected $possibleValues = array(
        "test" => 1,
        "test2" => 1,
    );

    /**
     *
     */
    public function __construct(){
        $this->setDefaultFieldTypes();
        $this->optionTypes[CanEditOption::class] = 1;
        $this->optionTypes[TextBlockOption::class] = 1;
        $this->optionTypes[DropdownBlockOption::class] = 1;
    }




    public function set($name, $value)
    {
        //to check the value, optionType and optionValue have to be set
        $checkvalue = false;
        if(count($this->optionTypes) == 0){
            $this->__construct();
        }
        //\Log::debug(var_dump($this->optionTypes));

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
            if(!$this->optionTypes[$this->optionType]->checkValue($value)){
                throw new InvalidBlockOptionValueException("The value $value is invalid for TableBlockOption ".$this->optionType);
            }
        }
        parent::set($name, $value);

    }

    protected function checkValue($value){
        return isset($this->possibleValues[$value]);
    }

    public function setPossibleValues(array $possibleValues){
        $this->possibleValues = $possibleValues;
    }

    /**
     * @return Concrete\Package\BasicTablePackage\Src\FieldTypes\Field
     */
    public function getFieldType(){
        return $this->fieldTypes['optionValue'];
    }
}