<?php 
use Application\Block\BasicTableBlock\FieldTypes\SelfSaveInterface;
?>

<div class="table-responsive">
 
 



        
        
        <?php
        
        $tabledata = $controller->displayTable();
        
        ?>
        <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo "<button type='submit' value='' class='btn inlinebtn actionbutton add'><i class ='fa fa-plus'> </i></button>"?>
		</form>
        <table id='<?php echo $controller->getHTMLId(); ?>' class="table table-striped table-bordered table-hover">
        <thead>
	        <tr>
	        <?php 
	        $fields = $controller->getFields();
	        foreach( $fields as $fieldname => $type){
	        	if($fieldname == 'id'){
	        		
	        	?>
	        	<th width='20%'  data-column-id="commands" data-formatter="commands" data-sortable="false"><?php echo t('Aktion'); ?></th>
	        	<?php }else{?>
	        	<th data-column-id='<?php echo $type->getPostName();?>'><?php echo $fieldname; ?></th>
	        <?php 
	        	}
	        }?>
	        
	       </tr>
       </thead>
        <tbody>
        
        
        <?php 
        
        foreach ($tabledata as  $row) {
        	echo '<tr>';
        	
        	foreach ($fields as $colname => $field){
        		if($colname == 'id'){
					echo $controller->getActions( $view, $row);
        			
        		}else{
        			
        			if($fields[$colname] instanceof SelfSaveInterface){
        				$field->setRowId($row['id']);
        			}else{
        				$field->setValue($row[$colname]);
        			}
					var_dump($row[$colname]);
        			echo '<td>'.$field->getTableView().'</td>';
        		}
        	}
        	 
        }
       	echo '</tbody></table>';
       	
        ?>
        
       <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo "<button type='submit' value='' class='btn inlinebtn actionbutton add'><i class ='fa fa-plus'> </i></button>"?>
		</form>
        

    

</div>

<script type='text/javascript'>

if(window.actioncellhtml == undefined){
	window.actioncellhtml = {};
}
if(window.actioncellhtmltemp == undefined){
	window.actioncellhtmltemp = {};
}
window.actioncellhtml['<?php echo $controller->getHTMLId();?>'] = [];
window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'] = [];
$(document).ready(function(e){ 
	
	$('#<?php echo $controller->getHTMLId();?> .actioncell').each(function(e){
			window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].push($(this).html());
			
		});
	
	
	$('#<?php echo $controller->getHTMLId();?>').bootgrid({
				columnSelection : false,
				rowCount:-1,
				formatters : {
						commands: function(column, row){
								var html = window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].pop();
								window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'].push(html);
								if(window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].length == 0){
										$(window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>']).each(function(e){
												window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].push(window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'].pop());
											});
										window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'] = [];
									}
								return html;
							}
					}
	});
});

</script>
