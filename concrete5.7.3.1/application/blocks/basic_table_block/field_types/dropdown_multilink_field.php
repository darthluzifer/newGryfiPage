<?php
namespace Application\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Field as Field;
use Application\Block\BasicTableBlock\FieldTypes\DropdownField as DropdownField;
use Application\Block\BasicTableBlock\FieldTypes\DropdownLinkField as DropdownLinkField;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Blocks\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;

class DropdownMultilinkField extends DropdownLinkField{
	protected $linktable;
	protected $ntomtable;
	protected $sqlfilter = " 1=1 ";
	protected $sqlvars = array();
	protected $showcolumn;
	protected $isNullable = false;
	protected $linkfieldself;
	protected $linkfieldext;
	protected $rowid;
	protected $idfieldext;
	protected $idfieldself;
	protected $values = array();
	protected $allowAdd = false;
	
	
	
	/**
	 * set the tablename of the n to m table
	 * @param String $tablename
	 */
	public function setNtoMTable( $tablename){
		$this->ntomtable = $tablename;
	}
	
	/**
	 * set the colname of the column that points to the self table
	 * @param String $colname
	 */
	public function setLinkFieldSelf( $colname){
		$this->linkfieldself = $colname;
	}
	
	/**
	 * set the colname of the column that points to the extern table
	 * @param String $colname
	 */
	public function setLinkFieldExt( $colname){
		$this->linkfieldext = $colname;
	}
	
	
	/**
	 * set the colname of the idfield of the own table
	 * @param String $colname
	 */
	public function setIdFieldSelf( $colname){
		$this->idfieldself = $colname;
	}
	
	/**
	 * set the colname id Field in the linktable
	 * @param String $colname
	 */
	public function setIdFieldExt( $colname){
		$this->idfieldext = $colname;
	}
	
	/**
	 * set the id of the row the col is in
	 * @param String $colname
	 */
	public function setRowId( $id){
		$this->rowid = $id;
	}
	
	public function setAllowAdd($isAllowed = true){
		$this->allowAdd = $isAllowed;
	}
	
	public function setValue($value){
	
		$this->value = $value;
	}
	
	public function getTableView(){
		$values = $this->getValues();
		return implode(", ", $values);
	}
	
	
	public function getFormView($form){
		$html = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";
		

		$values = $this->getValues();
		$valuestring = implode(", ", $values);
		$html .= "<input type='text' width = '100%' id='".$this->getPostName()."' name ='".$this->getPostName()."' value='$valuestring'/>";
		
		
		$options = $this->getOptions();
		$sourcetext = "'".implode("', '", $options)."'";
		$allowadd = 'false';
		if($this->allowAdd){
			$allowadd = 'true';
		}
		
		$html .="
				<script type = 'text/javascript'>
					$(document).ready(function(e){
						$('#".$this->getPostName()."').tagsinput({
						  freeInput: $allowadd,
						  typeahead: {
						    source: [$sourcetext]
						  }
						});
					});
				</script>
				";
		return $html;
	}
	
	
	
	public function getValue(){
		return $this->value;
	}
	
	
	
	
	
	public function validatePost($value){
		$values = array_keys($this->getOptions());
		if(in_array($value, $values)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * get the Values of 
	 * @return Ambigous <multitype:, unknown>
	 */
	private function getValues(){
		if(count($this->values)==0 && !is_null($this->rowid)){
			
			
			
			$db = Loader::db();
			$sql = "SELECT l.".$this->idfieldext." as key,l.".$this->showcolumn." as value FROM 
					".$this->linktable." l
					JOIN ".$this->ntomtable." nm ON l.".$this->idfieldext." = nm.".$this->linkfieldext."
					WHERE nm.".$this->linkfieldself." = ?	
					";
			if(strlen($this->sqlfilter) > 0){
				$sql .= " AND ".$this->sqlfilter;
			}
			$filtervalues = array($this->rowid);
			if(count($this->sqlvars)>0){
				$filtervalues+=$this->sqlvars;
			}
			$r = $db->query($sql, $this->rowid);
			
			while ($row = $r->fetchRow()) {
				$this->values[$row['key']]=$row['value'];
			}
		}
		return $this->values;
	}
	
	



}