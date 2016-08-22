<?php
namespace Concrete\Package\BaclucPersonPackage\Src\FieldTypes\AddressField;
use Concrete\Package\BaclucPersonPackage\Src\AddressInterface;

/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.08.16
 * Time: 17:48
 */
class AddressFieldTypeFactory
{
    /**
     * @param AddressInterface $model
     * @param $sqlFieldname
     * @param $label
     * @param $postName
     * @param bool $showInTable
     * @param bool $showInForm
     * @return AddressField
     */
  public static function getFieldInstance(AddressInterface $model, $sqlFieldname,$label, $postName, $showInTable = true, $showInForm = true) {
        $classname = get_class($model);
      $fieldclassname = $classname::getFieldTypeClass();
      return new $fieldclassname($sqlFieldname,$label, $postName, $showInTable, $showInForm);
  }
}