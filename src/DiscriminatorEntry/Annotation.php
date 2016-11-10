<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 19.10.16
 * Time: 16:49
 */

namespace Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry;


use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\AnnotationRegistry;
use Doctrine\Common\Annotations\SimpleAnnotationReader;

/**
 * Class Annotation
 * @package Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry
 */
class Annotation
{

    /**
     * @var SimpleAnnotationReader
     */
    public static $reader;

    public static function getAnnotationsForClass( $className ) {
        $class = new \ReflectionClass( $className );
        return Annotation::$reader->getClassAnnotations( $class );
    }

}
//set the reader. Externally, because you cannot set a static property as a return value of a function
Annotation::$reader = new AnnotationReader();
//the function with the default namespace does not exist anymore
AnnotationRegistry::registerAutoloadNamespaces( array(__NAMESPACE__ . "" ));