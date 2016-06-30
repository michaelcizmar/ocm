<?php

/**********************************/
/* Pika CMS (C) 2009 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('..');
require_once('pika-danio.php');
pika_init();
require_once('pikaInterview.php');



$interview_id = pl_grab_get('interview_id');
if(!is_numeric($interview_id)) {$interview_id = null;}
$interview = new pikaInterview($interview_id);
$buffer = '';



$buffer = $interview->interview_text;
header('Content-type: text/html');
pika_exit($buffer);
?>
