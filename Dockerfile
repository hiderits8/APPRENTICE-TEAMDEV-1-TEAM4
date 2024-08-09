# syntax=docker/dockerfile:1

################################################################################

# Stage 1: Composer Dependencies
FROM composer:lts as deps

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --optimize-autoloader

################################################################################

# Stage 2: Application Setup
FROM php:8.2.12-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd zip pdo pdo_mysql \
    && pecl install xdebug-3.2.1 \
    && docker-php-ext-enable xdebug

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy Composer dependencies
COPY --from=deps /app/vendor /var/www/html/vendor

# Copy application files
COPY ./public /var/www/html/public
COPY ./src /var/www/html/src

# Set working directory
WORKDIR /var/www/html

# Set file permissions
RUN chown -R www-data:www-data /var/www/html

USER www-data

# Xdebug configuration
COPY ./config/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Apache Configuration (Optional if needed)
# COPY ./config/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# ベースイメージは既存のDockerfileを使用
# 新しい依存関係やツールを追加する場合は、ここに記載

# # Install Node.js (必要に応じて)
# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
#     && apt-get install -y nodejs \
#     && npm install -g npm \
#     && npm install -g eslint

# # PHP CodeSnifferのインストール
# RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
#     && chmod +x phpcs.phar \
#     && mv phpcs.phar /usr/local/bin/phpcs

# # PHP CodeSnifferのPSR規約設定
# RUN phpcs --config-set default_standard PSR12
