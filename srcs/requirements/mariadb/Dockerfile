FROM alpine:3.18.4

LABEL version="0.0 beta"
LABEL description="Mariadb container for inception project"

RUN 	apk update && apk upgrade && apk add --no-cache \
		mariadb \
		mariadb-client

COPY	../tools/mariadb_init.sh /root/

RUN		chmod /root/mariadb_init.sh

ENTRYPOINT [ "sh", "/root/mariadb_init.sh" ]