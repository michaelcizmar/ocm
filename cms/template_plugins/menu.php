<?php


function menu($field_name = null, $field_value = null, $menu_array = null, $args = null)
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
		'name' => $field_name,
		'id' => $field_name,
		'class' => 'plmenu',
		'style' => '',
		'tabindex' => '1',
		'disabled' => false,
		// JS Directives
		'onfocus' => '', 
		'onblur' => '', 
		'onchange' => '',
		// Data Directives
		'noblank' => false,
		'nomsg' => false,
		'default' => '',
		'first_value' => false,
		// Format Directive
		'text' => false
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	if($temp_args['text'])
	{
		return pikaTempLib::plugin('text_menu',$field_name,$field_value,$menu_array,$args);
	}
	
	// Begin building menu
	$menu_output = '';
	$menu_output .= "<select ";
	
	$menu_output .= "name=\"{$temp_args['name']}\" ";
	$menu_output .= "id=\"{$temp_args['id']}\" ";
	$menu_output .= "class=\"{$temp_args['class']}\" ";
	$menu_output .= "style=\"{$temp_args['style']}\" ";
	$menu_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
	if($temp_args['disabled']) {
		$menu_output .= "disabled ";
	}
	
	if($temp_args['onfocus'] != '') {
		$menu_output .= "onFocus=\"{$temp_args['onfocus']}\" ";	
	} if($temp_args['onblur'] != '') {
		$menu_output .= "onBlur=\"{$temp_args['onblur']}\" ";
	} if($temp_args['onchange'] != '') {
		$menu_output .= "onChange=\"{$temp_args['onchange']}\" ";
	}
	
	$menu_output .= ">\n";
	
	if(strlen($temp_args['default']) > 0 && (is_null($field_value) || strlen($field_value) < 1))
	{
		$field_value = $temp_args['default'];
	}
	elseif($temp_args['first_value'] && count($menu_array) > 0 && (is_null($field_value) || strlen($field_value) < 1))
	{
		$menu_keys = array_keys($menu_array);
		$field_value = $menu_keys[0];
	}
	
	
	if($temp_args['noblank']) {
		if(is_null($field_value) || strlen($field_value) < 1) {  // Enter blank if and only if value is blank
			$menu_output .= "<option selected value=\"\">&nbsp;</option>\n";
		}
	} else { // Blanks are shown - Check if field is blank to mark as selected
		$selected = '';
		if(is_null($field_value) || strlen($field_value) < 1) {
			$selected = 'selected';
		}
		$menu_output .= "<option {$selected} value=\"\">&nbsp;</option>\n";
	}
	
	if (!is_null($field_value) && !isset($menu_array[$field_value]) && strlen($field_value) > 0) {
		$menu_output .= "<option selected value=\"{$field_value}\">{$field_value}</option>\n";
	}
	
	// catch any cases where no menu data is available
	if (count($menu_array) < 1 && !$temp_args['nomsg'])
	{
		$menu_output .= "<option value=\"\">No Menu Available</option>\n";
	}
	
	foreach ($menu_array as $key => $label) {
		$selected = '';
		
		if(!is_null($field_value) && strlen($field_value) > 0 && (strcmp((string)$key,(string)$field_value) == 0)) {
			$selected = 'selected';
		}
		
		$menu_output .= "<option {$selected} value=\"{$key}\">{$label}</option>\n";
	}
	
	
	$menu_output .= "</select>";
	
	return $menu_output;
}

?>