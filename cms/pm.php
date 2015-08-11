<?php

/**********************************/
/* Pika CMS (C) 2012 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

/* TODO

	The apache config trick (Alias /p6/in-out.php ...) did not work when the site was moved to ps9.
	Is there another, more portable way to do this in Apache?
	
	Should I restrict extensions to only one-deep folders to make it easier to secure and easier
	to reference code in other extensions?  The downside is it will be harder for inexperienced
	users to install extensions on their own.

*/


require_once ('pika-danio.php');
pika_init();

// Ex:  '/org/pm.php/project/form.php'
$package_str = str_replace($_SERVER['SCRIPT_NAME'], "", $_SERVER['PHP_SELF']); 
// Now '/project/form.php'

$package_str = str_replace('..', '', $package_str);

$uri = explode('/', $package_str);
/*
var_dump($uri);
pika_exit();
*/
if ($uri[0] != '') 
{
	trigger_error("General URL error.");
}
/*
if (sizeof($uri) == 3)
{
	var_dump($uri);
}
*/
// This section could use a whitelist mechanism to improve security, by discarding any
// requests for files not on the whitelist.
else if ($uri[1] == 'reports')
{
	if (sizeof($uri) == 4)
	{
		$x = pl_custom_directory() . "/extensions/" . $uri[2] . '/' . $uri[3];
		chdir('app/lib');
		require($x);
	}
	
	else if (sizeof($uri) == 5)
	{
		$x = pl_custom_directory() . "/extensions/" . $uri[2] . '/' . $uri[3] . '/' . $uri[4];
		chdir('app/lib');
		require($x);
	}
}

else 
{
	array_shift($uri);
	$filepath = array_shift($uri);
	$filename = array_shift($uri);
	
	//if (array_search($filepath, pl_settings_get('extensions')) === false)
	if (strpos(pl_settings_get('extensions'), $filepath) === false)
	{
		trigger_error("Extension '{$filepath}':'{$filename}' is either not enabled or not installed.");
	}
	
	require(pl_custom_directory() . "/extensions/{$filepath}/{$filename}");
}

pika_exit();
?>
