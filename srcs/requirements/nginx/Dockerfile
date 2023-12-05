FROM debian:bookworm

LABEL version="0.1"
LABEL description="NGINX container for inception project"

RUN		apt update && apt install -y nginx openssl

#	COPY	./config /etc/nginx/conf.d/wp.conf

RUN mkdir -p /ssl \
	&& cd /ssl \
	&& openssl req -new -newkey rsa:2048 -nodes -keyout server.key -subj "/C=DE/ST=Baden-Württemberg /L=Heilbronn /O=42/CN=42heilbronn.com" -x509 -days 365 -out server.crt

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]