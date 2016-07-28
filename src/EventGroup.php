<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BaclucEventPackage\Src;


use Concrete\Package\BasicTablePackage\Src\AssociationEntity;
use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

/**
 * Class EventGroup
 * @package Concrete\Package\BaclucEventPackage\Src
 * @Entity
 * @ORM\Table(name="event_group")
 */
class EventGroup extends AssociationEntity
{
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     *
     * @var Event
     * @ORM\ManyToOne(targetEntity="Event", inversedBy="GroupAssociations")
     * @ORM\JoinColumn(name="event_id", referencedColumnName="id")
     */
    protected $Event;

    /**
     *
     * @var Group
     * @ORM\ManyToOne(targetEntity="Group")
     * @ORM\JoinColumn(name="group_id", referencedColumnName="gID")
     */
    protected $Group;


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