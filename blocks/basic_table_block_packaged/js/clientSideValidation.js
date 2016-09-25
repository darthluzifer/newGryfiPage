/**
 * Created by lucius on 25.09.16.
 */
(function($){
    $('form').each(function(){
        if($(this).hasClass('bacluc-client-side-validation') && !$(this).hasClass('bacluc-parsley-activated')){
            $(this).parsley({

            });
            $(this).addClass('bacluc-parsley-activated');

            //on cancel click, turn of validation
            $(this).find('input[name="cancel"]').click(function(e){
                //turn off html validation
                $(this).parent('form').attr('novalidate','true')
                 //turn off parsley validation
                 .parsley().destroy();

                //continue bubbling
                return true;
            });

            //validate on input
            $(this).find('input,textarea,select').on('change, keyup', function(e){
                $(this).parsley().validate();
            });
        }
    });
})(jQuery);