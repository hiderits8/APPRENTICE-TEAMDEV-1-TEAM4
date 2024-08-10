FROM php:8.2-apache 

# MySQLをインストール
# RUN docker-php-ext-install mysqli

# PHPからMySQLへ接続するための拡張をインストール
RUN docker-php-ext-install pdo pdo_mysql

# PHP関連 -------------------------------------------------
# Install Xdebug
RUN pecl install xdebug \
&& docker-php-ext-enable xdebug

# Composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# PHP_CodeSnifferをインストール #リモート接続設定必要なため一旦なし
# RUN composer global require "squizlabs/php_codesniffer=*"

# php.iniをコピー xdebugを使用可能にするため
COPY ./config/php.ini /usr/local/etc/php/conf.d/php.ini
# -------------------------------------------------

# Apache設定をコピー ホストからファイルアクセス時の権限不足問題を解決するため
COPY apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# dbを作成 *initdbに配置したSQLは自動実行される
COPY db/create_bookshelf.sql /docker-entrypoint-initdb.d/

# プロジェクトファイルをコピー
COPY . /var/www/html

# # Composerを使用して依存関係をインストール
# RUN composer install --working-dir=/var/www/html