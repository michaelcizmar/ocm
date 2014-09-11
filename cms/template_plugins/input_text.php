<?php
function input_text($field_name = null, $field_value = null, $menu_array = null, $args = null) {
	
	$text_output = '';
	
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
		'class' => '',
		'tabindex' => '1',
		'disabled' => false,
		'size' => '',
		'maxlength' => '',
		'style' => '',
		// JS Directives
		'onchange' => '',
		'onfocus' => '', 
		'onblur' => '', 
		'onclick' => '',
		'onmouseup' => '',
		'onmousedown' => '',
		'onkeyup' => '',
		// Data Directives
		'default' => ''
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building text
	
	$text_output .= "<input type=\"text\" ";
	
	
	$text_output .= "name=\"{$field_name}\" ";
	$text_output .= "id=\"{$temp_args['id']}\" ";
	
	if(strlen($temp_args['default']) > 0 && (is_null($field_value) || strlen($field_value) < 1))
	{
		$field_value = $temp_args['default'];
	}	
	
	$text_output .= "value=\"{$field_value}\" ";
	if(isset($temp_args['class']) && strlen($temp_args['class']) > 0) {
		$text_output .= "class=\"{$temp_args['class']}\" ";
	}
	
	if(isset($temp_args['style']) && strlen($temp_args['style']) > 0) {
		$text_output .= "style=\"{$temp_args['style']}\" ";
	}
	
	if($temp_args['size'] != '') {
		$text_output .= "size=\"{$temp_args['size']}\" ";
	} if($temp_args['maxlength'] != '') {
		$text_output .= "maxlength=\"{$temp_args['maxlength']}\" ";
	}
	
	
	if($temp_args['onchange'] != '') { 
		$text_output .= "onChange=\"{$temp_args['onchange']}\" ";
	} if($temp_args['onclick'] != '') { 
		$text_output .= "onClick=\"{$temp_args['onclick']}\" ";
	} if($temp_args['onfocus'] != '') { 
		$text_output .= "onFocus=\"{$temp_args['onfocus']}\" ";
	} if($temp_args['onblur'] != '') { 
		$text_output .= "onBlur=\"{$temp_args['onblur']}\" ";
	} if($temp_args['onmouseup'] != '') { 
		$text_output .= "onMouseUp=\"{$temp_args['onmouseup']}\" ";
	} if($temp_args['onmousedown'] != '') { 
		$text_output .= "onMouseDown=\"{$temp_args['onmousedown']}\" ";
	}if($temp_args['onkeyup'] != '') { 
		$text_output .= "onKeyUp=\"{$temp_args['onkeyup']}\" ";
	}
	
	$text_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
	
	if($temp_args['disabled']) {
		$text_output .= "disabled ";
	}
	
	$text_output .= "/>";
	
	return $text_output;

}




?>