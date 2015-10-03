<?php
namespace Application\Block\BasicTableBlock\FieldTypes;

use Concrete\Core\Block\BlockController;
use Application\Block\BasicTableBlock\Field as Field;
use Loader;
use Page;
use Punic\Exception;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Blocks\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;
use Concrete\Core\Support\Facade\Log;

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
	public static $formatErrorMessage = 'Bitte geben Sie ein gültiges Datum im Format d.m.Y an, also z.b. 23.01.2015';

	/**
	 * @param $sqlFieldname
	 * @param $label
	 * @param $postName
     */
	public function __construct($sqlFieldname,$label, $postName){
		parent::__construct($sqlFieldname,$label,$postName);
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
		//var_dump($value);
		if($value == '' OR $value == null){
			$this->value = null;
			return;
		}
		if(self::$userFormat == 'Y-m-d'){
			$this->value = $value;
		}else{
			$explodeValue = explode(self::$seperator, $value);
			//var_dump($explodeValue);
			/*
			var_dump(strlen($explodeValue[2])<=4);
			var_dump(strlen($explodeValue[2])>=2);
			var_dump(is_numeric($explodeValue[2]));
			var_dump(is_numeric($explodeValue[1]));
			var_dump($explodeValue[1]+0 <= 12);
			var_dump($explodeValue[1]+0 >= 1);
			var_dump(is_numeric($explodeValue[0]));
			var_dump($explodeValue[0]+0 <= 31);
			var_dump($explodeValue[0]+0 >= 1);
			*/
			
			//check if Y m d
			if(strlen($explodeValue[0])<=4
				&& strlen($explodeValue[0])>=2
				&& is_numeric($explodeValue[1])
				&& $explodeValue[1]+0 <= 12
				&& $explodeValue[1]+0 >= 1
				&& is_numeric($explodeValue[2])
				&& $explodeValue[2]+0 <= 31
				&& $explodeValue[2]+0 >= 1){
				try{
					$this->value=(
							new \DateTime($explodeValue[0]."-".$explodeValue[1]."-".$explodeValue[2])
							)->format('Y-m-d');
				}catch(Exception $e){
					
				}
			//check if d m Y
			}elseif(strlen($explodeValue[2])<=4
				&& strlen($explodeValue[2])>=2
				&& is_numeric($explodeValue[2])
				&& is_numeric($explodeValue[1])
				&& $explodeValue[1]+0 <= 12
				&& $explodeValue[1]+0 >= 1
				&& is_numeric($explodeValue[0])
				&& $explodeValue[0]+0 <= 31
				&& $explodeValue[0]+0 >= 1){
				try{
					$this->value=(
					new \DateTime($explodeValue[2]."-".$explodeValue[1]."-".$explodeValue[0])
							)->format('Y-m-d');
				}catch(Exception $e){

				}
			//check if m d Y
			}elseif(strlen($explodeValue[2])<=4
				&& strlen($explodeValue[2])>=2
				&& is_numeric($explodeValue[2])
				&& is_numeric($explodeValue[0])
				&& $explodeValue[0]+0 <= 12
				&& $explodeValue[0]+0 >= 1
				&& is_numeric($explodeValue[1])
				&& $explodeValue[1]+0 <= 31
				&& $explodeValue[1]+0 >= 1){
				try{
					$this->value=(
					new \DateTime($explodeValue[2]."-".$explodeValue[0]."-".$explodeValue[1])
							)->format('Y-m-d');
				}catch(Exception $e){

				}
			}

		}
		
		$this->setSQLValue($this->value);
	}
	
	public function getTableView(){
		if($this->getValue() == null){
			return null;
		}
		//var_dump($this->getValue());
		//return $this->getValue();
		return (new \DateTime($this->getValue()))->format(self::$userFormat);
	}
	
	
	
	public function getFormView($form){
		$returnString = "<label for='".$this->getPostName()."'>".$this->getPostName()."</label>";
		$returnString .= '
				<div  class="input-append date datepickerdiv" data-date-format="dd.mm.yyyy" data-date="' . $this->getTableView() . '">
				<input id="'.$this->getPostName().'" name="'.$this->getPostName().'"  type="text" value="' . $this->getTableView() . '" size="16">

				</div>
				<script>
					$(function(e){
						$("#'.$this->getPostName().'").datepicker({format:"dd.mm.yyyy"});

					});

				</script>
				';
		return $returnString;
	}
	
	
	
	public function validatePost($value){
		if(is_null($value) || $value == ''){
			if($this->isNullable){
				return true;
			}else{
				$this->errMsg = t("Das Datum muss angegeben werden");
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
					if(!(is_numeric($explodeValue[$i]+0)
						 && $explodeValue[$i]+0<= 31) ){
						$this->errMsg = t(self::$formatErrorMessage);
						return false;
					}
				break;
				case 'm':
					if(!(is_numeric($explodeValue[$i]+0)
						&& $explodeValue[$i]+0<= 12) ){
						$this->errMsg = t(self::$formatErrorMessage);
						return false;
					}
					break;
				case 'Y':
					if(!(is_numeric($explodeValue[$i]+0)
					&& strlen($explodeValue[$i]) <= 4
					)){
						$this->errMsg = t(self::$formatErrorMessage);
						return false;
					}
					break;
					
			}
		}
		//var_dump($value);
		$this->setValue($value);
		//var_dump($this->value);
		//exit();
		return true;
	}
	
	public function getErrorMsg(){
		return $this->errorMsg;
	}
	
	
	
	
}