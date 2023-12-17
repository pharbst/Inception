FROM debian:stable

LABEL version="1.0"
LABEL description="wordpress container for inception project"

RUN apt update
RUN apt install -y	wget php php-fpm php-mysql mariadb-client

RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& mv wp-cli.phar wp \
	&& chmod +x wp

COPY www.conf /etc/php/8.2/fpm/pool.d/

COPY entrypoint.sh /usr/sbin/
COPY ./wait-for-it.sh /usr/sbin

RUN chmod +x /usr/sbin/entrypoint.sh
RUN chmod +x /usr/sbin/wait-for-it.sh

ENTRYPOINT [ "/usr/sbin/entrypoint.sh" ]
