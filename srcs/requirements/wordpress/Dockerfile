FROM debian:bookworm

LABEL version="0.1"
LABEL description="wordpress container for inception project"

RUN apt update
RUN apt install -y	wget php php-fpm php-mysql mariadb-client

RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& mv wp-cli.phar wp \
	&& chmod +x wp

EXPOSE 9000

COPY www.conf /etc/php/8.2/fpm/pool.d/

COPY wordpress_init.sh /root/

RUN chmod 777 /root/wordpress_init.sh

ENTRYPOINT [ "/root/wordpress_init.sh" ]
