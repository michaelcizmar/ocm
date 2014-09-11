<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('../');

require_once ('pika-danio.php');
pika_init();


// VARIABLES
$base_url = pl_settings_get('base_url');
$dummy = array();

if (!pika_authorize("system", $dummy))
{
	$plTemplate["content"] = "Permission denied";
	$plTemplate["page_title"] = "System Operations";
	$plTemplate["nav"] = "<a href=\"{$base_url}/\" class=light>$pikaNavRootLabel</a> &gt; System Operations";
	
	pl_template($plTemplate, 'templates/default.html');
	echo pl_bench('results');
	exit();
}

// BEGIN MAIN CODE...
// The user is saving the system settings.

foreach ($_POST as $key => $val)
{
	if ($key != 'submit') 
	{
		$clean_val = pl_clean_form_input($val);
		pl_settings_set($key, $clean_val);	
	}
}

pl_settings_save() or trigger_error('Couldn\'t save settings');

header("Location: {$base_url}/system-settings.php");
exit();

?>