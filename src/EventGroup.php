<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BaclucEventPackage\Src;


use Concrete\Package\BasicTablePackage\Src\AssociationEntity;
use Concrete\Package\BasicTablePackage\Src\EntityGetterSetter;
use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

/**
 * Class EventGroup
 * @package Concrete\Package\BaclucEventPackage\Src
 * @Entity
 * @Table(name="bacluc_event_group")
 */
class EventGroup extends AssociationEntity
{
    use EntityGetterSetter;
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     *
     * @var Event
     * @ManyToOne(targetEntity="Event", inversedBy="EventGroups")
     * @JoinColumn(name="event_id", referencedColumnName="id", onDelete="CASCADE")
     */
    protected $Event;

    /**
     *
     * @var Group
     * @ManyToOne(targetEntity="Concrete\Package\BasicTablePackage\Src\Group")
     * @JoinColumn(name="group_id", referencedColumnName="gID", onDelete="CASCADE")
     */
    protected $Group;


    public function __construct(){
        parent::__construct();
    }




}