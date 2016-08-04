<?php 
namespace Concrete\Package\BaclucGryfenbergTheme\Theme\Gryfenberg;

class PageTheme extends \Concrete\Core\Page\Theme\Theme {

	public function registerAssets() {
        //$this->providesAsset('javascript', 'bootstrap/*');
		$this->providesAsset('css', 'bootstrap/*');
		$this->providesAsset('css', 'blocks/form');
		$this->providesAsset('css', 'core/frontend/*');
		$this->requireAsset('css', 'font-awesome');
		$this->requireAsset('javascript', 'jquery');
		$this->requireAsset('javascript', 'bootstrap/tooltip');
		$this->requireAsset('css', 'bootstrap/tooltip');
		$this->requireAsset('javascript', 'picturefill');
	}

    protected $pThemeGridFrameworkHandle = 'bootstrap3';

    public function getThemeResponsiveImageMap()
    {
        return array(
            'large' => '900px',
            'medium' => '768px',
            'small' => '0'
        );
    }

    public function getThemeEditorClasses()
    {
        return array(
            array(
            	'title' => t('Title Thin'),
            	'menuClass' => 'title-thin',
            	'spanClass' => 'title-thin'
            ),
            array(
            	'title' => t('Title Bold'),
            	'menuClass' => 'title-bold',
            	'spanClass' => 'title-bold'
            ),
            array(
            	'title' => t('Title Caps'),
            	'menuClass' => 'title-caps',
            	'spanClass' => 'title-caps'
            ),
            array(
            	'title' => t('Headline'),
            	'menuClass' => '',
            	'spanClass' => 'title-headline'
            ),
            array(
            	'title' => t('Subhead'),
            	'menuClass' => '',
            	'spanClass' => 'title-subhead'
            ),
            array(
            	'title' => t('Image Caption'),
            	'menuClass' => 'image-caption',
            	'spanClass' => 'image-caption'
            ),
            array(
            	'title' => t('Standard Button'),
				'menuClass' => '',
				'spanClass' => 'btn btn-default'
			),
            array(
            	'title' => t('Success Button'),
            	'menuClass' => '',
            	'spanClass' => 'btn btn-success'
            ),
            array(
            	'title' => t('Primary Button'),
            	'menuClass' => '',
            	'spanClass' => 'btn btn-primary'
            ),
            array(
            	'title' => t('Link Mark'),
            	'menuClass' => 'link-mark',
            	'spanClass' => 'link-mark'
            )

        );
    }

}
