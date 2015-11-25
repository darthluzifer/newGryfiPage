<?php
namespace Application\Block\BasicTableBlock;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Package\EntitiesExample\Src\Entity;
/**
 * Class BasicTableBlockOption
 * @package Application\Block\BasicTableBlock
 * @Entity
 * @Table(name="BasicTableBlockOption")
 */
class BasicTableBlockOption extends Entity{
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
    protected $optionType;

    /**
     * @var string
     * @Column(type="string")
     */
    protected $optionValue;


    protected $possibleOptionTypes = array();
}