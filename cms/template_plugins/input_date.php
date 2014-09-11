<?php
function input_date($field_name = null, $field_value = null, $menu_array = null, $args = null) {
	
	$text_output = '';
	
	if(is_array($field_value)) {
		$field_value = null;
	}
	
	if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		// STD Directives
		'maxlength' => '10'
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	$args = pikaTempLib::setPluginArgs($temp_args);
	
	
	// Begin building date
	if ($field_value == '0000-00-00' || !$field_value)
	{
		$date_output = '';
	} else {
		$ts = strtotime($field_value);
		if($ts){
			$date_output = date('m/d/Y',$ts);
		} else {
			$date_output = pl_date_unmogrify(pl_date_mogrify($field_value));
				
		}
	}
	
	$input_date_output = "";
	
	$input_date_output .= pikaTempLib::plugin('input_text',$field_name,$date_output,array(),$args);
	
	
	return $input_date_output;

}




?>