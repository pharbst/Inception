#!/bin/bash

mkdir -p /var/www/html/wordpress
chown www-data:www-data /var/www/html/wordpress

/usr/sbin/wait-for-it.sh mariadb:3306 -t 120

cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root core download
	wp --allow-root config create --dbhost=mariadb --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --locale=en_DB 
fi

chown www-data:www-data /var/www/html/wordpress/*

exec php-fpm8.2 -F