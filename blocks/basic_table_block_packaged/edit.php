<?php
/**
 * define the block add/edit view here
 */


defined('C5_EXECUTE') or die("Access Denied."); ?>
<style type="text/css">
    div.action-options {
        position: relative;
        border-bottom: 1px solid #ddd;
        margin-bottom: 3px;
    }

    div.action-options img {
        position: absolute;
        top: 3px;
        right: 0px;
    }

</style>
<div class="ccm-ui basic-table-edit">
   <!--
   requires registration works, but the form is not showing the saved value, TODO
    <label for="requiresRegistration"><?php echo t('Target Audience') ?></label>

    <div class="radio">
     <label>
            <input id="requiresRegistration" type="radio" value="0" name="requiresRegistration"
                   style="vertical-align: middle" <?php if (!$controller->requiresRegistration()) { ?> checked <?php } ?> />&nbsp;<?php echo t(
                'Public') ?>
        </label>
    </div>
    <div class="radio">
        <label>
            <input type="radio" value="1" name="requiresRegistration"
                   style="vertical-align: middle" <?php if ($controller->requiresRegistration()) { ?> checked <?php } ?> />&nbsp;<?php echo t(
                'Only Registered Users') ?>
        </label>
    </div>
-->
    <?php
    $blockOptions = $controller->getBlockOptions();
    $counter =0;
    foreach($blockOptions as $optionnum => $OptionType){


        echo $OptionType->getFormView($form);

    }

    ?>


</div>
<script type="text/javascript">
    Concrete.event.fire('survey-edit-open');
</script>
