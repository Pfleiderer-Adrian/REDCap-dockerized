

UPDATE redcap_config SET value = '".db_escape(Authentication::getBestHashAlgo())."' WHERE field_name = 'password_algo';
UPDATE redcap_config SET value = 'REDCAP_VERSION' WHERE field_name = 'redcap_version';

UPDATE redcap_config SET value = 'sha512' WHERE field_name = 'password_algo';
UPDATE redcap_config SET value = '' WHERE field_name = 'redcap_csrf_token';
UPDATE redcap_config SET value = '1' WHERE field_name = 'superusers_only_create_project';
UPDATE redcap_config SET value = '1' WHERE field_name = 'superusers_only_move_to_prod';
UPDATE redcap_config SET value = '1' WHERE field_name = 'auto_report_stats';
UPDATE redcap_config SET value = '' WHERE field_name = 'bioportal_api_token';
UPDATE redcap_config SET value = 'REDCAP_BASE_URL' WHERE field_name = 'redcap_base_url';
UPDATE redcap_config SET value = 'M-D-Y_24' WHERE field_name = 'default_datetime_format';
UPDATE redcap_config SET value = '.' WHERE field_name = 'default_number_format_decimal';
UPDATE redcap_config SET value = '' WHERE field_name = 'default_number_format_thousands_sep';
UPDATE redcap_config SET value = ',' WHERE field_name = 'default_csv_delimiter';
UPDATE redcap_config SET value = 'ADMINISTRATOR_NAME' WHERE field_name = 'homepage_contact';
UPDATE redcap_config SET value = 'CONTACT_EMAIL' WHERE field_name = 'homepage_contact_email';
UPDATE redcap_config SET value = 'ADMINISTRATOR_NAME' WHERE field_name = 'project_contact_name';
UPDATE redcap_config SET value = 'CONTACT_EMAIL' WHERE field_name = 'project_contact_email';
UPDATE redcap_config SET value = 'INSTITUTION' WHERE field_name = 'institution';
UPDATE redcap_config SET value = 'DEPARTMENT' WHERE field_name = 'site_org_type';
UPDATE redcap_config SET value = '/var/www/html/redcap/hook_functions.php' WHERE field_name = 'hook_functions_file';
