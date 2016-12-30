array=(/var/www/pydio-core/data/cache/admin_counted /var/www/pydio-core/data/cache/diag_result.php /var/www/pydio-core/data/cache/first_run_passed)

check_service() {
    ps -ef | grep -i $1 | grep -v grep > /dev/null
}

for file in ${array[@]}
do
    if [ -e $file ]; then
        echo "$file exist"
    else
        echo "$file not exist, try to create it..."
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
    check_service mysql
    if [ $?  -eq "0" ]; then
        echo "mysql is running"
    else
        chown -R mysql:mysql /var/lib/mysql 
        echo "mysql is not running, starting mysql..."
        service mysql start
        if [ $? != "0" ]; then
            echo "running mysql failed, try to reset /var/lib/mysql ..."
            mysql_install_db --user=mysql --ldata=/var/lib/mysql
            service mysql start
            mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('pydiomysqlpwd');"
        fi
    fi
fi

sed -i -e "s/MYSQL_USER/$PYDIO_DB_USER/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_HOST/$PYDIO_DB_HOST/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_PASSWORD/$PYDIO_DB_PASSWORD/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/MYSQL_DATABASE/$PYDIO_DB_NAME/g" /var/www/pydio-core/data/plugins/boot.conf/bootstrap.json
sed -i -e "s/use DATABASE_NAME;/use $PYDIO_DB_NAME/g" /var/www/data/*.sql

mysql -u"$PYDIO_DB_USER" -p"$PYDIO_DB_PASSWORD" -h"$PYDIO_DB_HOST" -se "USE $PYDIO_DB_NAME;"

if [ $? -eq "0" ]; then
    echo database $PYDIO_DB_NAME exist
    for file in /var/www/data/*.sql; do
        TABLENAME=${file:14: -4}
        if [ $(mysql -N -s -u"$PYDIO_DB_USER" -p"$PYDIO_DB_PASSWORD" -h"$PYDIO_DB_HOST" -e \
            "select count(*) from information_schema.tables where \
                table_schema='$PYDIO_DB_NAME' and table_name='$TABLENAME';") -eq 1 ]; then
            echo "table $TABLENAME exist"
        else
            echo "table $TABLENAME does not exist, try to create table..."
            mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST < $file
        fi
    done
else
    echo database $PYDIO_DB_NAME dont exist, try to create database and initialize data...
    mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST -e "create database $PYDIO_DB_NAME"
    for file in /var/www/data/*.sql; do
        mysql -u $PYDIO_DB_USER -p"$PYDIO_DB_PASSWORD" -h $PYDIO_DB_HOST < $file
    done
fi

check_service php5
if [ $?  -eq "0" ]; then
    echo "php5-fpm is running"
else
    echo "php5-fpm is not running, starting php5-fpm..."
    service php5-fpm start
fi

if [  "$PYDIO_HOST" != "" ]; then
    sed -i -e "s/server_name _;/server_name $PYDIO_HOST;/g" /etc/nginx/nginx.conf
fi

nginx
