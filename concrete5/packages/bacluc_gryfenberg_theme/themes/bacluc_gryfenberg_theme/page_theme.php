<?php
namespace Concrete\Package\BaclucGryfenbergTheme\Theme\BaclucGryfenbergTheme;

use Concrete\Core\Page\Theme\Theme;


class PageTheme extends Theme{

	/** 
	 * Set bootstrap as grid frame work
	 * Docs: http://goo.gl/GdvAr7
	 */
	
	protected $pThemeGridFrameworkHandle = 'bootstrap3';

	/** 
	 * Register theme assets
	 * Docs: http://goo.gl/JjCS6c
	 */
	
	public function registerAssets(){
		$this->providesAsset('css', 'bootstrap/*');
		$this->providesAsset('javascript', 'bootstrap/*');
		
		$this->requireAsset('javascript', 'jquery');
		$this->requireAsset('javascript', 'picturefill');
		
	}

	/*
	 * Create responsive images
	 * Thumbnails need to be configured via settings
	 * in the dashboard
	 */
	public function getThemeResponsiveImageMap()
    {
        return array(
            'large' => '900px',
            'medium' => '768px',
            'small' => '0',
        );
    }

    public function getThemeAreaClasses()
    {
        return array(
            'Main' => 'same-height-container'
        );
    }

    public function getThemeBlockClasses()
    {
        return array(
            '*' => array(
                'same-height',
            ),
            'core_area_layout' => array(
                'same-height-container',
            ),
            'feature' => array(
                'fa-lg'
                ,'fa-2x'
                ,'fa-3x'
                ,'fa-4x'
                ,'fa-5x'

            ),



        );
    }


} //end of class extend

?>