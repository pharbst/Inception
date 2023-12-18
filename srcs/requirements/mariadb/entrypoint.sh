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

echo "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';
CREATE DATABASE IF NOT EXISTS $WP_DB;
GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';
FLUSH PRIVILEGES;" > /var/lib/mysql/init_db.sql

exec mysqld -uroot --init-file=/var/lib/mysql/init_db.sql