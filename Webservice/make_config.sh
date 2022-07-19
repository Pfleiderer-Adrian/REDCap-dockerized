#!/bin/sh

sed -ri -e "s!/var/www/html/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
sed -i "s/your_mysql_host_name/redcap-db:3306/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_name/${MYSQL_DATABASE}/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_username/${MYSQL_USER}/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_password/${MYSQL_PASSWORD}/g" /var/www/html/redcap/database.php

exec "$@"
