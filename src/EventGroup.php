<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BaclucEventPackage\Src;


use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

/**
 * Class EventGroup
 * @package Concrete\Package\BaclucEventPackage\Src
 * @Entity
 * @ORM\Table(name="EventGroup")
 */
class EventGroup extends Group
{

}