<?php 
namespace Concrete\Package\BaclucGryfenbergTheme;

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

	protected $pkgHandle = 'bacluc_gryfenberg_theme';
	protected $appVersionRequired = '5.7.3';
	protected $pkgVersion = '0.1';
	public function getPackageDescription()
	{
    	return t("The Theme for Gryfenberg Website");
	}

	public function getPackageName()
	{
    	return t("Gryfenberg Theme");
	}


	public function install()
	{
    	$pkg = parent::install();
		PageTheme::add('gryfenberg', $pkg);

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