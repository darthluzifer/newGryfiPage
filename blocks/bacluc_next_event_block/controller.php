<?php
namespace Concrete\Package\BaclucEventPackage\Block\BaclucNextEventBlock;

use Concrete\Core\Package\Package;
use Concrete\Package\BaclucEventPackage\Src\Event;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\DropdownBlockOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\GroupRefOption as GroupRefOption;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\BasicTableInstance;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TextBlockOption;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\ExampleEntity;
use Core;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\DBAL\Schema\Table;
use OAuth\Common\Exception\Exception;
use Page;
use User;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\SelfSaveInterface as SelfSaveInterface;
use Loader;

use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Test as Test;
//test
class Controller extends \Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Controller
{
    protected $btHandle = 'bacluc_next_event_block';
    /**
     * table title
     * @var string
     */
    protected $header = "BaclucNextEventBlock";

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
     * set blocktypeset
     * @var string
     */
    protected $btDefaultSet = 'bacluc_event_set';

    /**
     *
     * Controller constructor.
     * @param null $obj
     */
    function __construct($obj = null)
    {
        //$this->model has to be instantiated before, that session handling works right

        $this->model = new Event();
        parent::__construct($obj);


        //load the current options
        $pkg = Package::getByHandle('bacluc_event_package');
        $em = $pkg->getEntityManager();
        $this->package = $pkg;
        $this->entityManager = $em;
        if ($obj instanceof Block) {
         $bt = $this->entityManager->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $obj->getBlockID()));

            $this->basicTableInstance = $bt;
        }

        $this->requiredOptions = array(
                new GroupRefOption()
        );

        $this->requiredOptions[0]->set('optionName', "groupoptions");


    }



    /**
     * @return string
     */
    public function getBlockTypeDescription()
    {
        return t("Display next Event of chosen Groups.");
    }

    /**
     * @return string
     */
    public function getBlockTypeName()
    {
        return t("BaclucNextEventBlock");

    }

    public function getNextEvent(){
        //get the groups
        $blockOptions = $this->getBlockOptions();
        /**
         * @var ArrayCollection $Groups
         */
        $GroupAssociations = $blockOptions[0]->get('GroupAssociations');
        $GroupAssociations = $GroupAssociations->toArray();
        $groupids = array();
        foreach($GroupAssociations as $groupnum => $GroupAssociation){
            $groupids[] = $GroupAssociation->Group->gID;
        }
        $Event = $this->model->getNextEvent($groupids);
        //var_dump($Event);
    }

    public function view(){
        $this->getNextEvent();
    }

}
