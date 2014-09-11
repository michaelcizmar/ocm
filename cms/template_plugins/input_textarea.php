<?php
function input_textarea($field_name = null, $field_value = null, $menu_array = null, $args = null) {
	
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
		'rows' => '3',
		'cols' => '33',
		// JS Directives
		'onfocus' => '', 
		'onblur' => '', 
		'onclick' => '',
		'onmouseup' => '',
		'onmousedown' => ''
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building textarea
	
	
	$text_output .= "<textarea ";
	
	
	$text_output .= "name=\"{$field_name}\" ";
	$text_output .= "id=\"{$temp_args['id']}\" ";
	
	$text_output .= "class=\"{$temp_args['class']}\" ";
	
	if($temp_args['cols'] != '') {
		$text_output .= "cols=\"{$temp_args['cols']}\" ";
	} if($temp_args['rows'] != '') {
		$text_output .= "rows=\"{$temp_args['rows']}\" ";
	}
	
	
	if($temp_args['onclick'] != '') { 
		$text_output .= "onClick=\"{$temp_args['onclick']}\" ";
	} if($temp_args['onfocus'] != '') { 
		$text_output .= "onFocus=\"{$temp_args['onfocus']}\" ";
	} if($temp_args['onblur'] != '') { 
		$text_output .= "onBlur=\"{$temp_args['onblur']}\" ";
	} if($temp_args['onmouseup'] != '') { 
		$text_output .= "onMouseUp=\"{$temp_args['onmouseup']}\" ";
	} if($temp_args['onmousedown'] != '') { 
		$text_output .= "onMouseDown=\"{$temp_args['onmousedown']}\" ";
	}
	
	$text_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
	
	if($temp_args['disabled']) {
		$text_output .= "disabled ";
	}
	
	$text_output .= "/>";
	$text_output .= $field_value;
	$text_output .= "</textarea>";
	
	
	return $text_output;

}