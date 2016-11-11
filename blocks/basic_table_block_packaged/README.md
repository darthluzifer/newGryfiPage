# The Basic Table Block
This is the block which provides the basic crud functionality for database tables, and can be modified to serve other purposes.
The css folder contains the css needed, the js folder the js needed. Most of them are unmodified library code,
except for
  
[clientSideValidation.js](js/clientSideValidation.js)  
This file is needed to provide client side validation, which is done on one side with the native HTML client side validation, and with the [parsley.js]() library.  

[DirectEditAssociatedEntityMultipleField.js](js/DirectEditAssociatedEntityMultipleField.js)  
This file adds the autocompletion for DirectEditAssociatedEntity and DirectEditAssicatiedEntityMultiple Fields and the add/remove functionality for the DirectEditAssicatiedEntityMultiple.  

In the views directory are the table and the form view of the block.
