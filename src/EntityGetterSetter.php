<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 20.08.16
 * Time: 10:37
 */

namespace Concrete\Package\BasicTablePackage\Src;

/**
 * Class EntityGetterSetter
 * @package Concrete\Package\BasicTablePackage\Src
 * Because the getter and setter method of Class Entity has only access to their members, and not to the members of the subclasses
 * (where the getters and setters are really needed), one hat to copy the getters and setters to every class.
 * Now, they are extracted to this trait
 */
trait EntityGetterSetter
{


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
            if($this->$name instanceof ArrayCollection || $this->$name instanceof  PersistentCollection){
                $this->$name = $this->mergeCollections($this->$name,$value);
                return $this;
            }

            $this->$name = $value;
            return $this;
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