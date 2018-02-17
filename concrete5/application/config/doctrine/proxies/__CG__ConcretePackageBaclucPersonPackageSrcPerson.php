<?php

namespace DoctrineProxies\__CG__\Concrete\Package\BaclucPersonPackage\Src;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Person extends \Concrete\Package\BaclucPersonPackage\Src\Person implements \Doctrine\ORM\Proxy\Proxy
{
    /**
     * @var \Closure the callback responsible for loading properties in the proxy object. This callback is called with
     *      three parameters, being respectively the proxy object to be initialized, the method that triggered the
     *      initialization process and an array of ordered parameters that were passed to that method.
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setInitializer
     */
    public $__initializer__;

    /**
     * @var \Closure the callback responsible of loading properties that need to be copied in the cloned object
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setCloner
     */
    public $__cloner__;

    /**
     * @var boolean flag indicating if this object was already initialized
     *
     * @see \Doctrine\Common\Persistence\Proxy::__isInitialized
     */
    public $__isInitialized__ = false;

    /**
     * @var array properties to be lazy loaded, with keys being the property
     *            names and values being their default values
     *
     * @see \Doctrine\Common\Persistence\Proxy::__getLazyProperties
     */
    public static $lazyPropertiesDefaults = [];



    /**
     * @param \Closure $initializer
     * @param \Closure $cloner
     */
    public function __construct($initializer = null, $cloner = null)
    {

        $this->__initializer__ = $initializer;
        $this->__cloner__      = $cloner;
    }

    /**
     * {@inheritDoc}
     * @param string $name
     */
    public function __get($name)
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__get', [$name]);

        return parent::__get($name);
    }

    /**
     * {@inheritDoc}
     * @param string $name
     * @param mixed  $value
     */
    public function __set($name, $value)
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__set', [$name, $value]);

        return parent::__set($name, $value);
    }



    /**
     * 
     * @return array
     */
    public function __sleep()
    {
        if ($this->__isInitialized__) {
            return ['__isInitialized__', 'id', 'scoutname', 'surname', 'middlename', 'lastname', 'birthdate', 'public_picture_allowed', 'Parents', 'Children', 'PostalAddresses', 'PhonenumberAddresses', 'EmailAddresses', 'Addresses', 'protect', 'protectRead', 'protectWrite', 'fieldTypes', 'em', 'defaultFormView', 'defaultSubFormView', 'checkingConsistency'];
        }

        return ['__isInitialized__', 'id', 'scoutname', 'surname', 'middlename', 'lastname', 'birthdate', 'public_picture_allowed', 'Parents', 'Children', 'PostalAddresses', 'PhonenumberAddresses', 'EmailAddresses', 'Addresses', 'protect', 'protectRead', 'protectWrite', 'fieldTypes', 'em', 'defaultFormView', 'defaultSubFormView', 'checkingConsistency'];
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Person $proxy) {
                $proxy->__setInitializer(null);
                $proxy->__setCloner(null);

                $existingProperties = get_object_vars($proxy);

                foreach ($proxy->__getLazyProperties() as $property => $defaultValue) {
                    if ( ! array_key_exists($property, $existingProperties)) {
                        $proxy->$property = $defaultValue;
                    }
                }
            };

        }
    }

    /**
     * 
     */
    public function __clone()
    {
        $this->__cloner__ && $this->__cloner__->__invoke($this, '__clone', []);
    }

    /**
     * Forces initialization of the proxy
     */
    public function __load()
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__load', []);
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitialized($initialized)
    {
        $this->__isInitialized__ = $initialized;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitializer(\Closure $initializer = null)
    {
        $this->__initializer__ = $initializer;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __getInitializer()
    {
        return $this->__initializer__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setCloner(\Closure $cloner = null)
    {
        $this->__cloner__ = $cloner;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific cloning logic
     */
    public function __getCloner()
    {
        return $this->__cloner__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     * @static
     */
    public function __getLazyProperties()
    {
        return self::$lazyPropertiesDefaults;
    }

    
    /**
     * {@inheritDoc}
     */
    public function setDefaultFieldTypes()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDefaultFieldTypes', []);

        return parent::setDefaultFieldTypes();
    }

    /**
     * {@inheritDoc}
     */
    public function setDefaultFormViews()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDefaultFormViews', []);

        return parent::setDefaultFormViews();
    }

    /**
     * {@inheritDoc}
     */
    public function setControllerFieldType($name, \Concrete\Package\BasicTablePackage\Src\FieldTypes\Field $field)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setControllerFieldType', [$name, $field]);

        return parent::setControllerFieldType($name, $field);
    }

    /**
     * {@inheritDoc}
     */
    public function getFieldTypes()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getFieldTypes', []);

        return parent::getFieldTypes();
    }

    /**
     * {@inheritDoc}
     */
    public function getAsAssoc()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getAsAssoc', []);

        return parent::getAsAssoc();
    }

    /**
     * {@inheritDoc}
     */
    public function getEntityManager()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getEntityManager', []);

        return parent::getEntityManager();
    }

    /**
     * {@inheritDoc}
     */
    public function getId()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getId', []);

        return parent::getId();
    }

    /**
     * {@inheritDoc}
     */
    public function getIdFieldName()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIdFieldName', []);

        return parent::getIdFieldName();
    }

    /**
     * {@inheritDoc}
     */
    public function setDefaultValues()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDefaultValues', []);

        return parent::setDefaultValues();
    }

    /**
     * {@inheritDoc}
     */
    public function toTableAssoc()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'toTableAssoc', []);

        return parent::toTableAssoc();
    }

    /**
     * {@inheritDoc}
     */
    public function getTypeaheadTemplate()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTypeaheadTemplate', []);

        return parent::getTypeaheadTemplate();
    }

    /**
     * {@inheritDoc}
     */
    public function getDefaultFormView($form, $clientSideValidationActivated = true)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDefaultFormView', [$form, $clientSideValidationActivated]);

        return parent::getDefaultFormView($form, $clientSideValidationActivated);
    }

    /**
     * {@inheritDoc}
     */
    public function getDefaultSubFormView($form, $clientSideValidationActivated = true)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDefaultSubFormView', [$form, $clientSideValidationActivated]);

        return parent::getDefaultSubFormView($form, $clientSideValidationActivated);
    }

    /**
     * {@inheritDoc}
     */
    public function checkConsistency()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'checkConsistency', []);

        return parent::checkConsistency();
    }

    /**
     * {@inheritDoc}
     */
    public function setFieldTypeIsNotSet($sqlFieldName, $value)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setFieldTypeIsNotSet', [$sqlFieldName, $value]);

        return parent::setFieldTypeIsNotSet($sqlFieldName, $value);
    }

    /**
     * {@inheritDoc}
     */
    public function getFieldTypeIsNotSet($sqlFieldName)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getFieldTypeIsNotSet', [$sqlFieldName]);

        return parent::getFieldTypeIsNotSet($sqlFieldName);
    }

    /**
     * {@inheritDoc}
     */
    public function get($name)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'get', [$name]);

        return parent::get($name);
    }

    /**
     * {@inheritDoc}
     */
    public function set($name, $value)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'set', [$name, $value]);

        return parent::set($name, $value);
    }

    /**
     * {@inheritDoc}
     */
    public function mergeCollections($coll1, $coll2)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'mergeCollections', [$coll1, $coll2]);

        return parent::mergeCollections($coll1, $coll2);
    }

}
