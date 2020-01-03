FROM php:7.3-fpm

RUN pecl install redis && docker-php-ext-enable redis

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

RUN apt-get update && yes | apt-get install libzip-dev

RUN apt-get update && docker-php-ext-install pdo pdo_mysql zip

RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin