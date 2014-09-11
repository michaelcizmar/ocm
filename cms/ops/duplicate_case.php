<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('../');

require_once ('pika-danio.php');
pika_init();

require_once('pikaCase.php');


// VARIABLES
$case_id = pl_grab_get('case_id');


$case1 = new pikaCase($case_id);
$base_url = pl_settings_get('base_url');

// BEGIN MAIN CODE...
$dup = $case1->duplicate();
$dup_case_id = $dup->getValue('case_id');
header("Location: {$base_url}/case.php?case_id={$dup_case_id}&screen=info");
exit();

?>