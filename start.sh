array=(/var/www/pydio-core/data/cache/admin_counted /var/www/pydio-core/data/cache/diag_result.php /var/www/pydio-core/data/cache/first_run_passed)

for file in ${array[@]}
do
    if [ -e $file ]; then
        echo $file exist
    else
        echo $file not exist, try to create it...
        touch $file
    fi
done

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
    ps -ef | grep -i mysql | grep -v grep
    if [ $?  -eq "0" ]; then
        echo "mysql is running"
    else
        echo "mysql is not running, starting mysql..."
        service mysql start
    fi
fi

sed -i -e "s/MYSQL_USER/$PYDIO_DB_USER/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_HOST/$PYDIO_DB_HOST/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_PASSWORD/$PYDIO_DB_PASSWORD/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_DATABASE/$PYDIO_DB_NAME/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/use DATABASE_NAME;/use $PYDIO_DB_NAME/g" /var/www/create.mysql

mysql -u"$PYDIO_DB_USER" -p"$PYDIO_DB_PASSWORD" -h"$PYDIO_DB_HOST" -se "USE $PYDIO_DB_NAME;"

if [ $? -eq "0" ]; then
    echo database $PYDIO_DB_NAME exist
else
    echo database $PYDIO_DB_NAME dont exist, try to create database and initialize data...
    mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST -e "create database $PYDIO_DB_NAME"
    mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST < /var/www/create.mysql
fi

ps -ef | grep -i php5 | grep -v grep
if [ $?  -eq "0" ]; then
    echo "php5-fpm is running"
else
    echo "php5-fpm is not running, starting php5-fpm..."
    service php5-fpm start
fi

if [ -n $PYDIO_HOST ]; then
    sed -i -e "s/server_name _;/server_name $PYDIO_HOST/g" /etc/nginx/nginx.conf
fi

nginx
