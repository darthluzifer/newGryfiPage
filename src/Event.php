<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 01.02.16
 * Time: 23:08
 */
namespace Concrete\Package\BaclucEventPackage\Src;
use Concrete\Package\BasicTablePackage\Src\Entity;
use Concrete\Package\BasicTablePackage\Src\EntityGetterSetter;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\DateField as DateField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\FileField as FileField;
use Concrete\Package\BasicTablePackage\Src\FieldTypes\WysiwygField as WysiwygField;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Expr\Expression;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Query\Expr;

/**
 * Class Event
 * @package Concrete\Package\BaclucEventPackage\Src
 * @Entity
@Table(name="bacluc_event"
)
 *
 */
class Event extends Entity
{
    use EntityGetterSetter;
    /**
     * @var int
     * @Id @Column(type="integer", nullable=false, options={"unsigned":true})
     * @GEneratedValue(strategy="AUTO")
     */
    private $id;
    /**
     * @var DateTime
     * @Column(type="date")
     */
    private $date_from;
    /**
     * @var DateTime
     * @Column(type="date")
     */
    private $date_to;
    /**
     * @var DateTime
     * @Column(type="text", length=12)
     */
    private $time_from;
    /**
     * @var DateTime
     * @Column(type="text", length=12)
     */
    private $time_to;
    /**
     * @var string
     * @Column(type="string", length=1000)
     */
    private $title;
    /**
     * @var string
     * @Column(type="text")
     */
    private $description;
    /**
     * @var int
     * @Column(type="integer")
     */
    private $infofile;
    /**
     * @var int
     * @Column(type="integer")
     */
    private $registerfile;
    /**
     * @var EventGroup[]
     * @OneToMany(targetEntity="Concrete\Package\BaclucEventPackage\Src\EventGroup", mappedBy="Event")

     */
    protected $EventGroups;
    public function __construct(){
        parent::__construct();
        if($this->EventGroups == null){
            $this->EventGroups = new ArrayCollection();
        }
        $this->setDefaultFieldTypes();
    }
    public function setDefaultFieldTypes(){
        parent::setDefaultFieldTypes();
        /**
         * because Entity::setDefaultFieldTypes does not detect special field types like Wysiwyg field or filefield, they have to be set here manually.
         * The only Fields Entity::setDefaultFieldTypes detects are date, DropdownLinkField (m:1 relation), DropdownMulitLInkField (n:m relation)
         */
        $this->fieldTypes['description']=new WysiwygField("description",t("Description"),"description");
        $this->fieldTypes['infofile']= new FileField("infofile", t('Info'), "info");
        $this->fieldTypes['registerfile']= new FileField("registerfile", t('Anmeldung'), "register");
    }

    public function getId(){
        return $this->id;
    }
    public function getIdFieldName()
    {
        return 'id';
    }
    /**
     * Returns the function, which generates the String for LInk Fields to identify the instance. Has to be unique to prevent errors
     * @return \Closure
     */
    public static function getDefaultGetDisplayStringFunction(){
        $function = function(Event $item){
            $dateField = new DateField("test", "test", "test");
            $returnString =$item->title;
            $dateField->setSQLValue($item->date_from);
            $returnString.= " ".$dateField->getTableView();
            if($item->date_to != null){
                $returnString =$item->title;
                $dateField->setSQLValue($item->date_to);
                $returnString.= " ".$dateField->getTableView();
            }
            return $returnString;
        };
        return $function;
    }
    public function getNextEvent(array  $groupids){
        $qb = $this->getEntityManager()->createQueryBuilder();
        $qb
            ->select( 'Event')
            ->from('Concrete\Package\BaclucEventPackage\Src\Event', 'Event')
            ->join('Event.EventGroups','eg', Expr\Join::WITH, "1=1")
            ->join('eg.Group','g', Expr\Join::WITH, "1=1")
            ->where($qb->expr()->in('g.gID', ':Groups'))
            ->orderBy('Event.date_from')
            ->setMaxResults(1)
            ->setParameter('Groups',$groupids)
        ;
        $query = $qb->getQuery();
        $result = $query->getResult();
        if($result != null){
            if(count($result)==1){
                return $result[0];
            }
        }
        return null;
    }
}