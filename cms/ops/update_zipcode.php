<?php 

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

/*
This code adds/updates zipcodes in the zip_codes table in Pika.
*/
chdir("..");
require_once ('pika-danio.php'); 
pika_init();


// Variables
// probably should be an array at this point
$base_url = pl_settings_get('base_url');
$screen = pl_grab_post('screen_name');
$zipcode = pl_grab_post('zipcode');
$safe_zipcode = mysql_real_escape_string($zipcode);
$state = pl_grab_post('state');
$safe_state = mysql_real_escape_string($state);
$city = pl_grab_post('city');
$safe_city = mysql_real_escape_string($city);
$county = pl_grab_post('county');
$safe_county = mysql_real_escape_string($county);
$areacode = pl_grab_post('area_code');
$safe_areacode = mysql_real_escape_string($areacode);


switch ($screen) {
	
	case 'edit':
		
		$sql="DELETE FROM zip_codes WHERE zip='{$safe_zipcode}'";
		mysql_query($sql) or trigger_error("");
		$sql="INSERT INTO zip_codes VALUES ('{$safe_city}', '{$safe_state}', '{$safe_zipcode}', '{$safe_areacode}', '{$safe_county}')";
		mysql_query($sql) or trigger_error("");
		
		header("Location: {$base_url}/zipcode.php?screen_msg=Zip Code {$safe_zipcode} Successfully Updated");	
		
		break;
		
	case 'add':
	
		$sql="DELETE FROM zip_codes WHERE zip='{$safe_zipcode}'";
		mysql_query($sql) or trigger_error("");
		$sql="INSERT INTO zip_codes VALUES ('{$safe_city}', '{$safe_state}', '{$safe_zipcode}', '{$safe_areacode}', '{$safe_county}')";
		mysql_query($sql) or trigger_error("");

		header("Location: {$base_url}/zipcode.php?screen_msg=Zip Code {$safe_zipcode} Successfully Added");
		
		break;
		
	default:
		
		trigger_error("Unknown screen code");
		die();
			
		break;
}

exit;







?>