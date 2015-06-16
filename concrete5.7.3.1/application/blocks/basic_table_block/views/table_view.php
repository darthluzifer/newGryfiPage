

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
        	
        	foreach ($row as $colname => $col){
        		if($colname == 'id'){
					echo $controller->getActions( $this, $row);
        			
        		}else{
        			$fields[$colname]->setValue($col);
        			echo '<td>'.$fields[$colname]->getTableView().'</td>';
        		}
        	}
        	 
        }
       	echo '</tbody></table>';
       	
        ?>
        
       <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo "<button type='submit' value='' class='btn inlinebtn actionbutton add'><i class ='fa fa-plus'> </i></button>"?>
		</form>
        

    

</div>
