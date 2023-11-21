# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 03:19:31 by pharbst           #+#    #+#              #
#    Updated: 2023/11/21 17:18:15 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN	apt update \
	&& apt install -y mariadb-server

RUN mkdir /etc/mariadb

COPY ./mariadb.sh /etc/mariadb/mariadb.sh

RUN useradd -r -u 101 -m -s /sbin/nologin mariadb \
	&& chown -R :mariadb /etc/mariadb \
	&& chmod -R 710 /etc/mariadb \
	&& chown :mariadb /etc/mariadb/mariadb.sh \
	&& chmod 710 /etc/mariadb/mariadb.sh \
	&& chown -R :mariadb /var/lib/mysql \
	&& chmod -R 770 /var/lib/mysql \
	&& chown -R :mariadb /var/run/mysqld \
	&& chmod -R 770 /var/run/mysqld \
	&& chown -R :mariadb /var/log/mysql \
	&& chmod -R 770 /var/log/mysql

USER mariadb

ENTRYPOINT [ "/etc/mariadb/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]