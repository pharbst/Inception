# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 03:19:31 by pharbst           #+#    #+#              #
#    Updated: 2023/11/26 15:26:00 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN	apt update \
	&& apt install -y mariadb-server

COPY ./mariadb.sh /root/

RUN chmod 777 /root/mariadb.sh

ENTRYPOINT [ "/root/mariadb.sh" ]

# CMD ["mariadb", "--bind-address=0.0.0.0"]