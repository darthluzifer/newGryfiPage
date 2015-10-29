<?php
namespace Concrete\Block\Content;
use \Concrete\Core\Block\BlockController;
use \Concrete\Core\Editor\LinkAbstractor;
use \Concrete\Blocks\Content\Controller as ContentBlockController;
use Concrete\Core\Legacy\Loader;
	
/**
 * The controller for the content block.
 *
 * @package Blocks
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
		protected $targetId = 0;
		
		
		public function getBlockTypeDescription() {
			return t("HTML/WYSIWYG Editor Content. For Tables, do not use as replacement for content block.");
		}

		public function getBlockTypeName() {
			return t("TableContent");
		}

        public function registerViewAssets($outputContent)
        {
            if (preg_match('/data-concrete5-link-launch/i', $outputContent)) {
                $this->requireAsset('core/lightbox');
            }
        }

        public function view()
        {
            $this->set('content', $this->getContent());
        }

		function getContentEditMode() {
			return LinkAbstractor::translateFromEditMode($this->content);
		}

		

		
		public function getImportData($blockNode) {
			//$content = $blockNode->data->record->content;
			$db = Loader::db();
			$sql = 'SELECT '.$this->targetCol.' 
					FROM '.$this->targetTable.' 
					WHERE '.$this->targetIdField.' = ?';
			$content = $db->getOne($sql, array($this->targetId));
			if($content == null || $content == false){
				$content = '';
			}
			$content = LinkAbstractor::import($content);
			$args = array('content' => $content);
			return $args;
		}

		

		function save($args) {
			$args['content'] = LinkAbstractor::translateTo($args['content']);
			$db = Loader::db();
			$entitymanager = $db->getEntityManager();
			$entitymanager->
			//parent::save($args);
		}

	}

?>
