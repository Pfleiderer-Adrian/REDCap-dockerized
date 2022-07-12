<?php

global $log_all_errors;
$log_all_errors = FALSE;

// MYSQL DATABASE CONNECTION:
$hostname       = 'your_mysql_host_name';
$db             = 'your_mysql_db_name';
$username       = 'your_mysql_db_username';
$password       = 'your_mysql_db_password';

// SSL/TLS for improved security.
$db_ssl_key     = '';           // e.g., '/etc/mysql/ssl/client-key.pem'
$db_ssl_cert    = '';           // e.g., '/etc/mysql/ssl/client-cert.pem'
$db_ssl_ca      = '';           // e.g., '/etc/mysql/ssl/ca-cert.pem'
$db_ssl_capath  = NULL;
$db_ssl_cipher  = NULL;
$db_ssl_verify_server_cert = false;

// SALT VARIABLE:
$salt = '';

// DATA TRANSFER SERVICES (DTS):
// $dtsHostname         = 'your_dts_host_name';
// $dtsDb                       = 'your_dts_db_name';
// $dtsUsername         = 'your_dts_db_username';
// $dtsPassword         = 'your_dts_db_password';
