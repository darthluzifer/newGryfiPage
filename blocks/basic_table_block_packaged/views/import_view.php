<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 22.03.17
 * Time: 09:16
 */

?>
<h1><?php echo t('Import View for %s', $controller->getHeader())?></h1>
<form action="<?php echo $this->action("persistImport") ?>" method="post" >
    <input type="hidden" name="ccm_token" value="<?php echo $token ?>" />

<?php
print_r($comparisondata);
?>

</form>