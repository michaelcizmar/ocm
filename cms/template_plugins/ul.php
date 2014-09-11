<?php


function ul($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	if (!is_array($menu_array))
	{
		$menu_array = array();
	}
	if(is_array($field_value)){
		$field_value = null;
	}
	if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		// STD Directives
		'ul_class' => '',
		'li_class' => '',
		'key_class' => false
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building unordered list
	$ul_output = '<ul';
	if($field_name) {
		$ul_output .= " id=\"{$field_name}\"";
	}
	if($temp_args['ul_class']) {
		$ul_output .= " class=\"{$temp_args['ul_class']}\"";
	}
	$ul_output .= ">\n";
	
	
	foreach ($menu_array as $key => $label) {
		if(is_array($label))
		{
			$ul_output .= "\t<li";
			if(isset($label['id']) && $label['id']) 
			{
				$ul_output .= " id=\"{$label['id']}\"";
			}
			if(isset($label['li_class']) && $label['li_class']) 
			{
				$ul_output .= " class=\"{$label['li_class']}\"";
			}
			$ul_output .= ">";
			if(isset($label['li'])) 
			{
				$ul_output .= $label['li'];
			}
			$ul_output .= "</li>\n";
		}
		else {
			$ul_output .= "\t<li";
			if($field_value) {
				$ul_output .= " id=\"{$field_value}-{$key}\"";
			}
			if($temp_args['li_class']) 
			{
				$ul_output .= " class=\"{$temp_args['li_class']}\"";
			}
			$ul_output .= ">{$label}</li>\n";
		}
	}
	
	
	$ul_output .= "</ul>\n";
	
	return $ul_output;
}

?>