<?php


function setting($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$setting_output = '';
	
	$blocked_array = array('dbhost','dbuser','dbpass');
	
	require_once('pikaSettings.php');
	$settings = pikaSettings::getInstance();
	
	if($settings[$field_name] && !in_array($field_name,$blocked_array))
	{
		$setting_output = $settings[$field_name];
	}
	
	return $setting_output;
}

?>