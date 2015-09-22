<?php 
use Application\Block\BasicTableBlock\FieldTypes\SelfSaveInterface;
?>

<div class="poll">
 

<div id="surveyQuestion" class="form-group">
           
        </div>

        
        
        <?php
        
        $tabledata = $controller->displayTable();
        
        ?>
        <table class="table"><tbody>
        
        <tr>
        <?php 
        $fields = $controller->getFields();
        foreach( $fields as $fieldname => $type){
        	if($fieldname == 'id'){
        		
        	?>
        	<th width='20%'><?php echo t('Aktion'); ?></th>
        	<?php }else{?>
        	<th><?php echo $fieldname ?></th>
        <?php 
        	}
        }?>
       </tr>
        
        
        
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
