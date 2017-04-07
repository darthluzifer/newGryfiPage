<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 26.07.16
 * Time: 08:21
 */

namespace Concrete\Package\BaclucEventPackage\Src;


use Concrete\Package\BasicTablePackage\Src\AssociationBaseEntity;
use Concrete\Package\BasicTablePackage\Src\BaseEntity;
use Concrete\Package\BasicTablePackage\Src\EntityGetterSetter;
use Concrete\Package\BasicTablePackage\Src\Group;
use Doctrine\ORM\Mapping as ORM;

/*because of the hack with @DiscriminatorEntry Annotation, all Doctrine Annotations need to be
properly imported*/
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\InheritanceType;
use Doctrine\ORM\Mapping\DiscriminatorColumn;
use Concrete\Package\BasicTablePackage\Src\DiscriminatorEntry\DiscriminatorEntry;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\UniqueConstraint;

/**
 * Class UserAttendsEvent
 * @IgnoreAnnotation("package")\n*  Concrete\Package\BaclucEventPackage\Src
 * @Entity
 * @InheritanceType("JOINED")
 * @DiscriminatorColumn(name="discr", type="string")
 * @DiscriminatorEntry(value="Concrete\Package\BaclucEventPackage\Src\UserAttendsEvent")
 * @Table(name="bacluc_event_user" ,uniqueConstraints={@UniqueConstraint(name="uniqueUserGroup", columns={"event_id", "uID"})})
 *
 */
class UserAttendsEvent extends AssociationBaseEntity
{
    use EntityGetterSetter;
    //dontchange
    public static $staticEntityfilterfunction; //that you have a filter that is only for this entity
    /**
     * @var int
     * @Id @Column(type="integer")
     * @GEneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     *
     * @var Event
     * @ManyToOne(targetEntity="Event")
     * @JoinColumn(name="event_id", referencedColumnName="id", onDelete="CASCADE")
     */
    protected $Event;

    /**
     *
     * @var int
     * @Column(type="integer")
     */
    protected $uID;

    /**
     *
     * @var int
     * @Column(type="string")
     */
    protected $state;

    const STATE_APOLOGIZED = "apologized";
    const STATE_ATTENDING = "attending";
    const STATE_ATTENDED = "attended";


    public function __construct(){
        parent::__construct();
    }

    /**
     * @param Event $event
     * @param $userid
     * @return UserAttendsEvent|null
     */
    public static function getCurrentAttendance(Event $event, $userid)
    {
        $query = BaseEntity::getBuildQueryWithJoinedAssociations(static::class);
        $query->andWhere(
            $query->expr()->andX(
                $query->expr()->eq("e0.Event", ":event")
                , $query->expr()->eq("e0.uID", ":userid")
            )
        );
        $query->setParameters(array(
            ":event" => $event
        , ":userid" => $userid
        ));

        $result = $query->getQuery()->getResult();
        if($result == null){
            return null;
        }
        if(count($result)==0){
            return null;
        }
        return $result[0];
    }

    public function setDefaultFieldTypes()
    {
        $this->fieldTypes['state']=new DropdownField('state', 'State', 'poststate');
        $userConstants = static::getOptionsOfConstants(static::class, "STATE_");
        /**
         * @var DropdownField
         */
        $this->fieldTypes['type']->setOptions($userConstants);
    }

    /**
     * @param Event $event
     * @param $userid
     * @param $state
     * @throws \InvalidArgumentException
     */
    public static function changeUserAttendanceState(Event $event, $userid, $state){

        $options = static::getOptionsOfConstants(static::class, "STATE_");
        if(!in_array($state, $options)){
            throw new \InvalidArgumentException(sprintf("Invalid state (%s) supplied. State has to be one of %s", $state, implode(", ", $options)));
        }

        //first look if there is already a state
        $result = self::getCurrentAttendance($event, $userid);
        if($result!=null){
            $model = $result;
        }else{
            $model = new UserAttendsEvent();
            $model->set("Event", $event);
            $model->set("uID", $userid);
        }

        $model->set("state", $state);
        static::getEntityManagerStatic()->persist($model);
        static::getEntityManagerStatic()->flush();

    }





}