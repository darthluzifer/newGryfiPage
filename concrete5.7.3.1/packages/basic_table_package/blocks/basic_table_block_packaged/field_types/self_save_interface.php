<?php
namespace Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\FieldTypes;

interface SelfSaveInterface{
	//some function that saves the values itself, not by the block
	public function saveValues($value);
}