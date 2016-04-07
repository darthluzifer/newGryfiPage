<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 21.12.15
 * Time: 14:53
 */

namespace Concrete\Package\BasicTablePackage\Src;



/**
 * Class ExampleEntity
 * @package Concrete\Package\BasicTablePackage\Src
 * @Entity
 * @Table(name="btExampleEntity")
 */
class ExampleEntity extends Entity
{
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
    protected $value;



    public function __construct(){
        parent::__construct();
        $this->fieldTypes['id']=new FieldTypes\Field('id', 'ID', 'identifier');
        $this->fieldTypes['value']=new FieldTypes\Field('value', 'Wert', 'wert');
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

}