/**
 * Created by lucius on 23.08.16.
 */

(function($){
    $(function(e) {
        function add_remove_on_click_handler(){
            $('button.btn.bacluc-inlineform.actionbutton.delete').off("click");
            $('button.btn.bacluc-inlineform.actionbutton.delete').click(function(e){
                $(this)
                //div.subentityrowedit.row
                    .parent()
                    //div.col-xs-12 (foreach entity row)
                    .parent().remove();
            });
        }


        $('button.btn.bacluc-inlineform.actionbutton.add').click(function(e) {
            var hiddenrow = $(this).parent().find('div.hidden_form_row');
            var hiddenrowcopy = $($(this).parent().find('div.hidden_form_row').html());
            var parentpostname = $(hiddenrow).find('div.parent_postname').text();
            var rownum = $(hiddenrow).find('div.rownum').text();
            var prepend_before_realname = $(hiddenrow).find('div.prepended_before_realname').text();

            rownum = parseInt(rownum);

            //update the old rownum
            $(hiddenrow).find('div.rownum').text(rownum + 1);
            /**
             *
             * @param parentpostname
             * @param rownum
             * @param prependet_before_realname
             * @param currentpostname
             * @returns {string}
             */
            function renameAttribute(parentpostname, rownum, prependet_before_realname, currentpostname) {
                var newprepend = parentpostname + "[" + rownum + "][";
                var postname = currentpostname.substr(prependet_before_realname.length);
                return newprepend + postname + "]";
            }

            //now rename id and name of new row
            $(hiddenrowcopy).find('*').each(function (e) {


                if ($(this).is('[id]')) {
                    $(this).attr('id', renameAttribute(parentpostname, rownum, prepend_before_realname, $(this).attr('id')));
                }
                if ($(this).is('label[for]')) {
                    $(this).attr('for', renameAttribute(parentpostname, rownum, prepend_before_realname, $(this).attr('for')));
                }
                if ($(this).is('input[name]') || $(this).is('textarea[name]') || $(this).is('select[name]')) {
                    $(this).attr('name', renameAttribute(parentpostname, rownum, prepend_before_realname, $(this).attr('name')));
                    if(window.parsley) {
                        $(this).on('change, keyup', function (e) {
                            $(this).parsley().validate();
                        });
                    }
                }



            });
            $(hiddenrow).parent().find('div.bacluc-realrows ').append(hiddenrowcopy);
            add_remove_on_click_handler();
        });

        add_remove_on_click_handler();





    });
})(jQuery)
