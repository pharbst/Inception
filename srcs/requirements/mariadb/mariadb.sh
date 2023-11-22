# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/22 10:15:49 by pharbst           #+#    #+#              #
#    Updated: 2023/11/22 14:25:12 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

mysql_install_db

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB; GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"

service mariadb stop

exec $@