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
    
    
 ##Package Controller controller.php  
  The Package Controller handles the installation or uninstallation of the Package.
  First the Namespace:
  ```php
  <?php
     namespace Concrete\Package\BasicTablePackage;
```
  The namespace always starts with Concrete\Package for Packages.
  Then follows the modified package folder name (in this case basic\_table\_package)
  You start with camelcase, and when you have a underscore (\_), then you skip the underscore, but the next letter is uppercase.
     
     

