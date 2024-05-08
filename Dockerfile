FROM php:7.3-fpm-alpine3.11

ADD repositories /etc/apk/repositories
ADD default.conf index.html run.sh /

RUN apk update && apk add --no-cache nginx && \
    apk add --no-cache m4 autoconf make gcc g++ linux-headers && \
    docker-php-ext-install pdo_mysql opcache mysqli && \
    mkdir /run/nginx && \
    mv /default.conf /etc/nginx/conf.d && \
    mv /index.html /var/www/html && \
    touch /run/nginx/nginx.pid && \
    chmod 755 /run.sh && \
    apk del m4 autoconf make gcc g++ linux-headers

EXPOSE 80 9000

ENTRYPOINT ["/run.sh"]