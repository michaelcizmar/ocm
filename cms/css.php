<?php
chdir("..");
require_once('pika-danio.php');
pika_init();
$a = array();
$a['base_url'] = pl_settings_get('base_url');
header("Content-Type: text/css");
pika_exit(pl_template($_SERVER["SCRIPT_FILENAME"], $a));

?>