<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('../');

require_once ('pika-danio.php');
pika_init();

require_once ('pikaUser.php');



$base_url = pl_settings_get('base_url');

$user_id = $auth_row['user_id'];
$user = new pikaUser($user_id);


$_SESSION['def_office'] =  pl_grab_post('def_office');
$_SESSION['def_intake_type'] =  pl_grab_post('def_intake_type');
$_SESSION['def_relation_code'] = pl_grab_post('def_relation_code');
$_SESSION['paging'] =  pl_grab_post('paging');
$_SESSION['font_size'] =  pl_grab_post('font_size');
$_SESSION['popup'] =  pl_grab_post('popup');
$_SESSION['theme'] = pl_grab_post('theme');
$_SESSION['def_ical_interval'] = pl_grab_post('def_ical_interval');
$_SESSION['def_rss_interval'] = pl_grab_post('def_rss_interval');
$_SESSION['r_format'] = pl_grab_post('r_format');
session_write_close();




header("Location: {$base_url}/prefs.php");


?>