FROM php:apache
RUN docker-php-ext-install pdo pdo_mysql
COPY ./src /var/www/html/