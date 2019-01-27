FROM php:7.2-apache
RUN apt update && apt install -y mysql-client
RUN docker-php-ext-install mysqli
COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite
WORKDIR /var/www/html
