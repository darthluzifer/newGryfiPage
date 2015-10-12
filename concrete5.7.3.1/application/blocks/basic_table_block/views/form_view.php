
<div class="form-group">
	
	<form action=<?php echo $this->action('save_row') ?> method='POST'>
	
	<?php 
	$fields = $controller->getFields();
	$rowValues = $controller->getRowValues();
	//var_dump("rowvalues:");
	//var_dump($rowValues);
	foreach($fields as $field => $FieldObject){
		if($field == 'id'){
			
		}else{
			if($FieldObject->showInForm()){
				$FieldObject->setSQLValue($rowValues[$FieldObject->getSQLFieldName()]);
				
				echo $FieldObject->getFormView($form);
			}
			
		}	
	
	}
	
	echo $form->submit('submit', t("speichern"));
	echo $form->submit('cancel', t("abbrechen"));
	?>
	
	
	
	
	</form>

</div>

