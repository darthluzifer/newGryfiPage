/**
 * Created by lucius on 22.02.17.
 */


(function($,window){

        $(window).on("load resize", function(e){
            //first find all same height containers
            $('.same-height-container').each(function(e){



                //first reset the previous set height
                $(this).find(".same-height").each(function(e){
                    if($(this).is("[data-sameheight-heightbackup]")){
                        $(this).attr("height",$(this).attr("data-sameheight-heightbackup") );
                    }
                    if($(this).is("[data-sameheight-cssheightbackup]")){
                        $(this).css("style",$(this).attr("data-sameheight-cssheightbackup") );
                    }

                });

                var maxheight = 0;
                    //find max height
                $(this).find(".same-height").each(function(e){
                        if(maxheight<$(this).height()){
                            maxheight =$(this).height();
                        }
                });
                    //now set the height of each element, backup the previous height (if set). If the height was set with css before, the backup is already there
                $(this).find(".same-height").each(function(e){
                    if($(this).is("[height]")){
                        $(this).attr("data-sameheight-heightbackup",$(this).attr("height") );
                        $(this).removeAttribute('height');
                    }
                    var style = $(this).attr('style');
                    if(style) {
                        if (style.test(new RegExp('^ *height *:'))) {
                            $(this).attr("data-sameheight-cssheightbackup", $(this).css("height"));
                            $(this).css("height", "");
                        }
                    }
                    $(this).height(maxheight);

                });

                }
            );
        });
})(jQuery,window)

