(function($){
    'use strict';

    var container, options, template, input;


    Concrete.event.bind('basic-table', function() {
        container = $('div.basic-table-edit');
        options = $("div.action-options", container);
        template = _($("script[role='option']", container).remove().html()).template();
        input = $('input.option-value', container);

        container.find('button.add-option').click(function(e) {
            addOption();

            e.preventDefault();
            return false;
        });

        attachDelete(options);
    });

    function attachDelete(elem) {
        elem.find('a.delete').click(function(e) {
            $(this).closest('div.basic-table-option').remove();
            if (options.children().length === 0) {
                $("<div class='empty'>None</div>").appendTo(options)
            }
        });
    }

    function addOption() {
        var value = input.val().trim();
        if (value.length) {
            input.val('');
            options.children('div.empty').remove();

            var elem = $(template({value: value}));
            attachDelete(elem);
            options.append(elem);
        }
    }

}(jQuery));
