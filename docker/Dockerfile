FROM php:8.1.1-apache
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /var/www
RUN docker-php-ext-install mysqli
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql
ADD . /var/www
RUN chown -R www-data:www-data /var/www

RUN a2enmod rewrite

COPY virtualhost.conf /etc/apache2/sites-enabled/000-default.conf
