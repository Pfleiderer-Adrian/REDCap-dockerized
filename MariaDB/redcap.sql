CREATE DATABASE IF NOT EXISTS `redcap`;
CREATE USER 'redcap_user'@'%' IDENTIFIED BY 'password_for_redcap_user';
GRANT SELECT, INSERT, UPDATE, DELETE ON `redcap`.* TO 'redcap_user'@'%';
