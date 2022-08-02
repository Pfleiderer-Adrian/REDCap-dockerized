#!/bin/sh

# this install script automte the installation process from redcap

# set basic paths for the apache2 application
sed -ri -e "s!/var/www/html/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# set paths for the redcap database connection
sed -i "s/your_mysql_host_name/redcap-db/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_name/${MYSQL_DATABASE}/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_username/${MYSQL_USER}/g" /var/www/html/redcap/database.php
sed -i "s/your_mysql_db_password/${MYSQL_PASSWORD}/g" /var/www/html/redcap/database.php
sed -i "s/salt = '';/salt = '$(date | base64)';/g" /var/www/html/redcap/database.php

# prepare the sql file with the environment variables
sed -i "s|REDCAP_BASE_URL|${REDCAP_BASE_URL}|g" /var/install_scripts/redcap.sql
sed -i "s/REDCAP_VERSION/${REDCAP_VERSION}/g" /var/install_scripts/redcap.sql
sed -i "s/INSTITUTION/${INSTITUTION}/g" /var/install_scripts/redcap.sql
sed -i "s/DEPARTMENT/${DEPARTMENT}/g" /var/install_scripts/redcap.sql
sed -i "s/CONTACT_EMAIL/${CONTACT_EMAIL}/g" /var/install_scripts/redcap.sql
sed -i "s/ADMINISTRATOR_NAME/${ADMINISTRATOR_NAME}/g" /var/install_scripts/redcap.sql

# wait for the database container initialisation
while ! mysqladmin ping -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD --silent; do
  sleep 1
done

# connect to database and initialise tables
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/install.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/install_data.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/install_scripts/redcap.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db1.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db4.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db2.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db3.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db5.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db6.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db7.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db8.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db9.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db10.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db11.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db12.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db13.sql
mysql -h redcap-db -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/www/html/redcap/redcap_v${REDCAP_VERSION}/Resources/sql/create_demo_db14.sql

exec "$@"
