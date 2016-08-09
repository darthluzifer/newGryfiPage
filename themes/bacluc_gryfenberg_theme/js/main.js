(function($){

	//the code...

    $(function(e){
        $(".dropdown").each(function(e){
            //if a dropdown is active, it should also be open
            if($(this).hasClass("active")){
                $(this).addClass("open");
            }
            $(this).on("click touch",function(e){

                if(
                    //a click on an already active child should open the submenu
                    $(this).hasClass("active")
                    //but because the whole path is active, that should only happen to menu items, which don't have a active child
                    && $(this).find(".active").length == 0){
                    $(this).toggleClass("open");
                    return false;
                }
                //else, the menu item should be loaded
                window.location = $(this).children("a").attr("href")
                    //append a get variable menuopen, so that on mobile devices, you  don't have to always open the menu on page reload
                    +"?menuopen=1";
            });

        });
        //that the submenu click work again ( we canceled their click event with the toggle open/not open functionality)
        $(".nochildren").click(function(e){
            window.location = $(this).attr("href")+"?menuopen=1";
        })
    });

})(jQuery);