<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('../');

require_once ('pika-danio.php');
pika_init();


// LIBRARIES
require_once('pikaCase.php');


// VARIABLES
$case1 = new pikaCase();
$base_url = pl_settings_get('base_url');
$screen = pl_grab_get('screen', 'elig');


// BEGIN MAIN CODE

$case1->setValues(pl_clean_form_input($_GET));
/*	Since no client is added, and no conflict check will be performed, poten_conflicts
	will still be set to its default value of 1.  Fix this.
	
	This zero must be in quotes, otherwise it will be saved as a NULL, and poten
	conflicts is a NOT NULL field.
*/
$case1->setValue('poten_conflicts', '0');
$case1->save();
$case_id = $case1->getValue('case_id');
header("Location: {$base_url}/case.php?case_id={$case_id}&screen={$screen}");

exit();

?>