<?php
function input_password($field_name = null, $field_value = null, $menu_array = null, $args = null) {
	
	$pass_output = '';
	
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
		'onkeyup' => ''
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building text
	
	$pass_output .= "<input type=\"password\" ";
	
	
	$pass_output .= "name=\"{$field_name}\" ";
	$pass_output .= "id=\"{$temp_args['id']}\" ";
	
	
	$pass_output .= "value=\"{$field_value}\" ";
	if(isset($temp_args['class']) && strlen($temp_args['class']) > 0) {
		$pass_output .= "class=\"{$temp_args['class']}\" ";
	}
	
	if(isset($temp_args['style']) && strlen($temp_args['style']) > 0) {
		$pass_output .= "style=\"{$temp_args['style']}\" ";
	}
	
	if($temp_args['size'] != '') {
		$pass_output .= "size=\"{$temp_args['size']}\" ";
	} if($temp_args['maxlength'] != '') {
		$pass_output .= "maxlength=\"{$temp_args['maxlength']}\" ";
	}
	
	
	if($temp_args['onchange'] != '') { 
		$pass_output .= "onChange=\"{$temp_args['onchange']}\" ";
	} if($temp_args['onclick'] != '') { 
		$pass_output .= "onClick=\"{$temp_args['onclick']}\" ";
	} if($temp_args['onfocus'] != '') { 
		$pass_output .= "onFocus=\"{$temp_args['onfocus']}\" ";
	} if($temp_args['onblur'] != '') { 
		$pass_output .= "onBlur=\"{$temp_args['onblur']}\" ";
	} if($temp_args['onmouseup'] != '') { 
		$pass_output .= "onMouseUp=\"{$temp_args['onmouseup']}\" ";
	} if($temp_args['onmousedown'] != '') { 
		$pass_output .= "onMouseDown=\"{$temp_args['onmousedown']}\" ";
	}if($temp_args['onkeyup'] != '') { 
		$pass_output .= "onKeyUp=\"{$temp_args['onkeyup']}\" ";
	}
	
	
	$pass_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
	
	if($temp_args['disabled']) {
		$pass_output .= "disabled ";
	}
	
	$pass_output .= "/>";
	
	return $pass_output;

}




?>