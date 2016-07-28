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
}