<?php


function text_date($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$date_output = '';
	
	if(!is_array($args)) {
		$args = array();
	}
	if(is_array($field_value)){
		$field_value = null;
	}
	
	if ($field_value == '0000-00-00' || is_null($field_value) || !$field_value)
	{
		$date_output = '';
	} else {
		$date_to_unix_ts = strtotime($field_value);
		$date_output = date('m/d/Y',$date_to_unix_ts);
	}
	
	return $date_output;
}

?>