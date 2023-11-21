# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 03:19:35 by pharbst           #+#    #+#              #
#    Updated: 2023/11/21 14:37:50 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

EXPOSE 443

RUN	apt update && apt install -y nginx openssl

RUN	mkdir -p /ssl \
 && cd /ssl \
 && openssl genpkey -algorithm RSA -out nginx.key \
 && openssl req -new -key nginx.key -out nginx.csr -subj "/C=DE/ST='Baden Württemberg' /L=Heilbronn /O=42/CN=42heilbronn.com" \
 && openssl req -x509 -sha256 -days 365 -key nginx.key -in nginx.csr -out nginx.crt

COPY nginx.conf /etc/nginx/conf.d/wp.conf

RUN useradd -r -u 101 -m -s /sbin/nologin nginx

RUN chown -R :nginx /ssl \
 && chmod -R 740 /ssl \
 && chown :nginx /ssl/nginx.key \
 && chmod 740 /ssl/nginx.key \
 && chown :nginx /ssl/nginx.crt \
 && chmod 740 /ssl/nginx.crt \
 && chown :nginx /etc/nginx/conf.d/wp.conf \
 && chmod 740 /etc/nginx/conf.d/wp.conf

USER nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
