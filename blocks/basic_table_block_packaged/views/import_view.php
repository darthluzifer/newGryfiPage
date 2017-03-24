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
    if(strlen($errorMessage)>0){
        echo '<div class="errormessage alert-danger">
                '.$errorMessage.'
                </div>
            ';
    }
    ?>
    <?php
    $fields = $controller->getFields();
    if(count($comparisondata)>0) {
        foreach ($comparisondata as $num => $comparisonset) {

            ?>
            <div class="importrow">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <?php


                        foreach ($fields as $fieldname => $type) {

                            if ($fieldname == 'id') {

                                ?>
                                <th width='20%' data-column-id="commands" data-formatter="commands"
                                    data-sortable="false"><?php echo t('Type'); ?></th>


                            <?php } else {

                                ?>

                                <th data-column-id='<?php echo $type->getPostName(); ?>'
                                    data-formatter="<?php echo (new ReflectionClass($type))->getShortName(); ?>"><?php echo t($type->getLabel()); ?></th>
                                <?php

                            }
                        } ?>

                    </tr>
                    </thead>
                    <tbody>


                    <?php

                    /**
                     * @var \Concrete\Package\BasicTablePackage\Src\Import\ComparisonSet $comparisonset
                     */
                    foreach ($comparisonset as $modeltype => $model) {
                        echo '<tr>';
                        echo '<th>' . $modeltype . '</th>';
                        foreach ($fields as $colname => $field) {
                            if ($colname == $controller->getModel()->getIdFieldName()) {


                            } else {


                                $field->setSQLValue($model->get($colname));

                                //var_dump($field);
                                echo '<td>' . $field->getTableView() . '</td>';
                            }

                        }

                    }
                    echo '</tbody></table>
    
            ';

                    ?>
            </div>
            <?php
        }
    }
        ?>

</form>