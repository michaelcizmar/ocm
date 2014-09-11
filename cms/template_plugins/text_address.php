<?php


function text_address($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$address_output = '';
	
	if(!is_array($field_value)) {
		$field_value = array();	
	}
	
	if(!is_array($args)) {
		$args = array();
	}

	$def_args = array(
		// STD Directives
		'org' => 'org',
		'address' => 'address',
		'address2' => 'address2',
		'city' => 'city',
		'state' => 'state',
		'zip' => 'zip',
		// Optional Directives
		'nobreak' => false,
		'output' => 'text'
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building address
	$line_break = $line_space = '';
	if($temp_args['output'] == 'html'){
		$line_break = "<br/>\n";
		$line_space = "&nbsp;";
	} elseif ($temp_args['output'] == 'rtf') {
		$line_break = '{\par\n}';
		$line_space = ' ';
	} else {
		$line_break = "\n";
		$line_space = ' ';
	}
	if($temp_args['nobreak']) {
		$line_break = ' ';
	}
	
	
	
	if (isset($field_value[$temp_args['org']]) && $field_value[$temp_args['org']])
	{
		$address_output = $field_value[$temp_args['org']] . $line_break;
	}
	
	if (isset($field_value[$temp_args['address']]) && $field_value[$temp_args['address']])
	{
		$address_output .= $field_value[$temp_args['address']] . $line_break;
	}
	
	if (isset($field_value[$temp_args['address2']]) && $field_value[$temp_args['address2']])
	{
		$address_output .= $field_value[$temp_args['address2']] . $line_break;
	}
	$city_set = false;
	if (isset($field_value[$temp_args['city']]) && $field_value[$temp_args['city']])
	{
		$city_set = true;
		$address_output .= $field_value[$temp_args['city']];
	}
	$state_set = false;
	if (isset($field_value[$temp_args['state']]) && $field_value[$temp_args['state']])
	{
		$state_set = true;
		if($city_set) {
			$address_output .= ',' . $line_space;
		}
		$address_output .= $field_value[$temp_args['state']];
	}
	if (isset($field_value[$temp_args['zip']]) && $field_value[$temp_args['zip']])
	{
		if($city_set || $state_set) {
			$address_output .= $line_space;
		}
		$address_output .= $field_value[$temp_args['zip']];
	}
	
	return $address_output;
}

?>