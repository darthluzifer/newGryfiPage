<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;
defined('C5_EXECUTE') or die(_("Access Denied."));

use Concrete\Core\Support\Facade\Log;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionSetOrderException;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Exceptions\InvalidBlockOptionValueException;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use OpenCloud\Common\Log\Logger;

/**
 * Class TextBlockOption
 * @package Application\Block\BasicTableBlock
 * @Entity
 * @Table(name="TextBlockOptions")
 */
class TextBlockOption extends TableBlockOption{



}