# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/22 10:15:49 by pharbst           #+#    #+#              #
#    Updated: 2023/11/26 15:25:11 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

mysql_install_db

sudo sed -i "s/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';"
mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB; GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"
