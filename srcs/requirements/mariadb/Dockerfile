FROM debian:stable

LABEL version="1.0"
LABEL description="Mariadb container for inception project"

RUN 	apt-get update
# RUN		apt-get install -y mysql-server
RUN		apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld
RUN touch /run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /run/mysqld/mysqld.sock

COPY	./entrypoint.sh /root/

RUN		chmod 777 /root/entrypoint.sh

ENTRYPOINT [ "bash", "/root/entrypoint.sh" ]