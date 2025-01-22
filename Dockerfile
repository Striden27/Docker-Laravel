FROM php:8.2-apache

# Установка необходимых расширений для работы с PostgreSQL
RUN apt-get update && \
    apt-get install -y libpq-dev unzip && \
    docker-php-ext-install pdo pdo_pgsql pgsql

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Копирование файлов проекта в контейнер
COPY . /var/www/html/

