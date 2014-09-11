<?php


function input_hidden($field_name = null, $field_value = null, $menu_array = null, $args = null) {

	$hidden_output = '';

	if(is_array($field_value)) {
		$field_value = null;
	}

	if(!is_array($args)) {
		$args = array();
	}

	$def_args = array(
	// STD Directives
	'name' => $field_name,
	'id' => $field_name,
	'default' => ''
	);

	// Allow arg override
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);

	// Begin building hidden
	$hidden_output .= "<input type=\"hidden\" ";


	$hidden_output .= "name=\"{$temp_args['name']}\" ";
	$hidden_output .= "id=\"{$temp_args['id']}\" ";
	// If no value supplied substitute default value if specified
	if(!$field_value && strlen($field_value) < 1 && $temp_args['default']) {
		$field_value = $temp_args['default'];
	}
	$hidden_output .= "value=\"{$field_value}\" ";
	$hidden_output .= "/>";

	return $hidden_output;

}




?>