#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo installing sql database
	cd /var/lib/mysql
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	cd /
fi
if ! $(grep -qE 'bind-address\s*0\.0\.0\.0' /etc/mysql/mariadb.conf.d/50-server.cnf && grep -qE 'skip-networking\s*=\s*0' /etc/mysql/mariadb.conf.d/50-server.cnf); then
	sed -i -e 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' -e '/^bind-address\s*=.*/a skip-networking = 0' /etc/mysql/mariadb.conf.d/50-server.cnf
fi
service mariadb start
# sleep 5
result=$(mariadb -sN -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WP_USER');")

if [ "$result" = "0" ]; then
    mariadb -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';"
fi
if [ -d /var/lib/mysql/$WP_DB ]; then
	echo database already exists
else
	echo creating database
	mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB; GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"
fi
sleep 2

service mariadb stop

exec mysqld -uroot