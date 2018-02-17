#!/bin/bash

function exportBoolean {
    if [ "${!1}" = "**Boolean**" ]; then
            export ${1}=''
    else
            export ${1}='Yes.'
    fi
}

exportBoolean LOG_STDOUT
exportBoolean LOG_STDERR

if [ $LOG_STDERR ]; then
    /bin/ln -sf /dev/stderr /var/log/apache2/error.log
else
	LOG_STDERR='No.'
fi

if [ $ALLOW_OVERRIDE == 'All' ]; then
    /bin/sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
fi

if [ $LOG_LEVEL != 'warn' ]; then
    /bin/sed -i "s/LogLevel\ warn/LogLevel\ ${LOG_LEVEL}/g" /etc/apache2/apache2.conf
fi

# enable php short tags:
/bin/sed -i "s/short_open_tag\ \=\ Off/short_open_tag\ \=\ On/g" /etc/php/7.0/apache2/php.ini

# stdout server info:
if [ ! $LOG_STDOUT ]; then
cat << EOB

    **********************************************
    *                                            *
    *    Docker image: fauria/lamp               *
    *    https://github.com/fauria/docker-lamp   *
    *                                            *
    **********************************************
    SERVER SETTINGS
    ---------------
    · Redirect Apache access_log to STDOUT [LOG_STDOUT]: No.
    · Redirect Apache error_log to STDERR [LOG_STDERR]: $LOG_STDERR
    · Log Level [LOG_LEVEL]: $LOG_LEVEL
    · Allow override [ALLOW_OVERRIDE]: $ALLOW_OVERRIDE
    · PHP date timezone [DATE_TIMEZONE]: $DATE_TIMEZONE
EOB
else
    /bin/ln -sf /dev/stdout /var/log/apache2/access.log
fi

# Set PHP timezone
/bin/sed -i "s/\;date\.timezone\ \=/date\.timezone\ \=\ ${DATE_TIMEZONE}/" /etc/php/7.0/apache2/php.ini

# Run Postfix
/usr/sbin/postfix start






#part of bacluc
# Run MariaDB
service mysql start

CONCRETE5_DIR=/var/www/html/concrete5

mysql --execute="create database newgryfipage collate utf8mb4_bin;"

#installing owncloud does not work yet...
#php occ  maintenance:install \
#--database "mysql" --database-name "newgryfipage"  --database-user "root" --database-pass "root" \
# --admin-user "admin" --admin-pass "password"

mv $CONCRETE5_DIR/application/config/database.php $CONCRETE5_DIR/application/config/database.backup.php
cp $CONCRETE5_DIR/../docker/database.php $CONCRETE5_DIR/application/config/database.php

mysql newgryfipage < /var/www/html/docker/newgryfipage.sql


#$CONCRETE5_DIR/concrete/bin/concrete5 c5:clear-cache
#chmod -R g+w $CONCRETE5_DIR/application/files

$CONCRETE5_DIR/concrete/bin/concrete5 c5:package-install basic_table_package
$CONCRETE5_DIR/concrete/bin/concrete5 c5:package-install bacluc_gryfenberg_theme
$CONCRETE5_DIR/concrete/bin/concrete5 c5:package-install bacluc_person_package
$CONCRETE5_DIR/concrete/bin/concrete5 c5:package-install bacluc_event_package


mysql --execute "update mysql.user set password=PASSWORD('root'), plugin = NULL;"

service mysql restart




# Run Apache:
if [ $LOG_LEVEL == 'debug' ]; then
    /usr/sbin/apachectl -DFOREGROUND -k start -e debug
else
    &>/dev/null /usr/sbin/apachectl -DFOREGROUND -k start
fi