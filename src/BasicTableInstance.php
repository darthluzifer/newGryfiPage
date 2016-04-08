<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 07.12.15
 * Time: 22:01
 */

namespace Concrete\Package\BasicTablePackage\Src;

use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Console\Helper\Table;

/**
 * Class BasicTableInstance
 * Just an Id to connect the Block with TableBlockOptions
 * @package Concrete\Package\BasicTablePackage\Src
 * @Entity
 * @Table(name="btBasicTableInstance")
 */
class BasicTableInstance extends Entity
{
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $bID;

    /**
     * @var ArrayCollection
     * @OneToMany(targetEntity="Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption", mappedBy="BasicTableInstance")
     **/
    protected $tableBlockOptions;

    public function __construct()
    {
        $this->tableBlockOptions = new ArrayCollection();
        $this->fieldTypes['bID']=new FieldTypes\Field('bID', 'bID', 'identifier');
        $this->fieldTypes['tableBlockOptions']=new FieldTypes\Field('value', 'Wert', 'wert');

    }
    public function addBlockOption(TableBlockOption $option){
        $this->tableBlockOptions[] = $option;
    }

    public function removeBlockOption(TableBlockOption $option){
        $this->tableBlockOptions->removeElement($option);
    }


    public function get($name)
    {
        if(property_exists($this, $name)
            && !in_array($name, $this->protect)
            && !in_array($name, $this->protectRead)
            && !in_array($name, $this->fieldTypes)) {

            $returnvar = $this->{$name};
            if(property_exists($this, "gID")){
                $returnvar2 = $this->gID;
            }

            return $returnvar;
        }
    }

    public function set($name, $value)
    {
        if(property_exists($this, $name)
            && !in_array($name, $this->protect)
            && !in_array($name, $this->protectWrite)
            && !in_array($name, $this->fieldTypes)
        ) {
            $this->$name = $value;
        }
    }

    public function __get($name)
    {
        $returnvar = $this->get($name);
        return $returnvar;
    }

    public function __set($name, $value)
    {
        $this->set($name, $value);
    }

    public function getId(){
        return $this->bID;

    }

    public function getIdFieldName(){
        return "bID";
    }



}