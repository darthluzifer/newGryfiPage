<?php
namespace Concrete\Package\BaclucEventPackage\Block\BaclucEventBlock;

use Concrete\Core\Package\Package;
use Concrete\Package\BaclucEventPackage\Src\Event;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\DropdownBlockOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\BasicTableInstance;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TextBlockOption;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\ExampleEntity;
use Core;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Doctrine\DBAL\Schema\Table;
use OAuth\Common\Exception\Exception;
use Page;
use User;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Loader;

use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Test as Test;

class Controller extends \Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Controller
{
    protected $btHandle = 'bacluc_event_block';
    /**
     * table title
     * @var string
     */
    protected $header = "BaclucEventBlock";

    /**
     * Array of \Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption
     * @var array
     */
    protected $requiredOptions = array();

    /**
     * @var \Concrete\Package\BasicTablePackage\Src\Entity
     */
    protected $model;

    /**
     *
     * Controller constructor.
     * @param null $obj
     */
    function __construct($obj = null)
    {
        parent::__construct($obj);

        $this->model = new Event();

        //load the current options
        $pkg = Package::getByHandle('bacluc_event_package');
        $em = $pkg->getEntityManager();
        $this->package = $pkg;
        $this->entityManager = $em;
        if ($obj instanceof Block) {
         $bt = $this->entityManager->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $obj->getBlockID()));

            $this->basicTableInstance = $bt;
        }

    }



    /**
     * @return string
     */
    public function getBlockTypeDescription()
    {
        return t("Create, Edit or Delete Events");
    }

    /**
     * @return string
     */
    public function getBlockTypeName()
    {
        return t("BaclucEventBlock");
    }

}
