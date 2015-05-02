
<div class="form-group">
	<form action=<?php echo $this->action('save_new_row') ?>>
	
	<?php 
	$fields = $controller->getFields();
	foreach($fields as $field => $value){
		echo "<span>$field</span>";
		echo $form->text($field, array('title' => $field));
		
	
	}
	
	echo $form->submit('submit', "speichern");
	?>
	
	
	
	
	</form>

</div>

