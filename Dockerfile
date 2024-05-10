FROM php:7.3-fpm-alpine3.11

ADD repositories /etc/apk/repositories
ADD default.conf index.html run.sh /

RUN apk update && apk add --no-cache nginx && \
    apk add --no-cache bash m4 autoconf make gcc g++ linux-headers && \
    docker-php-ext-install pdo_mysql opcache mysqli bcmath && \
    pecl install redis && docker-php-ext-enable redis && \
    sed -i 's/;pm.status_path = \/status/pm.status_path = \/status/g' /usr/local/etc/php-fpm.d/www.conf && \
    mkdir /run/nginx && \
    mv /default.conf /etc/nginx/conf.d && \
    mv /index.html /var/www/html && \
    touch /run/nginx/nginx.pid && \
    chmod 755 /run.sh
    # chmod 755 /run.sh && \
    # apk del m4 autoconf make gcc g++ linux-headers

EXPOSE 80 9000

ENTRYPOINT ["/run.sh"]