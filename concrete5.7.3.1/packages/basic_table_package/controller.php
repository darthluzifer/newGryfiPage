<?php
namespace Concrete\Package\BasicTablePackage;

defined('C5_EXECUTE') or die(_("Access Denied."));


use Concrete\Core\Block\BlockType\BlockType;
use Concrete\Core\Package\Package;
use Concrete\Core\Foundation\ClassLoader;
use Punic\Exception;
use Loader;
use Core;

class Controller extends Package
{

    protected $pkgHandle = 'basic_table_package';
    protected $appVersionRequired = '5.7.4';
    protected $pkgVersion = '0.0.1';

    protected $pkgAutoloaderRegistries = array(
      //  'src/FieldTypes/Statistics' => '\BasicTablePackage\FieldTypes'
           'src'                      => 'Concrete\Package\BasicTablePackage\Src'
    );

    public function getPackageName()
    {
        return t("BasicTablePackage");
    }

    public function getPackageDescription()
    {
        return t("Package to provide a basic CRUD from DB to GUI");
    }

    public function install()
    {
       $em = $this->getEntityManager();

        //begin transaction, so when block install fails, but parent::install was successfully, you don't have to uninstall the package
        $em->getConnection()->beginTransaction();
        try {

            $pkg = parent::install();
            BlockType::installBlockType("basic_table_block_packaged", $pkg);

            $em->getConnection()->commit();
        }catch(Exception $e){
            $em->getConnection()->rollBack();

            throw $e;
        }


    }

    public function uninstall()
    {
        $block = BlockType::getByHandle("basic_table_block_packaged");
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

