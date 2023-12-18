FROM debian:stable

LABEL version="1.0"
LABEL description="Mariadb container for inception project"

RUN 	apt-get update

RUN		apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld
RUN touch /run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /run/mysqld/mysqld.sock

COPY	./entrypoint.sh /usr/sbin/

RUN		chmod +x /usr/sbin/entrypoint.sh

# RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# VOLUME [ "/var/lib/mysql" ]

ENTRYPOINT [ "/usr/sbin/entrypoint.sh" ]

# ENTRYPOINT [ "mysqld", "-uroot", "--init-file=/usr/sbin/" ]