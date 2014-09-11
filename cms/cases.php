<?php

require_once('pika-danio.php');
pika_init();


// VARIABLES
$extra_url = pl_simple_url();
$base_url = pl_settings_get('base_url');
$get_str = $_SERVER['QUERY_STRING'];

// MAIN CODE
if (sizeof($extra_url) == 0)
{
	// begin CASE LIST
	$next_url = "{$base_url}/case_list.php?{$get_str}";
}

else if(sizeof($extra_url) == 1 || sizeof($extra_url) == 2)
{
	// begin CASE SCREEN
	$next_url = "{$base_url}/case.php?case_id={$extra_url[0]}&{$get_str}";
}

else
{
	trigger_error('');
}

header("Location: {$next_url}");
exit();

?>
