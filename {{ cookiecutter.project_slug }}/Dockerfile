# https://hub.docker.com/_/php
FROM php:7.4.8-apache

# Installation des extensions PHP
RUN docker-php-ext-install pdo_mysql

# Import des sources de l'application
COPY ./src /var/www/html/