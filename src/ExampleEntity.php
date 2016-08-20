<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 21.12.15
 * Time: 14:53
 */

namespace Concrete\Package\BaclucPersonPackage\Src;
use Doctrine\Common\Collections\ArrayCollection;


/**
 * Class Person
 * @package Concrete\Package\BaclucPersonPackage\Src
 * @Entity
 * @Table(name="bacluc_person")
 */
class Person extends Entity
{
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    protected $surname;

    protected $lastname;

    protected $birthdate;

    protected $public_foto_allowed;

    protected $Parents;

    protected $Children;

    protected $Notes;



    public function __construct(){
        parent::__construct();
        if($this->Parents == null){
            $this->Parents = new ArrayCollection();
        }


        if($this->Children == null){
            $this->Children = new ArrayCollection();
        }

        if($this->Notes == null){
            $this->Notes = new ArrayCollection();
        }

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