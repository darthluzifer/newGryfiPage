<?php
namespace Concrete\Package\BasicTablePackage\Src\FieldTypes;

use Concrete\Core\Application\Service\FileManager;
use Concrete\Core\Block\BlockController;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\Field as Field;
use Loader;
use Page;
use User;
use Core;
use File;
use Concrete\Controller\SinglePage\Dashboard\Blocks\Permissions as Permissions;
use Concrete\Core\Block\View\BlockView as View;

class FileField extends Field
{

    public function __construct($sqlFieldname, $label, $postName)
    {
        parent::__construct($sqlFieldname, $label, $postName);

    }


    public function getTableView()
    {
        $f = $this->getFileObject();
        //$fp = new Permissions($f);
        if (/*$fp->canViewFile()*/
        true
        ) {
            $c = Page::getCurrentPage();
            if ($c instanceof Page) {
                $cID = $c->getCollectionID();
            }

            $returnString = "<a href=\"" . View::url('/download_file', $this->getValue(), $cID) . "\" target='_blank'>" . stripslashes($this->getLinkText()) . "</a>";

        } else {
            $returnString = t("permission denied");
        }

        $returnString .= $this->getHtmlErrorMsg();
        return $returnString;
    }


    public function getFormView($form, $clientSideValidationActivated = true)
    {


        $returnString = "
		<div class=\"form-group\">
		" . $form->label($this->getHtmlId(), t($this->getLabel())) ;
        $returnString .= $this->getInputHtml($form, $clientSideValidationActivated);


        return $returnString;
    }


    public function getValue()
    {
        return $this->value;
    }


    public function validatePost($value)
    {
        $this->value = $value;
        return true;
    }


    function getFileObject()
    {
        if (is_null($this->value)) {
            return false;
        }
        return File::getByID($this->value);
    }

    function getLinkText()
    {
        $f = $this->getFileObject();
        if (is_object($f)) {
            return $f->getTitle();
        } else {
            return t("no File");
        }

    }

    /**
     * @param $returnString
     * @return string
     */
    public function getInputHtml($form, $clientSideValidationActivated=true)
    {
        /**
         * @var FileManager $al
         */
        $al = Loader::helper('concrete/asset_library');
        $bf = null;
        $value = $this->getValue();
        $default = $this->getDefault();
        if($value == null && $default != null){
            $this->setSQLValue($default);
        }

        if ($this->getValue() > 0) {
            $bf = $this->getFileObject();
        }
        $this->setSQLValue($value);
        $c = Page::getCurrentPage();
        $returnString =
            $al->file($this->getHtmlId(), $this->getPostName(), t('Choose File'), $bf) . "
		</div>";
        $valt = Loader::helper('validation/token');
        $token = $valt->generate();
        //$form->addHeaderItem('<script type="text/javascript">var CCM_SECURITY_TOKEN = \''.$token.'\';</script>');
        $returnString .= '<script type="text/javascript">var CCM_SECURITY_TOKEN = \'' . $token . '\';</script>';
        $returnString .= $this->getHtmlErrorMsg();
        return $returnString;
    }
}
