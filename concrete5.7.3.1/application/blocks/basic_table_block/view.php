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
