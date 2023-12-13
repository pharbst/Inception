FROM debian:bookworm

LABEL version="1.0"
LABEL description="Mariadb container for inception project"

RUN 	apt update && apt install -y mariadb-server

EXPOSE 3306

COPY	./mariadb_init.sh /root/

RUN		chmod 777 /root/mariadb_init.sh

ENTRYPOINT [ "bash", "/root/mariadb_init.sh" ]