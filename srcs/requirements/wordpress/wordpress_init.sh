#!/bin/bash

# while ! mysqladmin -u $WP_USER -p $WP_PASS ping "mariadb" -p 3306; do
#     sleep 1
# done
sleep 10
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	# wp --allow-root config create
	wp --allow-root config create --dbhost=mariadb --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --locale=en_DB 
	wp --allow-root core download
	wp --allow-root core install --url=mariadb --title=NOT_A_WEBSITE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
	wp --allow-root user create test test@test.com --user_pass=secret --porcelain
fi

exec php-fpm8.2 -F