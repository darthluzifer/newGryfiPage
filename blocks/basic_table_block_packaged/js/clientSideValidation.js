/**
 * Created by lucius on 25.09.16.
 */
(function($){
    $('form').each(function(){
        if($(this).hasClass('bacluc-client-side-validation') && !$(this).hasClass('bacluc-parsley-activated')){
            $(this).parsley({

            });
            $(this).addClass('bacluc-parsley-activated');

            $(this).find('input[name="cancel"]').click(function(e){
                //turn off html validation
                $(this).parent('form').attr('novalidate','true')
                 //turn off parsley validation
                 .parsley().destroy();

                //continue bubbling
                return true;
            })
        }
    });
})(jQuery);