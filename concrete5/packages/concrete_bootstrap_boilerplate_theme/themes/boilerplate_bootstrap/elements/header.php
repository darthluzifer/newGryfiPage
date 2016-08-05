<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<!doctype html>
<html lang="<?php echo Localization::activeLanguage()?>" class="no-js <?php if( $c->isEditMode() ){ echo "editmode";}; ?>">
    <head>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<?php echo $view->getThemePath(); ?>/css/vendor/bootstrap/bootstrap.min.css">
        <?php echo $html->css($view->getStylesheet('main.less'));?>
        <?php echo $html->css($view->getStylesheet('submenu.css'));?>
        <?php View::element('header_required'); ?>
    </head>

    <!-- set page name and pagetype name as class -->
    <body>

        <div class="<?php echo $c->getPageWrapperClass(); ?>">
    
            <!-- navigation -->
            <nav class="navbar navbar-default" role= "navigation" id="globalnav">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        </button>
                       <?php
                       $a = new GlobalArea('Header Site Title');
                       $a->display();

                       ?>
                    </div>
                    
                    <!-- nav items -->
                    <div class="collapse navbar-collapse <?php if($_GET['menuopen']){echo " in ";} ?>" id="navbar-collapse-1">

                        <?php
                        $a = new GlobalArea('Global Navigation');
                        $a->display();
                        ?>

                    </div>
                </div><!-- /.container -->
            </nav>