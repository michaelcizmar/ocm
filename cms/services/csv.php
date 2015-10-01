<?php

/***************************/
/* Pika CMS (C) 2011       */
/* Pika Software, LLC.     */
/* http://pikasoftware.com */
/***************************/

set_time_limit(900);
ini_set('memory_limit', '512M');
ini_set("zlib.output_compression", "On");
ini_set("zlib.output_compression_level", 9);

chdir('../');

define('PL_HTTP_SECURITY',true);

require_once ('pika-danio.php');
pika_init();
require_once('pikaCase.php');
require_once('pikaContact.php');
require_once('pikaActivity.php');

$auth_row = pikaAuthHttp::getInstance()->getAuthRow();

if ('system' != $auth_row['group_id'])
{
	echo "This action is not available.  Please log in under an account with system privileges.";
	exit();
}



$action = pl_grab_get('action');

//header('Content-Type: text/txt; charset=utf-8');
//header('Content-Type: text/csv; charset=utf-8');
//header("Content-Disposition: attachment; filename={$action}.csv");

$columns = array();
$result = mysql_query("DESCRIBE " . $action);

while ($row= mysql_fetch_assoc($result))
{
	$columns[] = $row['Field'];
}

$output = fopen('php://output', 'w');

//var_dump($columns);
fputcsv($output, $columns);

$rows = mysql_query('SELECT * FROM ' . $action);
while ($row = mysql_fetch_assoc($rows))
{
	fputcsv($output, $row);
}

switch ($action)
{
	case 'cases':
	
		break;
	
	default:
		$buffer = 'Error: Unrecognized Action';
		break;
}

exit();


function if_unset(&$data,$key)
{
	if(isset($data[$key]))
	{
		unset($data[$key]);
	}
}

