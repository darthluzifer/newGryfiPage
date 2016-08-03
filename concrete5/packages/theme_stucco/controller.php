<?php 
namespace Concrete\Package\ThemeStucco;

use Package;
use BlockType;
use SinglePage;
use PageTheme;
use BlockTypeSet;
use Loader;
use FileImporter;

use \Concrete\Core\Tree\Type\Topic;
use \Concrete\Core\Attribute\Key\CollectionKey as CollectionAttributeKey;

defined('C5_EXECUTE') or die(_("Access Denied."));

class Controller extends Package
{

	protected $pkgHandle = 'theme_stucco';
	protected $appVersionRequired = '5.7.3';
	protected $pkgVersion = '1.1.2';
	protected $pkgAllowsFullContentSwap = true;

	public function getPackageDescription()
	{
    	return t("A simple style business theme based on the Bootstrap framework.");
	}

	public function getPackageName()
	{
    	return t("Stucco");
	}

    public function import_files()
    {
            // now we add in any files that this package has
            if (is_dir($this->getPackagePath() . '/content_files'))
             {

                $fh = new FileImporter();
                $contents = Loader::helper('file')->getDirectoryContents($this->getPackagePath() . '/content_files');

                foreach ($contents as $filename)
                {
                    $f = $fh->import($this->getPackagePath() . '/content_files/' . $filename, $filename);
                }
            }
    }

	public function install()
	{
    	$pkg = parent::install();
    	BlockTypeSet::add("theme_stucco","Stucco", $pkg);
        BlockType::installBlockTypeFromPackage('stucco_anchor_block', $pkg);
        BlockType::installBlockTypeFromPackage('stucco_description_list_block', $pkg);
        BlockType::installBlockTypeFromPackage('stucco_heading', $pkg);
		PageTheme::add('stucco', $pkg);

		$small = \Concrete\Core\File\Image\Thumbnail\Type\Type::getByHandle('small');
		if (!is_object($small)) {
			$type = new \Concrete\Core\File\Image\Thumbnail\Type\Type();
			$type->setName('Small');
			$type->setHandle('small');
			$type->setWidth(740);
			$type->save();
		}
		$medium = \Concrete\Core\File\Image\Thumbnail\Type\Type::getByHandle('medium');
		if (!is_object($medium)) {
			$type = new \Concrete\Core\File\Image\Thumbnail\Type\Type();
			$type->setName('Medium');
			$type->setHandle('medium');
			$type->setWidth(940);
			$type->save();
		}
		$large = \Concrete\Core\File\Image\Thumbnail\Type\Type::getByHandle('large');
		if (!is_object($large)) {
			$type = new \Concrete\Core\File\Image\Thumbnail\Type\Type();
			$type->setName('Large');
			$type->setHandle('large');
			$type->setWidth(1140);
			$type->save();
		}
	}

}
?>