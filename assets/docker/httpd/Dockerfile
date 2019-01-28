FROM php:7.2-apache
RUN apt update
RUN apt full-upgrade -y
RUN apt autoremove -y
RUN apt autoclean -y
RUN apt install -y mysql-client libmagickwand-dev
RUN apt install -y libmagickwand-dev --no-install-recommends
RUN docker-php-ext-install mysqli
RUN pecl install imagick-beta && docker-php-ext-enable imagick
COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite
WORKDIR /var/www/html
