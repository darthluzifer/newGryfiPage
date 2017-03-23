<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 23.03.17
 * Time: 09:58
 */

namespace Concrete\Package\BasicTablePackage\Src\Import;


use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Port\Reader;

class EntityDataComparer
{
    /**
     * @var BaseEntity
     */
    protected $model;

    /**
     * @var Reader
     */
    protected $reader;

    public function __construct(BaseEntity $model, Reader $reader)
    {
        $this->model = $model;
        $this->reader = $reader;
    }

    public function compare(){
        foreach ($this->reader as $row) {
            print_r($row);
        }
    }

}