<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Loader;
use Page;
use Punic\Exception;
use Sabre\VObject\Property\VCard\DateTime;
use User;
use Core;
use File;
use Concrete\Controller\Panel\Detail\Page\Permissions;
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
	/*TODO make userFormat configurable*/
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
        return $this;
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
        return $this;
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
		$returnString = "<label for='".$this->getPostName()."'>".$this->getLabel()."</label>";
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
		$returnString.=$this->getHtmlErrorMsg();		
		return $returnString;
	}



	public function validatePost($value){
		if(is_null($value) || $value == ''){
			if($this->isNullable){
				return true;
			}else{
				$this->errMsg = $this->getLabel().t(static::NULLERRORMSG);
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




	public function getSQLValue(){
		if($this->value == null){
			return null;
		}
		return new \DateTime($this->value);
	}

	public function setSQLValue($value){
		//for now, save the value as Y-m-d, later change to save as DateTime
		if($value instanceof \DateTime){
			$value = $value->format('Y-m-d');
		}
		$this->value = $value;
        return $this;
	}




}
