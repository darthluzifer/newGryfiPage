<?php
namespace Concrete\Package\BasicTablePackage\Src\BlockOptions;

use Concrete\Package\BasicTablePackage\Src\BlockOptions\TableBlockOption;
class CanEditOption extends TableBlockOption{
    protected $possibleValues = array(
        "test" => 1,
        "test2" => 1,
    );

    public function __construct(){

    }


}