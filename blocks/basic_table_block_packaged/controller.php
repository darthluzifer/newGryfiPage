<?php
namespace Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged;

use Concrete\Core\Package\Package;
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

class Controller extends BlockController
{


    protected $pkgAutoloaderRegistries = array(
        'Src' => 'Concrete\Package\Src'
    );

    /**
     * the options that can be set
     * @var array
     */
    public $options = array();

    /**
     * the table where the block metadata is stored
     * @var string
     */
    protected $btTable = 'btBasicTableInstance';


    protected $btHandle = 'basic_table_block_packaged';
    /**
     * don't really know why necessary
     * @var array
     */
    //protected $btExportTables = array('btBasicTableInstance', 'btBasicTableActionOption', 'btBasicTable'/*name of the table where the data is stored*/);

    /**
     * @var array variable to store the fields
     * array of Appliaction\Block\BasicTableBlock\Field
     */
    protected $fields = array();

    /**
     * Tablename of the table displayed
     * @var string
     */
    protected $tableName = "btBasicTable";

    /**
     * if the block is already executed
     * @var bool
     */
    protected $executed = false;

    /**
     * If the block is in form view
     * @var bool
     */
    protected $isFormview = false;

    /**
     * the currently edited id
     * @var null int
     */
    protected $editKey = null;

    /**
     * the Block id
     * @var null int
     */
    protected $bID = null;

    /**
     * to handle a post request more easy, here is the reverse map postname -> field
     * (in fields is the postname stored)
     * @var array
     */
    protected $postFieldMap = array();

    /**
     * if validatePost throws an error, here are the errormessages stored
     * @var array
     */
    protected $errorMsg = array();

    /**
     * table title
     * @var string
     */
    protected $header = "BasicTablePackaged";

    /**
     * @var string
     */
    protected $SQLFilter = " 1=1";

    /**
     *
     * @var array
     */
    protected $addFields = array();

    /**
     * @var \Concrete\Package\BasicTablePackage\Src\BasicTableInstance
     */
    protected $basicTableInstance;


    protected $package;

    protected $entityManager;

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

        if($this->model == null) {
            $this->model = new ExampleEntity();
        }
        //define the fields
        /*
        $this->model->setFieldType('id' => new Field("id", "ID", "nr"));

        */


        $this->generatePostFieldMap();


        $c = Page::getCurrentPage();

        if (is_object($c)) {
            $this->cID = $c->getCollectionID();
        }

        //if editkey is set in session, save in property
        if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
            $this->editKey = $_SESSION[$this->getHTMLId() . "rowid"];
        }

        //check if it is in form view
        if (isset($_SESSION[$this->getHTMLId()]['prepareFormEdit'])) {
            $this->isFormview = $_SESSION[$this->getHTMLId()]['prepareFormEdit'];
        }
        //translate the header
        $this->header = t($this->header);


        //load the current options
        $pkg = Package::getByHandle('basic_table_package');
        $em = $pkg->getEntityManager();
        $this->package = $pkg;
        $this->entityManager = $em;
        if ($obj instanceof Block) {


            $bt = $this->entityManager->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $obj->getBlockID()));

            $this->basicTableInstance = $bt;
        }

        $this->requiredOptions = array(
          /*  new TextBlockOption(),
            new DropdownBlockOption(),
            new CanEditOption()*/
        );
        /*
        $this->requiredOptions[0]->set('optionName', "Test");
        $this->requiredOptions[1]->set('optionName', "TestDropDown");
        $this->requiredOptions[1]->setPossibleValues(array(
            "test",
            "test2"
        ));

        $this->requiredOptions[2]->set('optionName', "testlink");


        //$this->requiredOptions[1]->setDefaultFieldTypes();
*/
    }

    /**
     * Doctrine instanciates Fields without calling the constructor.
     * so the Field Types have to be set afterwards.
     * here the standard way. If you want to add special field types,
     * use model->setFieldType('id' => new Field("id", "ID", "nr"));
     * $model->__construct sets the default field types defined in the model
     * @param Entity $model
     * @return Entity
     */
    public static function setModelFieldTypes(Entity $model)
    {
        $model->__construct();
        return $model;
    }


    public function getBasicTableInstance()
    {
        if ($this->basicTableInstance == null) {
            $bt = $this->entityManager->getRepository('\Concrete\Package\BasicTablePackage\Src\BasicTableInstance')->findOneBy(array('bID' => $this->bID));
            if ($bt == null) {
                $bt = new BasicTableInstance();
                $bt->set("bID", $this->bID);
                $this->entityManager->persist($bt);
                $this->entityManager->flush($bt);
            }
            $this->basicTableInstance = $bt;
        }
        return $this->basicTableInstance;
    }


    /**
     * Returns the id of the block
     * TODO change that tablename is not used
     * @return string
     */
    function getHTMLId()
    {
        $classstring = get_class($this->model);
        $namespaceArray = explode("\\", $classstring);
        return $namespaceArray[count($namespaceArray) - 1] . $this->bID;
    }

    /**
     * Returns the path where the basic table files are stored
     * @return string
     */
    function getBasicTablePath()
    {
        return __DIR__;
    }

    /**
     * @return string
     */
    public function getBlockTypeDescription()
    {
        return t("Show a simple Table with Data to create, edit, delete");
    }

    /**
     * @return string
     */
    public function getBlockTypeName()
    {
        return t("BasicTablePackaged");
    }

    /**
     * returns the javascript error messages translated
     * @return array
     */
    public function getJavaScriptStrings()
    {
        return array('file-required' => t('You must select a file.'));
    }

    /**
     * Returns the HTML for the possible actions
     * TODO extract html to view
     * @param $object //view object
     * @param array $row //row (with the rowid)
     * @return string
     */
    function getActions($object, $row = array())
    {
        //".$object->action('edit_row_form')."
        $string = "
    	<td class='actioncell'>
    	<form method='post' action='" . $object->action('edit_row_form') . "'>
    		<input type='hidden' name='rowid' value='" . $row['id'] . "'/>
    		<input type='hidden' name='action' value='edit' id='action_" . $row['id'] . "'>";
        $string .= $this->getEditActionIcon($row);
        $string .= $this->getDeleteActionIcon($row);


        $string .= "</form>
    	</td>";
        return $string;
    }

    /**
     * Returns the HTML for the edit button
     * @param $row
     * @return string
     */
    function getEditActionIcon($row)
    {
        return "<button type='submit'
    					value = 'edit' 
    					class='btn inlinebtn actionbutton edit' 
    					onclick=\"
    								$('#action_" . $row['id'] . "').val('edit');
    			\">
    								<i class ='fa fa-pencil'> </i>
    			 </button>";
    }

    /**
     * Returns the HTML for the delete button
     * @param $row
     * @return string
     */
    function getDeleteActionIcon($row)
    {
        return "<button type='submit'
    					value = 'delete'
    					class='btn inlinebtn actionbutton delete'
    					onclick=\"
    								$('#action_" . $row['id'] . "').val('delete');
    			\">
    								<i class ='fa fa-trash-o'> </i>
    			 </button>";
    }


    function delete()
    {


        parent::delete();
    }

    /**
     * if save is pressed, the data is saved to the sql table
     * @throws \Exception
     */
    function action_save_row()
    {
        //form view is over
        $this->isFormview = false;
        $u = new User();


        $bo = $this->getBlockObject();


        if ($this->post('rcID')) {
            // we pass the rcID through the form so we can deal with stacks
            $c = Page::getByID($this->post('rcID'));
        } else {
            $c = $this->getCollectionObject();
        }


        if (isset($_POST['cancel'])) {
            if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
                unset($_SESSION[$this->getHTMLId() . "rowid"]);
            }
            $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
            $this->redirect($c->getCollectionPath());
            return;
        }

        if ($this->requiresRegistration()) {
            if (!$u->isRegistered()) {
                $this->redirect('/login');
            }
        }


        $antispam = Loader::helper('validation/antispam');
        if ($antispam->check('', 'survey_block')) { // we do a blank check which will still check IP and UserAgent's
            $duID = 0;
            if ($u->getUserID() > 0) {
                $duID = $u->getUserID();
            }

            /** @var \Concrete\Core\Permission\IPService $iph */
            $iph = Core::make('helper/validation/ip');
            $ip = $iph->getRequestIP();
            $ip = ($ip === false) ? ('') : ($ip->getIp($ip::FORMAT_IP_STRING));
            $v = array();


            $error = false;
            $errormsg = "";
            $savevalues = $_REQUEST;

            //add additional fields
            foreach ($this->addFields as $key => $value) {
                $savevalues[$key] = $value;
            }

            //selfsavefields are for example n:m relations. They implement the SelfSaveInterface
            $selfsavefields = array();

            foreach ($this->getFields() as $key => $value) {
                if ($key == 'id') {
                } else {
                    $fieldname = $this->postFieldMap[$value->getPostName()];
                    if ($value instanceof SelfSaveInterface) {
                        if ($value->validatePost($savevalues[$value->getPostName()])) {
                            //$value->setValue($_REQUEST[$value->getPostName()]);
                            $selfsavefields[$key] = $value->getSQLValue();
                        }

                    } elseif ($value->validatePost($savevalues[$value->getPostName()])) {
                        $v[$key] = $value->getSQLValue();
                    } else {
                        $error = true;
                        $this->errorMsg[] = $value->getErrorMsg();
                    }
                }
            }

            if ($error) {
                //TODO send error msg to client
                $this->prepareFormEdit();
                $_SESSION['BasicTableFormData'][$this->bID]['inputValues'] = $_REQUEST;
                return false;
            }
            $classname = get_class($this->model);
            $model = new $classname;
            if ($this->editKey == null) {

            } else {
                $model = $this->entityManager->getRepository(get_class($this->model))->findOneBy(array($this->model->getIdFieldName() => $this->editKey));
            }

            //save values
            foreach ($this->getFields() as $key => $value) {
                $model->set($key, $v[$key]);
            }


            //if the data is inserted, the saveself fields can only save afterwards
            foreach ($selfsavefields as $num => $selfsavefield) {
                $selfsavefield->setRowId($this->editKey);
                $selfsavefield->saveValues();
            }
            $this->entityManager->persist($model);
            $this->entityManager->flush();


            if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
                unset($_SESSION[$this->getHTMLId() . "rowid"]);
            }
            //setcookie("ccmPoll" . $this->bID . '-' . $this->cID, "voted", time() + 1296000, DIR_REL . '/');

            $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
            $this->redirect($c->getCollectionPath());
        }

    }

    /**
     * action display form for new entry
     */
    function action_add_new_row_form()
    {
        $this->prepareFormEdit();

    }

    /**
     * action to open a form to edit/delete (manipulate) an existing row
     */
    function action_edit_row_form()
    {
        //TODO check permissions
        if ($this->requiresRegistration()) {
            if (!$u->isRegistered()) {
                $this->redirect('/login');
            }
        }

        //get the editkey
        $this->editKey = $_POST['rowid'];
        //save it in the session
        $_SESSION[$this->getHTMLId() . "rowid"] = $this->editKey;

        if ($_POST['action'] == 'edit') {
            $this->prepareFormEdit();
        } elseif($_POST['action'] == 'delete') {
            $this->deleteRow();
        }
    }

    public function prepareFormEdit()
    {
        $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = true;
        $this->isFormview = true;
    }

    public function deleteRow()
    {

        $model = $this->entityManager->getRepository(get_class($this->model))->findOneBy(array('id' => $this->editKey));
        $this->entityManager->remove($model);
        $this->entityManager->flush();
        $r = true;
        $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
        if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
            unset($_SESSION[$this->getHTMLId() . "rowid"]);
        }
        if ($r) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * check if block is in form view or not
     * @return bool
     */
    function displayForm()
    {
        return $this->isFormview;
    }


    function requiresRegistration()
    {
        return $this->requiresRegistration;
    }


    function duplicate($newBID)
    {
        //TODO duplicate options

        /*
        foreach ($this->options as $opt) {
            $v1 = array($newBID, $opt->getOptionName(), $opt->getOptionDisplayOrder());
            $q1 = "INSERT INTO btBasicTableActionOption (bID, optionName, displayOrder) VALUES (?, ?, ?)";
            $db->query($q1, $v1);

            
        }*/

        return parent::duplicate($newBID);

    }


    //todo
    public function uninstall()
    {

    }

    public function on_start()
    {
        $package = Package::getByHandle("basic_table_package");
        $al = \Concrete\Core\Asset\AssetList::getInstance();
        $al->register(
            'javascript', 'typeahead', 'blocks/basic_table_block_packaged/js/bootstrap3-typeahead.min.js',
            array('minify' => false, 'combine' => true)
            , $package
        );
        $al->register(
            'javascript', 'datepicker', 'blocks/basic_table_block_packaged/js/bootstrap-datepicker.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'tagsinput', 'blocks/basic_table_block_packaged/js/bootstrap-tagsinput.min.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'bootgrid', 'blocks/basic_table_block_packaged/js/jquery.bootgrid.min.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'css', 'tagsinputcss', 'blocks/basic_table_block_packaged/css/bootstrap-tagsinput.css',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'css', 'datepickercss', 'blocks/basic_table_block_packaged/css/datepicker.css',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'css', 'bootgridcss', 'blocks/basic_table_block_packaged/css/jquery.bootgrid.min.css',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'css', 'basicTablecss', 'blocks/basic_table_block_packaged/view.css',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->registerGroup('basictable', array(
            array('css', 'tagsinputcss'),
            array('css', 'datepickercss'),
            array('css', 'bootgridcss'),
            array('css', 'basicTablecss'),
            array('javascript', 'jquery'),
            array('javascript', 'bootstrap'),
            array('javascript', 'typeahead'),
            array('javascript', 'datepicker'),
            array('javascript', 'bootgrid'),
            array('javascript', 'tagsinput'),
        ));

    }

    public function registerViewAssets()
    {
        $this->requireAsset('basictable');
    }

    public function add()
    {
        $this->requireAsset('basictable');
    }


    function save($args)
    {

        parent::save($args);

        $this->getBasicTableInstance();


        $toPersist = array();
        if (count($args) > 0) {
            foreach ($args as $key => $value) {


                if (count($this->getBlockOptions()) > 0) {
                    $blockOptionPostMap = $this->generateOptionsPostFieldMap();

                    if (isset($blockOptionPostMap[$key])) {
                        if ($blockOptionPostMap[$key]->BasicTableInstance != null) {

                        } else {
                            $blockOptionPostMap[$key]->set("BasicTableInstance", $this->basicTableInstance);
                            $this->basicTableInstance->addBlockOption($blockOptionPostMap[$key]);
                        }
                        $blockOptionPostMap[$key]->getFieldType()->validatePost($value);
                        $blockOptionPostMap[$key]->setValue(
                            $blockOptionPostMap[$key]->getFieldType()->getSQLValue()
                        );
                        $toPersist[] = $blockOptionPostMap[$key];

                    }

                }
            }
        }

        if (count($toPersist) > 0) {
            foreach ($toPersist as $num => $blockOption) {
                $blockOption->set('optionType', get_class($blockOption));
                $this->entityManager->persist($blockOption);
            }
        }
        $this->entityManager->persist($this->basicTableInstance);
        $this->entityManager->flush();

        /*
                if(count($this->basicTableInstance->get("tableBlockOptions")) == 0){
                    $blockOption = new TableBlockOption();
                    $blockOption->set('BasicTableInstance', $this->basicTableInstance);
                    $blockOption->set('optionType', get_class(new CanEditOption()));

                    $blockOption->set("optionValue", "test");
                    $this->basicTableInstance->addBlockOption($blockOption);

                    $this->entityManager->persist($blockOption);
                    $this->entityManager->persist($this->basicTableInstance);
                    $this->entityManager->flush();

                }
        */


    }


    /**
     * funciton to retrieve the table data
     * @return array
     */
    public function displayTable()
    {
        // Prepare the database query
        //$db = Loader::db();
        //$q = "SELECT * from ".$this->tableName." WHERE ".$this->SQLFilter;
        //TODO add filter
        $modelList = $this->entityManager->getRepository(get_class($this->model))->findAll();


        $tabledata = array();
        foreach ($modelList as $modelNum => $model) {
            $model = self::setModelFieldTypes($model);
            $tabledata[] = $model->getAsAssoc();
        }

        return $tabledata;

    }

    /**
     * @return array of Application\Block\BasicTableBlock\Field
     */
    public function getFields()
    {
        return $this->model->getFieldTypes();
    }


    /**
     * sets the block to executed status
     */
    public function setExecuted()
    {
        $this->executed = true;
    }

    /**
     * @return bool
     */
    public function isExecuted()
    {
        return $this->executed;
    }

    /**
     * retrieve one row
     * @return array
     */
    public function getRowValues()
    {

        $returnArray = array();
        if (isset($_SESSION['BasicTableFormData'][$this->bID]['inputValues'])) {

            foreach ($_SESSION['BasicTableFormData'][$this->bID]['inputValues'] as $key => $value) {
                if (is_object($this->postFieldMap[$key])) {
                    $returnArray[$this->postFieldMap[$key]] = $value;
                }
            }

        } else {
            $model = $this->entityManager->getRepository(get_class($this->model))->findOneBy(array('id' => $this->editKey));
            try {
                $model = self::setModelFieldTypes($model);
                if ($model) {
                    $returnArray = $model->getAsAssoc();
                } else {

                    //dummy function because we have no values
                    throw new \Exception;
                }
            } catch (\Exception $e) {
                foreach ($this->getFields() as $key => $value) {
                    if ($key == 'id') {
                    } else {
                        $returnArray[$key] = "";
                    }
                }
            }
        }
        return $returnArray;
    }

    function getErrorMessages()
    {
        return $this->errorMsg;
    }

    function action_myAction()
    {
        echo json_encode(array('hi' => 'test'));
        exit();
    }

    function getHeader()
    {
        return $this->header;
    }


    /**
     *
     */
    protected function generatePostFieldMap()
    {
        $fields = $this->model->getFieldTypes();
        if (count($fields) > 0) {
            foreach ($fields as $key => $field) {
                $this->postFieldMap[$field->getPostName()] = $key;
            }
        }
    }

    protected function generateOptionsPostFieldMap()
    {
        $blockOptions = $this->getBlockOptions();

        $blockOptionsPostMap = array();
        foreach ($blockOptions as $optionnum => $option) {
            $blockOptionsPostMap[$option->getFieldType()->getPostName()] = $option;
        }

        return $blockOptionsPostMap;
    }


    public function getBlockOptions()
    {
        $this->getBasicTableInstance();

        if ($this->basicTableInstance == null) {
            return $this->requiredOptions;
        }

        $currentBlockOptions = $this->basicTableInstance->get('tableBlockOptions');


        if (count($currentBlockOptions) == 0) {
            return $this->requiredOptions;
        } else {

            foreach ($this->requiredOptions as $optionNum => $requOption) {
                foreach ($currentBlockOptions->toArray() as $currentBlockOption) {
                    if ($currentBlockOption->optionName == $requOption->optionName) {
                        $currentBlockOption->setPossibleValues($requOption->getPossibleValues());
                        $this->requiredOptions[$optionNum] = $currentBlockOption;
                    }
                }
            }
            return $this->requiredOptions;
        }

    }

    public function getBlockOptionsValues()
    {
        $returnArray = array();

        foreach ($this->requiredOptions as $key => $option) {
            $returnArray[$key] = "";
        }
        return $returnArray;
    }


}
