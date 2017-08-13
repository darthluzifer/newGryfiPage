(function($, window){

	//the code...
    "use strict";
    $(function(e){
        $(".dropdown").each(function(e){
            //if a dropdown is active, it should also be open
            if($(this).hasClass("active")){
                $(this).addClass("open");
            }
            $(this).on("click touch",function(e){

                if($(this).hasClass("justchanged")){
                    $(this).removeClass("justchanged");
                    return false;
                }

                if(
                    //a click on an already active child should open the submenu
                //except it is already open, then the link should work
                    /*($(this).hasClass("active") || $(this).hasClass("nav-path-selected")) && */!$(this).hasClass("open")

                ) {
                    $(this).toggleClass("open");
                    return false;
                }

                //else, the menu item should be loaded
                window.location = $(this).children("a").attr("href")
                    //append a get variable menuopen, so that on mobile devices, you  don't have to always open the menu on page reload
                    +"?menuopen=1";
                return false;
            });

        });
        //that the submenu click work again ( we canceled their click event with the toggle open/not open functionality)
        $(".nochildren").on("click touch",function(e){
            if( $(this).attr("target")==="_self"){

                window.location = $(this).attr("href") + "?menuopen=1";
                return false;
            }
        });
    });

    $('.collapse.navbar-collapse li.dropdown').on("mouseenter", function(e){
        $(this).addClass("open");
        $(this).addClass("justchanged");
        setTimeout(function(element){
            $(element).removeClass("justchanged")
        },100,this);
    });

    $('.collapse.navbar-collapse li.dropdown').on("mouseleave", function(e){
        $(this).removeClass("open");
        $(this).addClass("justchanged");
        $(this).addClass("justchanged");
        setTimeout(function(element){
            $(element).removeClass("justchanged")
        },100,this);
    });

})(jQuery, window);