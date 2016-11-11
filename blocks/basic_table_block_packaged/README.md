# The Basic Table Block
This is the block which provides the basic crud functionality for database tables, and can be modified to serve other purposes.
The css folder contains the css needed, the js folder the js needed. Most of them are unmodified library code,
except for
  
[clientSideValidation.js](js/clientSideValidation.js)  
This file is needed to provide client side validation, which is done on one side with the native HTML client side validation, and with the [parsley.js]() library.  

[DirectEditAssociatedEntityMultipleField.js](js/DirectEditAssociatedEntityMultipleField.js)  
This file adds the autocompletion for DirectEditAssociatedEntity and DirectEditAssicatiedEntityMultiple Fields and the add/remove functionality for the DirectEditAssicatiedEntityMultiple.  

In the views directory are the table and the form view of the block.

## The Package Controller
The [controller.php](controller.php) is the Package Controller, the most important file. 
It contains all the needed Functions and some helpers.  
The normal live cycle of a table package is as follows
1. Adding Block to Area
    1. function __construct is called (see 2.i)
    2. function getBlockOptions is called (in file [add.php](add.php), which includes [edit.php](edit.php))
        1. If no block Id (bID) is set, the required Options are returned
        2. Else the already saved BlockOptions are loaded and returned
     3. Foreach Block Option, the Form View is called (Which displays a label and a input for the block option. If it is already filled with data, the data is displayed)
     4. When the user presses add, post request is sent and function save is called with the post variables
         1. parent::save($args) is called
         2. BasicTableInstance is loaded
             1. If there is already a BasicTableInstance with the same id as the block, this is returned
             2. else a new one is generated and returned
         1. the sendt values get compared with the required options, given the right options to validate, 
         then everything gets persisted and the new Block is created.
2. Editing existing Block: same as 1.
3. Deleting Block:
    1. BasicTableInstance is deleted
    2. parent::delete is called
    3. if everything is ok, transaction is commited, else rollback
4. Table View
    1. function __construct is called
        1. parent constructor is called
        2. Session is checked if editkey exists
        3. model is found. If no Model is provided by child class, \Concrete\Package\BasicTablePackage\Src\ExampleEntity is taken
        4. If editkey is set, the right model is loaded, else a new one is generated
        5. Postfieldmap is generated. (a map where the key is the postname of a field, and the value is the sql fieldname)
        6. It is checked if the session variable set which indicates that we are in form view.
        7. BasicTableInstance is loaded (which holds the blockoptions)
        8. The required BlockOptions are loaded
     2. [view.php](view.php) is called
        1. Because view.php may be called several times, it is checked if the block has already been executed. if not, continue
        2. then, [views/table_view.php](views/table_view.php) is included
           1. The table data is loaded with function displayTable() as 2 dimensional associative array.
           2. Icon to create Entry is created
           3. Iteration through the Fields to display the header column
           4. Iteration through the rows to display all the rows
               1. Iteration through the fields: First instead of displaying the id, displayActions is called
                  1. In DisplayAction the id of the row is saved, and the icons to edit or delete are displayed
               2. Iteration through the fields: For all the other fields, the value of the row is set as the SQL Value of the field. Then the getTableView is called on the Field to get the HTML for the table cell
           2. Icon to create Entry is created
         1. The Controller is set to executed
     