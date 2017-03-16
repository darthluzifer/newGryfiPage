<?php    defined('C5_EXECUTE') or die("Access Denied."); ?>
<?php  
$title = h($title);
if ($linkURL) {
    $title = '<a href="' . $linkURL . '">' . $title . '</a>';
}
?>
<div class="bacluc-feature-item">
    
    	<div class="icon">
    		<i class="fa fa-<?php   echo $icon?>"></i>
    	</div>
    	<?php   if ($title) { ?>
			<h4><?php   echo $title?></h4>
		<?php   } ?>
    	<div class="feature-body">
		<?php  
		if ($paragraph) {
			echo $paragraph;
		}
	    ?>
	    </div>
</div>
