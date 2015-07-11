<?php

/***************************/
/* Pika CMS (C) 2015       */
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

function sql_to_csv_output($sql)
{
	$output = fopen('php://output', 'w');
	$rows = mysql_query($sql);
	
	while ($row = mysql_fetch_assoc($rows))
	{
		fputcsv($output, $row);
	}
	
	fclose($output);
}

function chunk_table($table, $key)
{
	$chunk_size = 1000
	$safe_key = mysql_real_escape_string($key);
	$safe_table = mysql_escape_string($table);
	$result = mysql_query("SELECT MAX({$safe_key}) FROM {$safe_table}");
	$row = mysql_fetch_array($result);
	$max = $row[0];
	
	for ($i = 0; $i < $max; $i = $i + $chunk_size)
	{
		sql_to_csv_output("SELECT * FROM {$safe_table} ORDER BY {$safe_key} DESC LIMIT {$i}, {$chunk_size}");
	}
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
fputcsv($output, $columns);
fclose($output);

switch ($action)
{
	case 'cases':
		chunk_table('cases', 'case_id');
		break;
	
	default:
		sql_to_csv('SELECT * FROM ' . $action);		
		break;
}


exit();