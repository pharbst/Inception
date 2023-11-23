# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 03:19:31 by pharbst           #+#    #+#              #
#    Updated: 2023/11/23 10:09:59 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN	apt update \
	&& apt install -y mariadb-server

RUN mkdir /etc/mariadb

COPY ./mariadb.sh /etc/mariadb/mariadb.sh

RUN useradd -r -u 666 -m -s /sbin/nologin mariadb \
	&& chown -R :mariadb /etc/mariadb \
	&& chmod -R 710 /etc/mariadb \
	&& chown :mariadb /etc/mariadb/mariadb.sh \
	&& chmod 710 /etc/mariadb/mariadb.sh \
	&& chown -R :mariadb /var/lib/mysql \
	&& chmod -R 770 /var/lib/mysql
	# && chown -R :mariadb /var/log/mysql \
	# && chmod -R 770 /var/log/mysql \
	# && chown -R :mariadb /var/run/mysqld \
	# && chmod -R 770 /var/run/mysqld \

USER mariadb

ENTRYPOINT [ "/etc/mariadb/mariadb.sh" ]

CMD ["mariadb", "--bind-address=0.0.0.0"]