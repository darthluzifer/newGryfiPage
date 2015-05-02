

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
        	?>
        	<th><?php echo $fieldname ?></th>
        <?php }?>
       </tr>
        
        
        
        <?php 
        foreach ($tabledata as  $row) {
        	echo '<tr>';
        	foreach ($row as $col){
        		echo '<td>'.$col.'</td>';
        	}
        	 
        }
       	echo '</tbody></table>';
       	
        ?>
        
       <form method="post" action="<?php  echo $this->action('add_new_row_form'); ?>">
			
			<?php  echo $form->submit('submit', "testbutton"); ?>
		</form>
        

    

</div>
