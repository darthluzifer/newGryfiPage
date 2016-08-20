<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;


use Concrete\Package\BasicTablePackage\Src\AssociationEntity;
use Concrete\Package\BasicTablePackage\Src\EntityGetterSetter;
use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

/**
 * Class EventGroup
 * @package Concrete\Package\BasicTablePackage\Src\BlockOptions
 * @Entity
 * @Table(name="grouprefoption_group")
 *
 */
class GroupRefOptionGroup extends AssociationEntity
{
    use EntityGetterSetter;

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




}