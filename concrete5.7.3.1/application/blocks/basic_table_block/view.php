<?php
defined('C5_EXECUTE') or die("Access Denied.");
// basically a stub that includes some other files
$u = new User();
$uID = $u->getUserID();
$c = Page::getCurrentPage();

//available chart colors are duplicated in content/surveys.php

$options = $controller->getPollOptions();
$optionNames = array();
$optionResults = array();
$graphColors = array();
$i = 1;
$totalVotes = 0;
foreach ($options as $opt) {
    $optionNamesAbbrev[] = $i;
    $optionResults[] = $opt->getResults();
    $i++;
    $graphColors[] = array_pop($availableChartColors);
    $totalVotes += intval($opt->getResults());
}
foreach ($optionResults as &$value) {
    if ($totalVotes) {
        $value = round($value / $totalVotes * 100, 0);
    }
}
$show_graph = (count($optionNamesAbbrev) && !$_GET['dontGraphPoll'] && $totalVotes > 0);
?>

<div class="poll">
   

        <div id="surveyQuestion" class="form-group">
            <?php echo $controller->getQuestion() ?>
        </div>

        <?php
        echo $controller->displayTable();
        echo $chart_options;
            ?>
            </form>
        

    

</div>



<script type="text/javascript">

// $(function() {

//	var $db = $('div[data-discussion-block-id=<?php// echo $b->getBlockID()?>]'),
// 		$dialog = $db.find('div[data-form=discussion]'),
// 		$addTopic = $db.find('button[data-action=add-conversation]'),
// 		$orderBy = $db.find('select[data-select=order]');

// 	$orderBy.on('change', function() {

// 		window.location.href = $(this).find('option:selected').attr('data-sort-url');
// 	});
// 	$('form[data-form=composer]').ccmcomposer({
// 		onExit: function() {
// 			$dialog.dialog('close');
// 		},
// 		autoSaveEnabled: false,
// 		publishReturnMethod: 'ajax',
// 		onPublish: function(r) {
// 			window.location.href = r.redirectURL;
// 		}
// 	});

// 	$addTopic.on('click', function() {
// 		$dialog.dialog({
// 			modal: true,
// 			width: 400,
// 			height: 540,
//			title: '<?php// echo t("Add Topic")?>',
// 			open: function() {
// 				var $buttons = $dialog.find('.dialog-buttons').hide().clone(true,true);
// 				$(this).dialog('option', 'buttons', [{}]);
// 				$(this).closest('.ui-dialog').find('.ui-dialog-buttonset').html('').append($buttons.show());
// 			}
// 		});
// 	});
// });*/
</script>
