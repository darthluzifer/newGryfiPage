

<div class="poll">
 

<div id="surveyQuestion" class="form-group">
            <?php echo $controller->getQuestion() ?>
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
					?>
					<td>
        			<form method="post" action="<?php  echo $this->action('edit_row_form'); ?>">
        						<input type='hidden' name='rowid' value='<?php echo $col;?>'/>
        						<input type='hidden' name='action' value='edit' id='action_<?php  echo $col;?>'>
        						<button type='submit' value = 'edit' class='btn inlinebtn actionbutton edit' onclick="$('#action_<?php  echo $col;?>').val('edit');"><i class ='fa fa-pencil'> </i> </button>
        						<input type='hidden' name='rowid' value='<?php echo $col;?>'/>
        						<button type='submit' value='delete' class='btn inlinebtn actionbutton delete'  onclick="$('#action_<?php  echo $col;?>').val('delete');"><i class ='fa fa-trash-o'> </i></button>
        					</form>
        			</td>
        			<?php
        		}else{
        			echo '<td>'.$col.'</td>';
        		}
        	}
        	 
        }
       	echo '</tbody></table>';
       	
        ?>
        
       <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo "<button type='submit' value='' class='btn inlinebtn actionbutton add'><i class ='fa fa-plus'> </i></button>"?>
		</form>
        

    

</div>
