<?php

namespace Concrete\Package\BasicTablePackage\Src\FieldTypes\HelperBlocks\Content;
use \Concrete\Core\Block\BlockController;
use \Concrete\Core\Editor\LinkAbstractor;
use \Concrete\Block\Content\Controller as ContentBlockController;
use Concrete\Core\Legacy\Loader;
	
/**
 * The controller for the content block.
 *
 * @IgnoreAnnotation("package")\n*  Blocks
 * @subpackage Content
 * @author Andrew Embler <andrew@concrete5.org>
 * @copyright  Copyright (c) 2003-2012 Concrete5. (http://www.concrete5.org)
 * @license    http://www.concrete5.org/license/     MIT License
 *
 */
	class Controller extends ContentBlockController {

		protected $btTable = 'btContentLocal';
		protected $btInterfaceWidth = "600";
		protected $btInterfaceHeight = "465";
		protected $btCacheBlockRecord = false;
		protected $btCacheBlockOutput = false;
		protected $btCacheBlockOutputOnPost = false;
		protected $btSupportsInlineEdit = true;
		protected $btSupportsInlineAdd = false;
		protected $btCacheBlockOutputForRegisteredUsers = false;
		protected $btCacheBlockOutputLifetime = 0; //until manually updated or cleared
		protected $targetTable = "";
		protected $targetCol = "";
		protected $targetIdField = "";
		protected $targetId = null;
		protected $value = '';
		
		
		public function getBlockTypeDescription() {
			return t("HTML/WYSIWYG Editor Content. For Tables, do not use as replacement for content block.");
		}

		public function getBlockTypeName() {
			return t("TableContent");
		}

        public function registerViewAssets($outputContent='')
        {
            if (preg_match('/data-concrete5-link-launch/i', $outputContent)) {
                $this->requireAsset('core/lightbox');
            }
        }
        
        public function setSQLParams(string $targetTable
        							,string $targetCol
        							,string $targetIdField
        							,string $targetId){
        	$this->targetTable = $targetTable;
        	$this->targetCol = $targetCol;
        	$this->targetIdField = $targetIdField;
        	$this->targetId = $targetId;
        }
        
        
        

        public function view()
        {
            $this->set('content', $this->getContent());
        }

		function getContentEditMode() {
			return LinkAbstractor::translateFromEditMode($this->content);
		}

		
		public function setValue($value){
			$this->value = $value;
			
		}
		
		public function getValue(){
			return $this->value;
		}
		
		public function getImportData($blockNode,$page) {
			//$content = $blockNode->data->record->content;
			/*
			if(!is_null($this->targetId)){
				$db = Loader::db();
				$sql = 'SELECT '.$this->targetCol.' 
						FROM '.$this->targetTable.' 
						WHERE '.$this->targetIdField.' = ?';
				$content = $db->getOne($sql, array($this->targetId));
			}else{
				$content = '';
			}*/
			$content = $this->value;
			if($content == null || $content == false){
				$content = '';
			}
			$content = LinkAbstractor::import($content);
			$this->value = content;
			$args = array('content' => $content);
			return $args;
		}

		

		function save($args) {
			$this->value = LinkAbstractor::translateTo($args['content']);
			
			//parent::save($args);
		}

		public function getContent()
		{
			return LinkAbstractor::translateFrom($this->value);
		}

	}

	
	
?>
