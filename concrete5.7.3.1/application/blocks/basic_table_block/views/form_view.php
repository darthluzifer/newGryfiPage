
<div class="form-group">
	<form action=<?php echo $this->action('save_row') ?> method='POST'>
	
	<?php 
	$fields = $controller->getFields();
	$rowValues = $controller->getRowValues();
	foreach($fields as $field => $value){
		if($field == 'id'){
			
		}else{
			
			echo "<label for='$field'>$field</label>";
			echo $form->text($field, $rowValues[$field],array('title' => $field,
											 'value' => $rowValues[$field],
											 'id' => $field
					
											)
					);
		}	
	
	}
	
	echo $form->submit('submit', "speichern");
	?>
	
	
	
	
	</form>

</div>

