<?php
/**
 * Created by PhpStorm.
 * User: lucius
 * Date: 01.02.16
 * Time: 23:08
 */

namespace Concrete\Package\BasicTablePackage\Src;
use Concrete\Package\BasicTablePackage\Src\Entity;

/**
 * Class Group
 * @package Concrete\Package\BasicTablePackage\Src
 * @Entity
  @Table(name="Groups"
  , indexes={
           @Index(name="gName",
                   columns={"gName"}),
           @Index(name="gBadgeFID",
                   columns={"gBadgeFID"}),
          @Index(name="pkgID",
                   columns={"pkgID"})
    }
  )
 *
 */
class Group extends Entity
{

    /**
     * @var int
     * @Id @Column(type="integer", nullable=false, options={"unsigned":true})
     * @GEneratedValue(strategy="AUTO")
     */
    private $gID;

    /**
     * @var string
     * @Column(type="string")
     */
    private $gName;

    /**
     * @var string
     * @Column(type="string", nullable=false)
     */
    private $gDescription;

    /**
     * @var boolean
     * @Column(type="boolean", options={"default"=0})
     */
    private $gUserExpirationIsEnabled;


    /**
     * @var string
     * @Column(type="string", length=12)
     */
    private $gUserExpirationMethod;

    /**
     * @var DateTime
     * @Column(type="datetime")
     */
    private $gUserExpirationSetDateTime;

    /**
     * @var int
     * @Column(type="integer", length=10, nullable=false, options={"unsigned":true, "default"=0})
     *
     */
    private $gUserExpirationInterval;

    /**
     * @var string
     * @Column(type="string", length=20)
     */
    private $gUserExpirationAction;

    /**
     * @var boolean
     * @Column(type="boolean", nullable=false, options={"default"=0})
     */
    private $gIsBadge;

    /**
     * @var int
     * @Column(type="integer", length=10, nullable=false, options={"unsigned":true, "default"=0})
     *
     */
    private $gBadgeFID;





    /**
     * @var string
     * @Column(type="string", length=255)
     */
    private $gBadgeDescription;

    /**
     * @var int
     * @Column(type="integer", length=11, nullable=false, options={"default"=0})
     */
    private $gBadgeCommunityPointValue;

    /**
     * @var boolean
     * @Column(type="boolean", nullable=false, options={"default"=0})
     */
    private $gIsAutomated;

    /**
     * @var boolean
     * @Column(type="boolean", nullable=false, options={"default"=0})
     */
    private $gCheckAutomationOnRegister;

    /**
     * @var boolean
     * @Column(type="boolean", nullable=false, options={"default"=0})
     */
    private $gCheckAutomationOnLogin;

    /**
     * @var boolean
     * @Column(type="boolean", nullable=false, options={"default"=0})
     */
    private $gCheckAutomationOnJobRun;

    /**
     * @var string
     * @Column(type="text", length=65535)
     */
    private $gPath;

    /**
     * @var int
     * @Column(type="integer", length=10, nullable=false, options={"unsigned":true, "default"=0})
     *
     */
    private $pkgID;



    public function get($name)
    {
        if(property_exists($this, $name)
            && !in_array($name, $this->protect)
            && !in_array($name, $this->protectRead)
            && !in_array($name, $this->fieldTypes)) {

            $returnvar = $this->{$name};
            if(property_exists($this, "gID")){
                $returnvar2 = $this->gID;
            }

            return $returnvar;
        }
    }

    public function set($name, $value)
    {
        if(property_exists($this, $name)
            && !in_array($name, $this->protect)
            && !in_array($name, $this->protectWrite)
            && !in_array($name, $this->fieldTypes)
        ) {
            $this->$name = $value;
        }
    }

    public function __get($name)
    {
        $returnvar = $this->get($name);
        return $returnvar;
    }

    public function __set($name, $value)
    {
        $this->set($name, $value);
    }

    public function getId(){
        return $this->gID;
    }

    public function getIdFieldName()
    {
        return 'gID';
    }

    public static function getDefaultGetDisplayStringFunction(){
        $function = function(Group $item){
            $returnString =$item->gName;


            return $returnString;
        };
        return $function;
    }

    /**
     * @return string
     */
    public function __toString()
    {
        // TODO: Implement __toString() method.
        return $this->gName;
    }


}