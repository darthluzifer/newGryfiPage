<?php 
use Application\Block\BasicTableBlock\FieldTypes\SelfSaveInterface;
?>

<div class="poll">
 

<div id="surveyQuestion" class="form-group">
           
        </div>

        
        
        <?php
        
        $tabledata = $controller->displayTable();
        
        ?>
        <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo "<button type='submit' value='' class='btn inlinebtn actionbutton add'><i class ='fa fa-plus'> </i></button>"?>
		</form>
        <table id='<?php echo $controller->getHTMLId(); ?>' class="table">
        <thead>
	        <tr>
	        <?php 
	        $fields = $controller->getFields();
	        foreach( $fields as $fieldname => $type){
	        	if($fieldname == 'id'){
	        		
	        	?>
	        	<th width='20%'  data-column-id="commands" data-formatter="commands" data-sortable="false"><?php echo t('Aktion'); ?></th>
	        	<?php }else{?>
	        	<th data-column-id='<?php $type->getPostName()?>'><?php echo $fieldname ?></th>
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
        			//var_dump($field);
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
actioncellhtml['<?php echo $controller->getHTMLId();?>'] = [];
actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'] = [];
$(document).ready(function(e){ 
	
	$('#<?php echo $controller->getHTMLId();?> .actioncell').each(function(e){
			actioncellhtml.push($(this).html());
		});
	
	
	$('#<?php echo $controller->getHTMLId();?>').bootgrid({
				formatters : {
						commands: function(column, row){
								var html = window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].pop();
								window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'].push(html);
								if(window.actioncellhtml['<?php echo $controller->getHTMLId();?>'].length = 0){
										window.actioncellhtml = actioncellhtmltemp;
										window.actioncellhtmltemp['<?php echo $controller->getHTMLId();?>'] = [];
									}
								return html;
							}
					}
	});
});

</script>
