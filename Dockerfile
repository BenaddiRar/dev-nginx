FROM nginx:alpine

ENV DEV_DOMAIN docker.local
ENV NGINX_SSL false

RUN apk update && apk add \
    openssl \
    bash

COPY generate-ssl.sh /etc/nginx/generate-ssl.sh
RUN chmod +x /etc/nginx/generate-ssl.sh
RUN cd /etc/nginx && ./generate-ssl.sh

COPY vhost.sh /etc/nginx/vhost.sh
RUN chmod +x /etc/nginx/vhost.sh
RUN cd /etc/nginx && ./vhost.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
