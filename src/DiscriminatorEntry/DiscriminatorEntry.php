<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 19.10.16
 * Time: 16:48
 */

namespace Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry;

/**
 * Class DiscriminatorEntry
 * package Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry
 * @Annotation
 * @Target({"CLASS"})
 * @Attributes({
 *   @Attribute("value", type = "string"),
 * })
 */
class DiscriminatorEntry
{
    private $value;

    public function __construct( array $data ) {
        $this->value = $data['value'];
  }

    public function getValue() {
        return $this->value;
    }
}