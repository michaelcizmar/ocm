<?php

chdir('..');

define('PL_DISABLE_SECURITY',true);
require_once('pika-danio.php');
pika_init();


require_once('pikaAuth.php');
require_once('pikaSettings.php');

pikaAuth::getInstance()->logout();


$settings = pikaSettings::getInstance();
header("Location: " . $settings['base_url'] . '/m');
