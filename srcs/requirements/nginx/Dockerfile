FROM debian:bookworm

LABEL version="1.0"
LABEL description="NGINX container for inception project"

RUN		apt update && apt install -y nginx openssl

EXPOSE 443

RUN mkdir -p /ssl \
	&& cd /ssl \
	&& openssl req -new -newkey rsa:2048 -nodes -keyout nginx.key -subj "/C=DE/ST=Baden-Württemberg /L=Heilbronn /O=42/CN=42heilbronn.com" -x509 -days 365 -out nginx.crt \
	&& cat /ssl/nginx.key /ssl/nginx.crt > /ssl/nginx.pem

COPY	./nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]