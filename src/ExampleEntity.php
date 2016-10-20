<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 21.12.15
 * Time: 14:53
 */

namespace Concrete\Package\BasicTablePackage\Src;


use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\Table;
/**
 * Class ExampleEntity
 * @IgnoreAnnotation("package")
 *  Concrete\Package\BasicTablePackage\Src
 * @Entity
 * @Table(name="btExampleEntity")
 */
class ExampleEntity extends BaseEntity
{
    use EntityGetterSetter;
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     * @Column(type="string")
     */
    protected $value;



    public function __construct(){
        parent::__construct();
        $this->fieldTypes['id']=new FieldTypes\Field('id', 'ID', 'identifier');
        $this->fieldTypes['value']=new FieldTypes\Field('value', 'Value', 'value');
    }




}