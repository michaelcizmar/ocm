<?php

function checkbox($field_name = null, $field_value = null, $menu_array = null, $args = null) {
	$checkbox_output = '';
	
	if(!is_array($args)) {
		$args = array();
	}
	
	if(is_array($field_value)){
		$field_value = null;
	}
	
	$def_args = array(
		// STD Directives
		'name' => $field_name,
		'id' => $field_name,
		'default_value' => '1',
		'class' => 'plcheck',
		'label' => '',
		'tabindex' => '1',
		'disabled' => false,
		'no_hidden' => false,
		// JS Directives
		'onfocus' => '', 
		'onblur' => '', 
		'onclick' => '',
		'onmouseup' => '',
		'onmousedown' => ''
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building checkbox
	
	if(!$temp_args['no_hidden']) {
		$checkbox_output .= "<input type=\"hidden\" name=\"{$field_name}\" value=\"0\"/>";
	}
	$checkbox_output .= "<input type=\"checkbox\" ";
	
	
	$checkbox_output .= "name=\"{$field_name}\" ";
	$checkbox_output .= "id=\"{$temp_args['id']}\" ";
	$default_value = '1';
	if($temp_args['default_value']) {
		$default_value = $temp_args['default_value'];
	}
	$checkbox_output .= "value=\"{$default_value}\" ";
	$checkbox_output .= "class=\"{$temp_args['class']}\" ";
	
	if($temp_args['onclick'] != '') { 
		$checkbox_output .= "onClick=\"{$temp_args['onclick']}\" ";
	} if($temp_args['onfocus'] != '') { 
		$checkbox_output .= "onFocus=\"{$temp_args['onfocus']}\" ";
	} if($temp_args['onblur'] != '') { 
		$checkbox_output .= "onBlur=\"{$temp_args['onblur']}\" ";
	} if($temp_args['onmouseup'] != '') { 
		$checkbox_output .= "onMouseUp=\"{$temp_args['onmouseup']}\" ";
	} if($temp_args['onmousedown'] != '') { 
		$checkbox_output .= "onMouseDown=\"{$temp_args['onmousedown']}\" ";
	}
	
	$checkbox_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
	
	if($temp_args['disabled']) {
		$checkbox_output .= "disabled ";
	}
	
	if($field_value == 1) {
		$checkbox_output .= " checked";
	}
	
	$checkbox_output .= "/>";
	
	if(isset($temp_args['label']) && strlen($temp_args['label']) > 0) 
	{
		// 2013-08-08 AMW - Checkbox is now wrapped inside <label> for better HTML5/Bootstrap compatibility.
		$checkbox_output = "<label class=\"checkbox\">{$checkbox_output}&nbsp;{$temp_args['label']}</label>";
	}
	
	return $checkbox_output;

}


?>