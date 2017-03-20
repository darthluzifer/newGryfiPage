<?php
namespace Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged;

use Concrete\Controller\Search\Groups;
use Concrete\Core\Package\Package;
use Concrete\Package\BaclucEventPackage\Src\EventGroup;
use Concrete\Package\BasicTablePackage\Src\AssociationBaseEntity;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\DropdownBlockOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\GroupRefOption;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\GroupRefOptionGroup;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\BasicTableInstance;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\TextBlockOption;
use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Concrete\Package\BasicTablePackage\Src\ExampleEntity;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DirectEditAssociatedEntityField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DirectEditAssociatedEntityMultipleField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DirectEditInterface;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DropdownLinkField;
use Concrete\Package\BasicTablePackage\Src\Group;
use Concrete\Package\BasicTablePackage\Src\Helpers\CsvResponse;
use Core;
use Concrete\Package\BasicTablePackage\Src\BlockOptions\CanEditOption;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\DBAL\Schema\Table;
use Doctrine\ORM\Mapping\ClassMetadata;
use Doctrine\ORM\Query\Expr\Base;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\ORM\QueryBuilder;
use DoctrineProxies\__CG__\Concrete\Package\BaclucAccountingPackage\Src\Move;
use GuzzleHttp\Query;
use OAuth\Common\Exception\Exception;
use Page;
use Symfony\Component\HttpFoundation\JsonResponse;
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
     * @var string
     * Blockhandle, same name as the directory
     */
    protected $btHandle = 'basic_table_block_packaged';


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
     * @var array
     */
    protected $postFieldMap = array();

    /**
     * if validatePost throws an error, here are the errormessages stored
     *
     * @var array
     */
    protected $errorMsg = array();

    /**
     * block title
     * @var string
     */
    protected $header = "BasicTablePackaged";


    /**
     * @var \Concrete\Package\BasicTablePackage\Src\BasicTableInstance
     */
    protected $basicTableInstance;

    /**
     * @var Package
     */
    protected $package;

    /**
     * @var \Doctrine\ORM\EntityManager
     */
    private $entityManager;

    /**
     * Array of \Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption
     * @var array
     */
    protected $requiredOptions = array();

    /**
     * @var \Concrete\Package\BasicTablePackage\Src\BaseEntity
     */
    protected $model;

    /**
     * @var Field[]
     */
    protected $errorFields;


    protected $clientSideValidationActivated = true;

    /**
     * @var array
     */
    protected $consistencyErrors = array();

    /**
     *
     * Controller constructor.
     * @param null $obj
     */
    function __construct($obj = null)
    {



        parent::__construct($obj);
        if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
            $this->editKey = $_SESSION[$this->getHTMLId() . "rowid"];
        }

        /*
         * if the basic table block is extended, $this->model is already set and should not be overwritted, that the name of the session variable is set right
         * */
        if ($this->model == null) {
            if($this->editKey == null){
                $this->model = new ExampleEntity();
            }else{
                $this->model = $this->getEntityManager()->find("Concrete\\Package\\BasicTablePackage\\Src\\ExampleEntity", $this->editKey);
            }

        }else{
            if($this->editKey == null){
            }else{
                $query = $this->getBuildQueryWithJoinedAssociations();
                $query->where($query->expr()->eq( "e0.".$this->model->getIdFieldName(),":id"))->setParameter(":id",$this->editKey);
                try {
                    $model = $query->getQuery()->getSingleResult();
                    $model = self::setModelFieldTypes($model);
                    if ($model) {
                        $this->model = $model;
                    } else {

                        //dummy function because we have no values
                        throw new \Exception;
                    }
                } catch (\Exception $e) {

                }

            }
        }


        $this->generatePostFieldMap();


        $c = Page::getCurrentPage();

        if (is_object($c)) {
            $this->cID = $c->getCollectionID();
        }

        //if editkey is set in session, save in property


        //check if it is in form view
        if (isset($_SESSION[$this->getHTMLId()]['prepareFormEdit'])) {
            $this->isFormview = $_SESSION[$this->getHTMLId()]['prepareFormEdit'];
        }
        //translate the header
        $this->header = t($this->header);


        //load the current options

        $this->basicTableInstance = $this->getBasicTableInstance();
        if(!isset($this->requiredOptions)) {
            $this->requiredOptions = array();
        }


    }

    /**
     * Doctrine instanciates Fields without calling the constructor.
     * so the Field Types have to be set afterwards.
     * here the standard way. If you want to add special field types,
     * use model->setFieldType('id' => new Field("id", "ID", "nr"));
     * $model->__construct sets the default field types defined in the model
     * @param BaseEntity $model
     * @return BaseEntity
     */
    public static function setModelFieldTypes(BaseEntity $model)
    {
        $model->setDefaultFieldTypes();
        return $model;
    }


    public function getBasicTableInstance($obj = null)
    {
        if ($this->basicTableInstance == null) {
            if($obj == null){
                $bID = $this->bID;
            }else{
                $bID = $obj->getBlockID();
            }
            /**
             * dont know why the normal approach does not work.
             * using now directly dql instead
             */
//            $query = $this->getEntityManager()->createQueryBuilder();
//
//            $query->select("bt,o")
//                ->from(get_class(new BasicTableInstance()), "bt")
//                ->leftJoin("bt.tableBlockOptions", "o")
//                ->where($query->expr()->eq( "bt.bID",":id"));
//            $query->setParameter(":id",$bID);

            $dql = $this->getEntityManager()->createQuery("SELECT bt,o FROM Concrete\Package\BasicTablePackage\Src\BasicTableInstance bt LEFT JOIN bt.tableBlockOptions o WHERE bt.bID = :id");
            $dql->setParameter(":id",$bID);
            $result = $dql->getResult(\Doctrine\ORM\Query::HYDRATE_OBJECT);
            if(is_array($result)){
                $bt = reset($result);
            }
            if ($bt == null) {
                $bt = new BasicTableInstance();
                $bt->set("bID", $bID);

            }
            $this->basicTableInstance = $bt;
        }
        return $this->basicTableInstance;
    }


    /**
     * Returns the id of the block, used in html id's and for the session variable
     *
     * @return string
     */
    function getHTMLId()
    {
        //because model is not always set, and bID plus blockhandle should be unique, we use this for identifiying the block
        return $this->btHandle . $this->bID;
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
        return static::getActionButton($row,"edit", "btn inlinebtn actionbutton edit", "edit","fa fa-pencil");
    }



    /**
     * Returns the HTML for the delete button
     * @param $row
     * @return string
     */
    function getDeleteActionIcon($row)
    {
        return static::getActionButton($row,"delete", "btn inlinebtn actionbutton delete", "delete","fa fa-trash");

    }

    /**
     * @param $row
     * @param $value
     * @param $buttonclass
     * @param $title
     * @param $iconclass
     * @return string
     */
    public static function getActionButton($row,$value,$buttonclass,$title,$iconclass){
        return "<button type='submit'
                            value = '$value'
                            class='$buttonclass'
                            title='".t($title)."'
                            aria-label='".t($title)."'
                            onclick=\"
                                        $('#action_" . $row['id'] . "').val('$value');
                    \">
                                        <i class ='$iconclass'> </i>
                     </button>";
    }

    /**
     * @throws \Exception
     */
    function delete()
    {
        $em = $this->getEntityManager();

        $em->beginTransaction();
        try {
            $em->remove($this->getBasicTableInstance());
            $em->flush();

            parent::delete();
            $em->commit();
        } catch (\Exception $e) {
            $em->rollback();
            throw $e;
        }
    }

    /**
     * if save is pressed, the data is saved to the sql table
     * @throws \Exception
     */
    function action_save_row($redirectOnSuccess = true)
    {



        if ($this->post('rcID')) {
            // we pass the rcID through the form so we can deal with stacks
            $c = Page::getByID($this->post('rcID'));
        } else {
            $c = $this->getCollectionObject();
        }
        //form view is over
        $v =  $this->checkPostValues();
        if($v === false){
            return false;
        }

        if ($this->editKey == null) {
            $model = $this->model;
        } else {
            $model = BaseEntity::getEntityById(get_class($this->model), $this->editKey);
        }

        if($this->persistValues($model, $v) === false){
            return false;
        }

        $this->getEntityManager()->flush();


        $this->finishFormView();
        if($redirectOnSuccess) {
            $this->redirectToPage($c);

        }


    }

    public function getConsistencyErrors(){
        return $this->consistencyErrors;
    }

    /**
     * that the view function of the subclasses is called
     */
    public function on_before_render()
    {
        $this->view();
    }

    /**
     * action display form for new entry
     *
     */
    function action_add_new_row_form()
    {
        $this->prepareFormEdit();
       // $this->view();

    }

    /**
     * action to open a form to edit/delete (manipulate) an existing row
     */
    function action_edit_row_form()
    {
        $u = new User();
        if ($this->requiresRegistration()) {
            if (!$u->isRegistered()) {
                $this->redirect('/login');
            }
        }

        //get the editkey
        $this->editKey = $_POST['rowid'];
        //save it in the session
        $_SESSION[$this->getHTMLId() . "rowid"] = $this->editKey;

        $row = $this->getRowValues();

        if ($_POST['action'] == 'edit' && strlen($this->getEditActionIcon($row))>0) {
            $this->prepareFormEdit();
        } elseif ($_POST['action'] == 'delete' && strlen($this->getDeleteActionIcon($row))>0 ) {
            $this->deleteRow();
        }

        $this->redirectToView();
    }

    public function prepareFormEdit()
    {
        $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = true;
        $this->isFormview = true;
    }

    public function deleteRow()
    {
        $model = $this->getEntityManager()->getRepository(get_class($this->model))->findOneBy(array($this->model->getIdFieldName() => $this->editKey));
        $this->getEntityManager()->remove($model);
        $this->getEntityManager()->flush();
        $r = true;
        $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
        if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
            unset($_SESSION[$this->getHTMLId() . "rowid"]);

        }
        $this->editKey = null;

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


        return parent::duplicate($newBID);

    }


    //todo
    public function uninstall()
    {

    }

    /**
     * list needed javascript/css files
     */
    public function on_start()
    {
        $package = Package::getByHandle("basic_table_package");
        $al = \Concrete\Core\Asset\AssetList::getInstance();

        $al->register(
            'javascript', 'typeahead', 'blocks/basic_table_block_packaged/js/typeahead.bundle.js',
            array('minify' => false, 'combine' => true)
            , $package
        );
        $al->register(
            'javascript', 'datepicker', 'blocks/basic_table_block_packaged/js/bootstrap-datepicker.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'tagsinput', 'blocks/basic_table_block_packaged/js/bootstrap-tagsinput.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'bootgrid', 'blocks/basic_table_block_packaged/js/jquery.bootgrid.min.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'block_auto_js', 'blocks/basic_table_block_packaged/auto.js',
            array('minify' => false, 'combine' => true)
            , $package
        );
        $al->register(
            'javascript', 'block_auto_js', 'blocks/basic_table_block_packaged/js/DirectEditAssociatedEntityMultipleField.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'parsley', 'blocks/basic_table_block_packaged/js/parsley.min.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'javascript', 'clientSideValidation', 'blocks/basic_table_block_packaged/js/clientSideValidation.js',
            array('minify' => false, 'combine' => true)
            , $package
        );

        $al->register(
            'css', 'fontawesome', 'font-awesome'       , array(
                array('css', 'css/font-awesome.css', array('minify' => false))
            )
        );


        $al->register(
            'css', 'tagsinputcss', 'blocks/basic_table_block_packaged/css/bootstrap-tagsinput.css',
            array('minify' => false, 'combine' => true)
            , $package
        );
        $al->register(
            'css', 'typeaheadcss', 'blocks/basic_table_block_packaged/css/typeahead.css',
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

        $groupAssets = array(
            array('css', 'font-awesome'),
            array('css', 'tagsinputcss'),
            array('css', 'datepickercss'),
            array('css', 'bootgridcss'),
            array('css', 'basicTablecss'),
            array('css', 'typeaheadcss'),
            array('javascript', 'jquery'),
            array('javascript', 'bootstrap'),
            array('javascript', 'typeahead'),
            array('javascript', 'datepicker'),
            array('javascript', 'bootgrid'),
            array('javascript', 'tagsinput'),
            array('javascript', 'block_auto_js'),
        );

        if($this->isClientSideValidationActivated()){
            $groupAssets[]=array("javascript", "parsley");
            $groupAssets[]=array("javascript", "clientSideValidation");
        }

        $al->registerGroup('basictable', $groupAssets);

    }

    /**
     * register needed javascript
     */
    public function registerViewAssets($outputContent = '')
    {
        $this->requireAsset('basictable');
    }

    /**
     * register also for add form
     */
    public function add()
    {
        $this->requireAsset('basictable');
    }

    /**
     * @param $args
     * save the added/edited block (not the row)
     */
    function save($args)
    {

        parent::save($args);


        $this->getBasicTableInstance();


        $toPersist = array();


        if (count($args) > 0) {

            $blockOptionPostMap = $this->generateOptionsPostFieldMap();
            foreach ($args as $key => $value) {


                //if there are required options
                if (count($this->getBlockOptions()) > 0) {

                    //if the key is in the postmap
                    if (isset($blockOptionPostMap[$key])) {
                        //if the option is already linked to this instance
                        if ($blockOptionPostMap[$key]->BasicTableInstance != null) {

                        } else {
                            //if not, link with instance
                            $blockOptionPostMap[$key]->set("BasicTableInstance", $this->basicTableInstance);
                            $this->basicTableInstance->addBlockOption($blockOptionPostMap[$key]);
                        }
                        $blockOptionPostMap[$key]->getFieldType()->validatePost($value);
                        $optionValue = $blockOptionPostMap[$key]->getFieldType()->getSQLValue();
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
                $this->getEntityManager()->persist($blockOption);
            }
        }
        $this->getEntityManager()->persist($this->basicTableInstance);
        $this->getEntityManager()->flush();

    }


    /**
     * @return QueryBuilder
     */
    public function getBuildQueryWithJoinedAssociations(){
        $classname = get_class($this->model);


        $query = BaseEntity::getBuildQueryWithJoinedAssociations($classname, BaseEntity::$staticEntityfilterfunction);

        $queryConfig = BaseEntity::getQueryConfigOf($classname);

        $query = $this->addFilterToQuery($query, $queryConfig);

        return $query;
    }


    /**
     * funciton to retrieve the table data
     * @return array
     */
    public function displayTable()
    {



        $modelList = $this->getBuildQueryWithJoinedAssociations()->getQuery()->getResult();


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
        if ($this->editKey == null) {

            return $this->model->getFieldTypes();
        }
        return BaseEntity::getEntityById(get_class($this->model), $this->editKey)->getFieldTypes();

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
        //if there was an error submitting the form, the values are saved in the session
        if (isset($_SESSION['BasicTableFormData'][$this->bID]['inputValues'])) {

            foreach ($_SESSION['BasicTableFormData'][$this->bID]['inputValues'] as $key => $value) {
                if (isset($this->postFieldMap[$key])) {
                    $returnArray[$this->postFieldMap[$key]] = $value;
                }
            }

        } else {
            $query = $this->getBuildQueryWithJoinedAssociations();
            $query->andWhere($query->expr()->eq( "e0.".$this->model->getIdFieldName(),":id"))->setParameter(":id",$this->editKey);


            try {
                $model = $query->getQuery()->getSingleResult();
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
                        $returnArray[$key] = null;
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

    /**
     * test of ajax functionality, exit() is important
     */
    function action_myAction()
    {
        echo json_encode(array('hi' => 'test'));
        exit();
    }


    function action_exportCSV(){
        //first get table data
        $query = BaseEntity::getBuildQueryWithJoinedAssociations(get_class($this->getModel()));
        $result =$query->getQuery()->execute();
        //convert it to assoc array

        $assocResult = array();
        $fieldTypes = array();

        foreach ($result as $key => $value){
            /**
             * @var BaseEntity $value
             */
            $value = BaseEntity::getBaseEntityFromProxy($value);

            if(count($assocResult)==0){
                $fieldTypes = $value->getFieldTypes();
            }
            $assocRow = array();
            foreach ($fieldTypes as $num => $fieldType){
                /**
                 * @var Field $fieldType
                 */
                $assocRow[$fieldType->getSQLFieldName()] = $fieldType->setSQLValue($value->get($fieldType->getSQLFieldName()))->getTableView();
            }
            $assocResult[]=$assocRow;

        }

        $response = new CsvResponse($assocResult);
        $response->setDelimiter(";");
        $response->send();
        exit();

    }

    function getHeader()
    {
        return $this->header;
    }


    /**
     * generates the postfieldmap. "postkey" => sqlfieldname
     */
    protected function generatePostFieldMap()
    {
        $fields = $this->getFields();
        if (count($fields) > 0) {
            foreach ($fields as $key => $field) {
                $this->postFieldMap[$field->getPostName()] = $key;
            }
        }
    }

    /**
     * generates the blockOptionsPostMap
     * "postkey"=>instance of \Conrete\Package\BasicTablePackage\BlockOptions\TableBlockOption
     * @return array
     */
    protected function generateOptionsPostFieldMap()
    {
        $blockOptions = $this->getBlockOptions();

        $blockOptionsPostMap = array();
        foreach ($blockOptions as $optionnum => $option) {
            $blockOptionsPostMap[$option->getFieldType()->getPostName()] = $option;
        }

        return $blockOptionsPostMap;
    }


    /**
     * if no options are set, it returns the $this->requiredoptions array. Else it returns the merge of $this->requiredoptions and the TableBlockOptions of the basicTableInstance
     * @return array of instance of \Conrete\Package\BasicTablePackage\BlockOptions\TableBlockOption
     */
    public function getBlockOptions()
    {

        if ($this->bID == null) {
            return $this->requiredOptions;
        }

        $this->getBasicTableInstance();
        $currentBlockOptions = $this->basicTableInstance->get('tableBlockOptions');


        if (count($currentBlockOptions) == 0) {
            return $this->requiredOptions;
        } else {

            foreach ($this->requiredOptions as $optionNum => $requOption) {
                foreach ($currentBlockOptions->toArray() as $currentBlockOption) {
                    if ($currentBlockOption->optionName == $requOption->optionName) {
                        $currentBlockOption->setPossibleValues($requOption->getPossibleValues());
                        //load the right optiontype
                        if(get_class($currentBlockOption) == get_class($requOption)){

                        }else{
                            //load the right current option
                            $realBlockOption = BaseEntity::getEntityById(get_class($requOption), $currentBlockOption->getId());

                            if($realBlockOption != null){
                                $currentBlockOption = $realBlockOption;
                            }
                        }


                        $this->requiredOptions[$optionNum] = $currentBlockOption;
                    }
                }
            }
            return $this->requiredOptions;
        }

    }


    public function getEntityManager()
    {
        if($this->entityManager == null) {
            $pkg = Package::getByHandle('basic_table_package');
            $em = $pkg->getEntityManager();
            $this->package = $pkg;
            $this->entityManager = $em;
        }
        return $this->entityManager;
    }
     /**
     * @return \Concrete\Package\BasicTablePackage\Src\FieldTypes\Field[]
     */
    public function getErrorFields()
    {
        return $this->errorFields;
    }

    /**
     * @return boolean
     */
    public function isClientSideValidationActivated()
    {
        return $this->clientSideValidationActivated;
    }

    /**
     * @param boolean $clientSideActivated
     * @return $this
     */
    public function setClientSideValidationActivated($clientSideActivated)
    {
        $this->clientSideValidationActivated = $clientSideActivated;
        return $this;
    }

    /**
     * @return BaseEntity|null|object
     */
    public function getModel(){
        if($this->model->getId() != $this->editKey && $this->editKey != null){
            $query = BaseEntity::getBuildQueryWithJoinedAssociations(get_class($this->model));
            $query->andWhere($query->expr()->eq("e0.".$this->model->getIdFieldName(), ":basicTableControllerId"));
            $query->setParameter(":basicTableControllerId", $this->editKey);
            $result =$query->getQuery()->execute();
            if(count($result)==1){
                $this->model = reset($result);
            }

        }
        return $this->model;
    }

    public function install($path)
    {
        $res = parent::install($path);
        //throw model through AssociationCache to get Associations
    }

    public function action_get_options_of_field(){

        $field = $this->request->query->get('fieldname');



        $fieldTypes = $this->getFields();
        /**
         * @var DropdownLinkField $fieldType
         */
        $fieldType = $fieldTypes[$this->postFieldMap[$field]];

        $options = array();
        if($fieldType instanceof  DirectEditInterface){
            $options = $fieldType->getFullOptions();
            //look that it is an array in javascript
            $options = array_values($options);

        }else{
            throw new \InvalidArgumentException("Invalid field name");
        }
        return new \Symfony\Component\HttpFoundation\JsonResponse($options);
    }

    /**
     * @return bool
     */
    public function handleFormError()
    {
//TODO send error msg to client
        $this->prepareFormEdit();
        $_SESSION['BasicTableFormData'][$this->bID]['inputValues'] = $_REQUEST;
        return false;
    }

    /**
     * @param $u
     * @return bool
     */
    public function validateRequest($u)
    {
        if ($this->requiresRegistration()) {
            if (!$u->isRegistered()) {
                $this->redirect('/login');
                return false;
            }

        }


        $antispam = Loader::helper('validation/antispam');
        if ($antispam->check('', 'survey_block')) { // we do a blank check which will still check IP and UserAgent's
            return true;
        } else {
            return $this->handleFormError();
        }
    }

    /**
     * @return bool|array
     */
    public function checkPostValues()
    {
        $this->isFormview = false;
        $u = new User();


        $bo = $this->getBlockObject();


        if ($this->post('rcID')) {
            // we pass the rcID through the form so we can deal with stacks
            $c = Page::getByID($this->post('rcID'));
        } else {
            $c = $this->getCollectionObject();
        }

        if ($this->validateRequest($u) === false) {
            return $this->handleFormError();
        }


        if (isset($_POST['cancel'])) {
            if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
                unset($_SESSION[$this->getHTMLId() . "rowid"]);
            }
            $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
            $this->redirectToPage($c);
            return true;
        }


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
        //test
        $errormsg = "";
        $savevalues = $_REQUEST;

        //add additional fields
        if (count($this->addFields) > 0) {
            foreach ($this->addFields as $key => $value) {
                $savevalues[$key] = $value;
            }
        }
        //selfsavefields are for example n:m relations. They implement the SelfSaveInterface
        $selfsavefields = array();

        foreach ($this->getFields() as $key => $value) {
            /**
             * @var Field $value
             */
            if ($key == 'id' || $value->showInForm() === false) {
            } else {
                $fieldname = $this->postFieldMap[$value->getPostName()];
                if ($value->validatePost($savevalues[$value->getPostName()])) {
                    $v[$key] = $value->getSQLValue();
                } else {
                    $error = true;
                    $this->errorFields[$value->getPostName()] = $value;
                }
            }
        }

        if ($error) {
            return $this->handleFormError();

        }

        return $v;
    }

    /**
     * @param $model
     * @param $v
     * @return bool
     */
    public function persistValues($model, $v)
    {
        $this->getEntityManager()->persist($model);
        //save values
        foreach ($this->getFields() as $key => $value) {
            if ($key != $model->getIdFieldName()) {
                if ($v[$key] instanceof BaseEntity) {
                    $this->getEntityManager()->persist($v[$key]);
                } elseif ($v[$key] instanceof ArrayCollection) {
                    foreach ($v[$key]->toArray() as $refnum => $refObject) {
                        $this->getEntityManager()->persist($refObject);
                    }
                }
                $model->set($key, $v[$key]);
            }
        }


        //if the data is inserted, the saveself fields can only save afterwards

        $this->consistencyErrors = $model->checkConsistency();
        if (count($this->consistencyErrors) > 0) {
            return $this->handleFormError();
        }
        return true;
    }

    public function finishFormView()
    {
        if (isset($_SESSION[$this->getHTMLId() . "rowid"])) {
            unset($_SESSION[$this->getHTMLId() . "rowid"]);
        }

        $_SESSION[$this->getHTMLId()]['prepareFormEdit'] = false;
        $_SESSION['BasicTableFormData'][$this->bID]['inputValues'] = null;
        unset($_SESSION['BasicTableFormData'][$this->bID]['inputValues']);
    }


    /**
     * @param QueryBuilder $query
     * @param array $queryConfig
     *  array of:
     * array(
            'fromEntityStart' => array('shortname'=> 'e0'
     *                                                       , 'classname'=>get_class($this->model)
     *                                             )
     *       ,'firstAssociationFieldname'=> array('shortname' => 'e1'
     *                                                                           , 'classname' => 'Namespace\To\Entity\Classname')
     *
     * );
     * @return QueryBuilder
     *
     * always use andWhere to append the filter, because maybe the entity is already filtered
     */
    public function addFilterToQuery(QueryBuilder $query, array $queryConfig = array()){
        return $query;
    }

    public function view(){

    }

    public function redirectToView()
    {
        if ($this->post('rcID')) {
            // we pass the rcID through the form so we can deal with stacks
            $c = Page::getByID($this->post('rcID'));
        } else {
            $c = $this->getCollectionObject();
        }
        $this->redirectToPage($c);
    }

    /**
     * @param $c
     */
    protected function redirectToPage($c)
    {
        if (strlen($c->getCollectionPath()) == 0) {
            $this->redirect("");
        } else {
            $this->redirect($c->getCollectionPath());
        }
    }

    public function getTableControlButtons($view){
        return '
        <form method="post" action="' . $view->action('add_new_row_form') . ' ">

                    
                    <button type="submit" value="" class="btn inlinebtn actionbutton add" aria-label="' . t("new Entry") . '" title="' . t("new Entry") . '">
                                <i class ="fa fa-plus" aria-hidden="true"> </i>
                     </button>
                     <a href="' . $view->action('exportCSV') . '" >
                        <button type="button" value=""  class="btn inlinebtn actionbutton exportcsv" aria-label="' . t("export CSV") . '" title="' . t("export CSV") . '">
                                <i class ="fa fa-download" aria-hidden="true"> </i>
                        </button>
                    </a>
        </form>
        
        ';
    }


}
