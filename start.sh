touch /var/www/pydio-core/data/cache/admin_counted
touch /var/www/pydio-core/data/cache/diag_result.php
touch /var/www/pydio-core/data/cache/first_run_passed

: "${PYDIO_DB_HOST:=mysql}"
: ${PYDIO_DB_USER:=${MYSQL_ENV_MYSQL_USER:-root}}
if [ "$PYDIO_DB_USER" = 'root' ]; then
    : ${PYDIO_DB_PASSWORD:=$MYSQL_ENV_MYSQL_ROOT_PASSWORD}
fi
: ${PYDIO_DB_PASSWORD:=$MYSQL_ENV_MYSQL_PASSWORD}
: ${PYDIO_DB_NAME:=${MYSQL_ENV_MYSQL_DATABASE:-pydio}}

if  [ -z "$PYDIO_DB_PASSWORD" ]; then
    PYDIO_DB_HOST=127.0.0.1
    PYDIO_DB_USER=root
    PYDIO_DB_PASSWORD=pydiomysqlpwd
    service mysql start
    mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$PYDIO_DB_PASSWORD');;"
fi

if [ "`mysql -u'$PYDIO_DB_USER' -p'$PYDIO_DB_PASSWORD' -h $PYDIO_DB_HOST -se'USE $PYDIO_DB_NAME;' 2>&1`" == "" ]; then
    echo $PYDIO_DB_NAME exist
else
    echo $PYDIO_DB_NAME dont exist
    mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST -e "create database $PYDIO_DB_NAME"
    mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST < /var/www/create.mysql
fi

sed -i -e "s/MYSQL_USER/$PYDIO_DB_USER/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_HOST/$PYDIO_DB_HOST/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_PASSWORD/$PYDIO_DB_PASSWORD/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_DATABASE/$PYDIO_DB_NAME/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json

service php5-fpm restart && nginx
