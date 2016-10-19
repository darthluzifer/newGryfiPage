<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 01.02.16
 * Time: 23:08
 */

namespace Concrete\Package\BasicTablePackage\Src;
use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\InheritanceType;
use Doctrine\ORM\Mapping\DiscriminatorColumn;
use Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry\DiscriminatorEntry;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Index;

/**
 * Class ExtendGroup
 * package Concrete\Package\BasicTablePackage\Src
 * @Entity
 * @DiscriminatorEntry( value = "Concrete\Package\BasicTablePackage\Src\ExtendGroup" )
  @Table(name="basictable_extendgroup"
 )
 *
 */
class ExtendGroup extends Group
{
    use EntityGetterSetter;







}