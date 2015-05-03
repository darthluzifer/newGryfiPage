
<div class="form-group">
	<form action=<?php echo $this->action('save_row') ?>>
	
	<?php 
	$fields = $controller->getFields();
	$rowValues = $controller->getRowValues();
	foreach($fields as $field => $value){
		echo "<label for='$field'>$field</label>";
		echo $form->text($field, array('title' => $field,
										 'value' => $rowValues[$field],
										 'id' => $field
				
										)
				);
		
	
	}
	
	echo $form->submit('submit', "speichern");
	?>
	
	
	
	
	</form>

</div>

