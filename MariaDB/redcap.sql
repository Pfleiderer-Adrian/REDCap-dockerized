CREATE USER redcap_user  NOCREATEDB;
CREATE DATABASE redcap OWNER redcap_user;
ALTER USER redcap_user WITH PASSWORD 'redcap_db_pw';
