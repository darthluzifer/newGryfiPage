<?php
namespace Concrete\Package\BasicTablePackage\BasicTableBlock\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Field as Field;
use Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\FieldTypes\DropdownField as DropdownField;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Pages\Types\Permissions;
use Concrete\Core\Block\View\BlockView as View;

class DropdownLinkField extends DropdownField{
	protected $linktable;
	protected $sqlfilter = " 1=1 ";
	protected $sqlvars = array();
	protected $showcolumn;
	protected $isNullable = false;
	protected $idField = 'id';
    /**
     * @var Entity
     */
	protected $sourceEntity;

    /**
     * @var String
     */
    protected $sourceField;

    /**
     * @var string
     */
    protected $targetEntity;

    /**
     * @var callable
     */
    protected $getDisplayString;
    /**
     * @var string
     */
    protected $targetField;

    /**
     * @var array
     */
    protected $filter;

    //TODO check if $callable's first parameter is of class Entity

    public function setLinkInfo(Entity $sourceEntity,string $sourceField,String $targetEntity,string $targetField = null, callable $getDisplayString=null, array $filter = null){
        $this->sourceEntity = $sourceEntity;
        $this->sourceField = $sourceField;
        $this->targetEntity = $targetEntity;
        $this->targetField = $targetField;
        $this->getDisplayString = $getDisplayString;
        $this->filter = $filter;
    }

    public function setGetDisplayString(callable $getDisplayString){
        $this->getDisplayString = $getDisplayString;
    }

    public function setFilter(array $filter){
        $this->filter = $filter;
    }

	/**
	 * set the tablename of the linktable (Table, the foreign key points to
	 * @param String $tablename
	 */
	public function setLinkTable( $tablename){
		$this->linktable = $tablename;
	}
	
	/**
	 * sets the sql filter string for prepare and the vars to insert
	 * @param String $sqlfilter
	 * @param array $sqlvars
	 */
	public function setSQLFilter( $sqlfilter, array $sqlvars = array()){
		$this->sqlfilter = $sqlfilter;
		$this->sqlvars = $sqlvars;
	}
	
	/**
	 * sets the columnname which should be shown
	 * @param String $showcolumnname
	 */
	public function setShowColumn( $showcolumnname){
		$this->showcolumn = $showcolumnname;
	}
	
	/**
	 * set if the col is nullable
	 * @param Boolean $isNullable
	 */
	public function setNullable($isNullable = true){
		$this->isNullable = $isNullable;
	}
	
	/**
	 * 
	 * @return boolean
	 */
	public function getNullable(){
		return $this->isNullable;
	}
	
	/**
	 * set the Fieldname of the idField to save in db
	 * @param String $idfieldname
	 */
	public function setIdField( $idfieldname){
		$this->idField = $idfieldname;
	}
	
	/**
	 * 
	 * @return string
	 */
	public function getIdField(){
		return $this->idField;
	}
	
	/**
	 * @return array of options
	 */
	public function getOptions(){

		$db = Loader::db();
		if(count($this->options) ==0){
			$options = array();
			$sql = "SELECT ".$this->getIdField().", ".$this->showcolumn." FROM ".$this->linktable."
					WHERE ".$this->sqlfilter;
			
			$r = $db->query($sql, $this->sqlvars);
			
			$tabledata = array();
			while ($row = $r->fetchRow()) {
				$options[$row[$this->getIdField()]]=$row[$this->showcolumn];
			}
		}else{
			return $this->options;
		}
		
		if($this->getNullable()){
			$options = array(""=>"")+$options;
		}
		$this->setOptions($options);
		return $this->options;
	}



}