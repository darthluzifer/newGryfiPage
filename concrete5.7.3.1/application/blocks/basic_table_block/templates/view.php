<?php defined('C5_EXECUTE') or die("Access Denied.");

$c = Page::getCurrentPage();
if (is_object($f)) {
    $tag = Core::make('html/div', array($f, true))->getTag();
    $tag->addClass('ccm-image-block img-responsive');
    

    

    print '<a title="'.$title.'" class="magnific-popup-image" href="' .$large->src . '">';
    print $tag;
    print '</a>';

} else if ($c->isEditMode()) { ?>

    <div class="ccm-edit-mode-disabled-item"><?php echo t('Empty Image Block.')?></div>

<?php } ?>
