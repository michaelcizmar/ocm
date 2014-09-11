<?php


function case_handlers($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	if (!is_array($menu_array))
	{
		$menu_array = array();
	}
	
	if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		'attorney' => '1', // Can be comma separated list of attorney types to return (default = 1 staff attys only)
		'atty_enabled' => '1' // Select whether atty enabled (if blank ignore enabled status)
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	$menu_output = '';
	
	require_once('pikaUser.php');
	$result = 
	
	$filter = array();
	
	if(is_numeric($field_value)) {
		$filter['user_id'] = $field_value;
	}
	
	if(is_numeric($temp_args['atty_enabled']))
	{
		$filter['enabled'] = $temp_args['atty_enabled'];
	}
	
	if(is_numeric($temp_args['attorney']))
	{
		$filter['attorney'] = $temp_args['attorney'];
	}
	
	$user_array = pikaUser::getUserArray($filter);
	
	$menu_output = pikaTempLib::plugin('menu',$field_name,$field_value,$user_array,$args);
	
	
	return $menu_output;
}

?>