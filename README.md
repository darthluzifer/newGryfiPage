# BasicTablePackage
A Package for Concrete5 to enable easy CRUD funktionality for Doctrine Entities (or other Data Sources).

Important Files/Folders:

* [blocks](blocks/README.md)  
  * [blocks/basic_table_block_packaged](blocks/basic_table_block_packaged/README.md)  
* [languages](languages/README.md)  
* [src](src/README.md)  
  * [src/BlockOptions](src/BlockOptions/README.md)  
  * [src/DiscriminatorEntry](src/DiscriminatorEntry/README.md)  
  * [src/EntityViews](src/EntityViews/README.md)  
  * [src/Exceptions](src/Exceptions/README.md)  
  * [src/FieldTypes](src/FieldTypes/README.md)
*  controller.php
    
    
 ## Package Controller controller.php  
   The Package Controller handles the installation or uninstallation of the Package.  
   First the Namespace:
   ```php
<?php
namespace Concrete\Package\BasicTablePackage;
   ```
   The namespace always starts with Concrete\Package for Packages.
   Then follows the modified package folder name (in this case basic\_table\_package)
   You start with camelcase, and when you have a underscore (\_), then you skip the underscore, but the next letter is uppercase.  
   
   Use statements:  
```php
<?php
use Concrete\Core\Block\BlockType\BlockType;
use Concrete\Core\Package\Package;
use Concrete\Core\Foundation\ClassLoader;
use Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry\DiscriminatorListener;
use Doctrine\ORM\EntityManager;
use Punic\Exception;
use Loader;
use Core;
```
   Remeber that you have to make a use statement for every class you want to use in this file,
   which is not in the same namespace. If you want to use a PHP intern class, you have to prepend a \\ to assure that the global namespace is used.Like for example:  
```php
<?php
new \DateTime()
``` 
   We continue with the class definition this is also for every package the same.
   It always has to extend Package. (I never used inheritence with package controllers until now)
   ```php
<?php
class Controller extends Package
{
    //..class code
}
   ```     
   Then we have some standard properties
   ```php
<?php
class Controller extends Package
{
    protected $pkgHandle = 'basic_table_package';
    protected $appVersionRequired = '5.7.4';
    protected $pkgVersion = '0.0.1';
    //..class code
 }
   ```
  As $pkgHandle you use the name of the package folder (and your project).  
  As $appVersionRequired you take the minimum version of concrete5 required for this package. Because basic_table_package uses Classes for the ORM functionality, concrete5.7.4 or higher is required.  
  As $pkgVersion you always start with 0.0.1 (recomended by Concrete5), and as soon as you want to publish your package on the marketplace, you have to find a system for your version numbering. I don't have one either.
