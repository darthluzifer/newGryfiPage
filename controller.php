<?php 
namespace Concrete\Package\BaclucGryfenbergTheme;

use Concrete\Core\Package\Package;
use Concrete\Core\Page\Theme\Theme;

defined('C5_EXECUTE') or die('Access Denied');

class Controller extends Package{

	protected $pkgHandle = 'bacluc_gryfenberg_theme';
	protected $appVersionRequired = '5.7.2';
	protected $pkgVersion = '0.5.0';

	public function getPackageName(){
		return t('Gryfenberg Theme');
	}

	public function getPackageDescription(){
		return t('Gryfenberg Theme for Scout Group Gryfenberg');
	}


	public function install(){
		
		$pkg = parent::install();

		//install Theme
		Theme::add('bacluc_gryfenberg_theme', $pkg);
		
	}
}