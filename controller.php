<?php
namespace Concrete\Package\BaclucEventPackage;

defined('C5_EXECUTE') or die(_("Access Denied."));


use Concrete\Core\Block\BlockType\BlockType;
use Concrete\Core\Package\Package;
use Concrete\Core\Foundation\ClassLoader;
use Punic\Exception;
use Loader;
use Core;

class Controller extends Package
{

    protected $pkgHandle = 'bacluc_event_package';
    protected $appVersionRequired = '5.7.4';
    protected $pkgVersion = '0.0.1';

    protected $pkgAutoloaderRegistries = array(
      //  'src/FieldTypes/Statistics' => '\BasicTablePackage\FieldTypes'
           'src'                      => 'Concrete\Package\BaclucEventPackage\Src'
    );

    public function getPackageName()
    {
        return t("BaclucEventPackage");
    }

    public function getPackageDescription()
    {
        return t("Package to Manage Events");
    }

    public function install()
    {

        $pre_pkg = Package::getByHandle('basic_table_package');
        if (!is_object($pre_pkg)){
            throw new Exception (t('To Install BaclucEventPackage, you have to Install BasicTablePackage first.
            @see <a href=\'https://github.com/BacLuc/basic_table_package\'>https://github.com/BacLuc/basic_table_package</a>'));
        }
       $em = $this->getEntityManager();

        //begin transaction, so when block install fails, but parent::install was successfully, you don't have to uninstall the package
        $em->getConnection()->beginTransaction();
        try {

            $pkg = parent::install();
            BlockType::installBlockType("bacluc_event_block", $pkg);

            $em->getConnection()->commit();
        }catch(Exception $e){
            $em->getConnection()->rollBack();

            throw $e;
        }


    }

    public function uninstall()
    {
        $block = BlockType::getByHandle("bacluc_event_block");
        $em = $this->getEntityManager();

        //begin transaction, so when block install fails, but parent::install was successfully, you don't have to uninstall the package
        $em->getConnection()->beginTransaction();
        try{

                if(is_object($block)) {
                    $blockId = $block->getBlockTypeID();
                    $db = Core::make('database');
                    //delete of blocktype not in orm way, because there is no entity BlockType
                    $db->query("DELETE FROM BlockTypes WHERE btID = ?", array($blockId));
                }

                parent::uninstall();
            $em->getConnection()->commit();
        }catch(Exception $e){
            $em->getConnection()->rollBack();

            throw $e;
        }
    }


}

