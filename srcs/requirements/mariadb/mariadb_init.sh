#!/bin/bash

echo Hallo from the script

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo installing sql database
	mysql_install_db
fi
service mariadb start
sleep 5
result=$(mariadb -sN -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WP_USER');")

if [ "$result" = "0" ]; then
    mariadb -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';"
fi

if [ $(mariadb -e "SHOW DATABASES;" | grep '$WP_DB' -q) ]; then
    echo "Database: '$WP_DB' already exists"
else
    echo "Database '$WP_DB' does not exist"
	mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB; GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"
fi

service mariadb stop