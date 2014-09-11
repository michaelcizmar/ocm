<?php


function text_phone($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$phone_output = '';
	
	if(!is_array($field_value)) {
		$field_value = array();	
	}
	
	if(!is_array($args)) {
		$args = array();
	}

	$def_args = array(
		// STD Directives
		'area_code' => 'area_code',
		'phone' => 'phone',
		'phone_notes' => 'phone_notes',
		// Optional Directives
		'notes' => false
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building menu
	
	if (isset($field_value[$temp_args['area_code']]) && $field_value[$temp_args['area_code']])
	{
		$phone_output = '(' . $field_value[$temp_args['area_code']] . ')';
	}
	
	if (isset($field_value[$temp_args['phone']]) && $field_value[$temp_args['phone']])
	{
		$phone_output .= $field_value[$temp_args['phone']];
	}
	
	if (isset($field_value[$temp_args['phone_notes']]) && $field_value[$temp_args['phone_notes']] && $temp_args['notes'])
	{
		$phone_output .= ' ' . $field_value[$temp_args['phone_notes']];
	}
	
	
	return $phone_output;
}

?>