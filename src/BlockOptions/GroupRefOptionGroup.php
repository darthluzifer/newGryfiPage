<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;


use Concrete\Package\BasicTablePackage\Src\AssociationEntity;
use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

/**
 * Class EventGroup
 * @package Concrete\Package\BaclucEventPackage\Src
 * @Entity
 * @Table(name="grouprefoption_group")
 *
 */
class GroupRefOptionGroup extends AssociationEntity
{

    /**
     * @var int
     * @Id @Column(type="integer")
     * @GeneratedValue(strategy="AUTO")
     */
    protected $id;
    /**
     *
     * @var GroupRefOption
     * @ManyToOne(targetEntity="GroupRefOption", inversedBy="GroupAssociations")
     * @JoinColumn(name="grouprefoption_id", referencedColumnName="id",onDelete="CASCADE")
     */
    protected $GroupRefOption;

    /**
     *
     * @var Group
     * @ManyToOne(targetEntity="Concrete\Package\BasicTablePackage\Src\Group")
     * @JoinColumn(name="group_id", referencedColumnName="gID",onDelete="CASCADE")
     */
    protected $Group;



    public function __construct(){
        parent::__construct();
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