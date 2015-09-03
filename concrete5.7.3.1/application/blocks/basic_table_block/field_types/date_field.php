<?php
namespace Application\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Field as Field;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Blocks\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;
use Concrete\Core\Support\Facade\Log;
use 

class DateField extends Field{
	protected $sqlFieldname;
	protected $label;
	protected $validation;
	protected $value;
	protected $postName;
	protected $errMsg="";

	protected $isNullable = true;
	public static $userFormat = 'd.m.Y';
	public static $seperator = '.';
	public static $formatErrorMessage = t('Bitte geben Sie ein gültiges Datum im Format d.m.Y an, also z.b. 23.01.2015');
	
	public function __construct($sqlFieldname,$label, $postName){
		
		$this->sqlFieldname = $sqlFieldname;
		$this->label = $label;
		$this->postName = $postName;
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
	
	public function setValue($value){
		if(self::$userFormat == 'Y-m-d'){
			$this->value = $value;
		}else{
			$explodeValue = explode(self::$seperator, $value);
			
			//check if Y m d
			if(strlen($explodeValue[0])<=4
				&& strlen($explodeValue[0])>=2	
				&& is_int($value)
				&& is_int($explodeValue[1])
				&& $explodeValue[1]+0 <= 12
				&& $explodeValue[1]+0 >= 1
				&& is_int($explodeValue[2])
				&& $explodeValue[2]+0 <= 31
				&& $explodeValue[2]+0 >= 1){
				try{
					$this->value=(
							new DateTime($explodeValue[0]."-"$explodeValue[1]."-"$explodeValue[2])
							)->format('Y-m-d');
				}catch($e){
					$Log = new Log();
					
				}
			}
		}
	}
	
	public function getTableView(){
		return new DateTime($this->getValue())->format(self::$userFormat);
	}
	
	
	
	public function getFormView($form){
		$returnString = "<label for='".$this->getPostName()."'>".$this->getPostName()."</label>";
		$returnString = '
				<div class="well">
				<div id="dpYears" class="input-append date" data-date-format="dd.mm.yyyy" data-date="'$this->getTableView()'">
				<input class="span2" type="text" value="'.$this->getTableView().'" size="16">
				<span class="add-on">
				<i class="icon-calendar"></i>
				</span>
				</div>
				</div>
				
				';
		return $returnString;
	}
	
	
	
	public function validatePost($value){
		if(is_null($value) || $value == ''){
			if($this->isNullable){
				return true;
			}else{
				return false;
			}
		}
		$explodePattern = explode(self::$seperator,self::$userFormat);
		
		$explodeValue = explode(self::$seperator, $value);
		
		if(count($explodeValue)>3){
			$this->errMsg = self::$formatErrorMessage;
			return false;
		}
		
		for($i = 0; $i < count($explodeValue);$i++){
			switch ($explodePattern[$i]){
				case 'd':
					if(!(is_int($explodeValue[$i])
						 && $explodeValue[$i]+0<= 31) ){
						$this->errMsg = self::$formatErrorMessage;
						return false;
					}
				break;
				case 'm':
					if(!(is_int($explodeValue[$i])
						&& $explodeValue[$i]+0<= 12) ){
						$this->errMsg = self::$formatErrorMessage;
						return false;
					}
					break;
				case 'Y':
					if(!(is_int($explode[$i]) 
					&& strlen($explodeValue[$i]) <= 4
					)){
						$this->errMsg = self::$formatErrorMessage;
						return false;
					}
					break;
					
			}
		}
		return true;
	}
	
	public function getErrorMsg(){
		return $this->errorMsg;
	}
	
	
	
	
}