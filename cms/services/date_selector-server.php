<?php

/**********************************/
/* Pika CMS (C) 2008 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

define('PL_DISABLE_SECURITY',true);

chdir('..');
require_once('pika-danio.php');
pika_init();

require_once('pikaTempLib.php');

$field_name = pl_grab_get('field_name');
$field_value = pl_grab_get('field_value');
$container = pl_grab_get('container');
$month = pl_grab_get('month');
$year = pl_grab_get('year');


$buffer = pikaTempLib::plugin('date_selector',$field_name,$field_value,$container,array("month={$month}","year={$year}"));

exit($buffer);
?>
