<?php


function text_menu($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	$text_output = '';
	if(is_array($field_value)){
		$field_value = null;
	}
	
	if (is_array($menu_array) && !is_null($field_value) && isset($menu_array[$field_value]))
	{
		$text_output = $menu_array[$field_value];
	}
	elseif (is_array($menu_array) && !is_null($field_name) && isset($menu_array[$field_name]))
	{
		$text_output = $menu_array[$field_name];
	}
	
	return $text_output;
}

?>