<?php


function text_name($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$name_output = '';
	
	if(!is_array($field_value)) {
		$field_value = array('last_name' => $field_value);	
	}
	
	if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		// STD Directives
		'prefix' => '',
		'suffix' => '',
		'first_name' => 'first_name',
		'middle_name' => 'middle_name',
		'last_name' => 'last_name',
		'extra_name' => 'extra_name',
		'order' => 'first',
		// Optional Directives
		'salutation' => false,
		'no_extra' => false,
		'no_middle' => false
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building name
	
	$salutation = $first_name = $last_name = $middle_name = $extra_name = '';
	
	if (isset($field_value[$temp_args['extra_name']]) && $field_value[$temp_args['extra_name']] && !$temp_args['no_extra'])
	{
		$extra_name = $field_value[$temp_args['extra_name']];
	}
	
	if (isset($field_value[$temp_args['middle_name']]) && $field_value[$temp_args['middle_name']] && !$temp_args['no_middle'])
	{
		$middle_name = $field_value[$temp_args['middle_name']];
	}
	
	if (isset($field_value[$temp_args['first_name']]) && $field_value[$temp_args['first_name']])
	{
		$first_name = $field_value[$temp_args['first_name']];
	}
	
	if (isset($field_value[$temp_args['last_name']]) && $field_value[$temp_args['last_name']])
	{
		$last_name = $field_value[$temp_args['last_name']];
	}
	
	if (isset($field_value['gender']) && strlen($field_value['gender']) > 0) {
		if ($field_value['gender'] == 'M') {
			$salutation = 'Mr.';
		} elseif ($field_value['gender'] == 'F') {
			$salutation = 'Ms.';
		}
	}
	$name_output = '';
	
	if($temp_args['order'] == 'last') {
		if(strlen(trim($last_name)) > 0)
		{
			$name_output .= $last_name;
		}
		if(strlen(trim($first_name)) > 0)
		{
			if(strlen($last_name) > 0)
			{
				$name_output .= ', ';
			}
			$name_output.= $first_name;
		}
		if(strlen(trim($middle_name)) > 0)
		{
			$name_output .= ' ' . $middle_name;
		}
		$name_output = trim($name_output);
		if(strlen(trim($extra_name)) > 0)
		{
			if(strlen($first_name) > 0)
			{
				$name_output .= ',';	
			} 
			
			$name_output .= ' '.$extra_name;
		}
		$name_output = trim($name_output);
	} 
	else 
	{
		if(strlen(trim($first_name)) > 0)
		{
			$name_output .= $first_name;
		}
		if(strlen(trim($middle_name)) > 0)
		{
			$name_output .= ' ' . $middle_name;
		}
		$name_output = trim($name_output);
		if(strlen(trim($last_name)) > 0)
		{
			$name_output .= ' ' . $last_name;
			$name_output = trim($name_output);
			if(strlen(trim($extra_name)) > 0)
			{
				$name_output .= ' ' . $extra_name;
			}
		}
	}
	
	if(strlen($salutation) > 0)
	{
		$name_output = $salutation . ' ' . $name_output; 
	}
	
	return $name_output;
}

?>