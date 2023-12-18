#!/bin/bash

mkdir -p /var/www/html/wordpress
chown www-data:www-data /var/www/html/wordpress

/usr/sbin/wait-for-db.sh mariadb 3306 120

cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root core download
	wp --allow-root config create --dbhost=mariadb --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --locale=en_DB 
	wp --allow-root core install --url=localhost --title="My very first website" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
	wp --allow-root user create peter peter@peter.com --user_pass=secret --porcelain
fi

chown www-data:www-data /var/www/html/wordpress/*

exec php-fpm8.2 -F