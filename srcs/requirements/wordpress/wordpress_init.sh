#!/bin/bash

# while ! mysqladmin -u $WP_USER -p $WP_PASS ping "mariadb" -p 3306; do
#     sleep 1
# done
# sleep 35
/root/wait-for-it.sh mariadb:3306 -t 120
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root config create --dbhost=mariadb --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --locale=en_DB 
	wp --allow-root core download
fi

exec php-fpm8.2 -F