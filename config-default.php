<?php

$config['atk']['base_path']='./atk4/';
$config['dsn']='mysql://root:winserver@localhost/alk2';

$config['url_postfix']='';
$config['url_prefix']='?page=';

# Agile Toolkit attempts to use as many default values for config file,
# and you only need to add them here if you wish to re-define default
# values. For more options look at:
#
#  http://www.atk4.com/doc/config


$config['tmail']['transport'] = "PHPMailer";
$config['tmail']['phpmailer']['from'] = "info@fast-rich.org";
$config['tmail']['from'] = "";
$config['tmail']['phpmailer']['from_name'] = "Fast Rich";
$config['tmail']['smtp']['host'] = "ssl://mail.fast-rich.org";
$config['tmail']['smtp']['port'] = 465;
$config['tmail']['phpmailer']['username'] = "info@fast-rich.org";
$config['tmail']['phpmailer']['password'] = "Info@123";
$config['tmail']['phpmailer']['reply_to'] = "no-reply@fast-rich.org";
$config['tmail']['phpmailer']['reply_to_name'] = "No-Reply";