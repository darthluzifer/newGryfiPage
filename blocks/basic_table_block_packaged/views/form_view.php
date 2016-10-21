
<div class="form-group basic_table_package">
	
	<form action=<?php echo $this->action('save_row') ?> method='POST' class="
	<?php echo $controller->isClientSideValidationActivated()?'bacluc-client-side-validation':'';  ?>
	">
	
	<?php
	/**
	 * @var \Concrete\Package\BasicTablePackage\Block\BasicTableBlockPackaged\Controller $controller
	 */
	$model = $controller->getModel();

	$defaultView = $model->getDefaultFormView($form);

	if(strlen($defaultView)==0) {
		$fields = $controller->getFields();
		$rowValues = $controller->getRowValues();
		$errorFields = $controller->getErrorFields();
		/**
		 * @var \Concrete\Package\BasicTablePackage\Src\FieldTypes\Field $FieldObject
		 */
		foreach ($fields as $field => $FieldObject) {
			if ($field == 'id') {

			} else {
				if ($FieldObject->showInForm()) {

					$FieldObject->setSQLValue($rowValues[$FieldObject->getSQLFieldName()]);

					if (isset($errorFields[$FieldObject->getPostName()])) {
						$FieldObject->setErrorMessage($errorFields[$FieldObject->getPostName()]->getErrorMsg());
					}
					$FieldObject->setView($this);
					echo $FieldObject->getFormView($form, true, $controller->isClientSideValidationActivated());
				}

			}

		}
	}else{
		print($defaultView);
	}
	echo $form->submit('submit', t("save"));
	echo $form->submit('cancel', t("cancel"));
	?>
	
	
	
	
	</form>

</div>

