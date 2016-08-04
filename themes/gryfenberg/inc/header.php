<?php 
defined('C5_EXECUTE') or die("Access Denied.");
$this->inc('inc/header_top.php');
?>
		<!-- Header -->
		<div id="header-content" class="header-container">
            <header class="header-content-inner clearfix" role="banner">
                <div class = row>
                    <div class="header-logo col-xs-5 col-md-2">
                        <?php
                        $a = new GlobalArea('Header Site Title');
                        $a->display();
                        ?>
                    </div>
                            <!-- Global Navigation -->
                    <div class="global-navi<?php   global $u; if ( $u -> isLoggedIn() ) { echo ' login'; } ?> col-xs-2 col-md-8">
                        <?php
                        $a = new GlobalArea('Global Navigation');
                        $a->display();
                        ?>
                    </div><!-- //Global Navigation -->
                    <div class="header-search clearfix col-xs-5 col-md-2">
                        <?php
                        $a = new GlobalArea('Header Search');
                        $a->display();
                        ?>
                    </div>
                </div>
                </header>

        </div><!-- //Headerー -->
