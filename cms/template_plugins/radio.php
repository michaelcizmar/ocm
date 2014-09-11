<?php
function radio($field_name = null, $field_value = null, $menu_array = null, $args = null) {

	$radio_output = '';
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
		'class' => 'plradio',
		'tabindex' => '1',
		'disabled' => false,
		// JS Directives
		'onfocus' => '', 
		'onblur' => '',
		'onclick' => '',
		// Display Directives
		'vertical' => false
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	// Begin building radio
	
	foreach ($menu_array as $key => $label) {
		$checked = '';
		if($key == $field_value) {
			$checked = 'checked';
		}
		
		$number_pad = str_pad(rand(0,99999),5,'0');
		$uid = "{$temp_args['id']}_" . $number_pad;
		
		
		$radio_output .= "<label><input type=\"radio\" ";
		$radio_output .= "name=\"{$temp_args['name']}\" ";
		$radio_output .= "id=\"{$uid}\" ";
		$radio_output .= "value=\"{$key}\"";
		$radio_output .= "class=\"{$temp_args['class']}\" ";
		$radio_output .= "tabindex=\"{$temp_args['tabindex']}\" ";
		
		if($temp_args['onfocus'] != '') { 
			$radio_output .= "onFocus=\"{$temp_args['onfocus']}\" ";
		}if($temp_args['onblur'] != '') { 
			$radio_output .= "onBlur=\"{$temp_args['onblur']}\" ";
		}if($temp_args['onclick'] != '') { 
			$radio_output .= "onClick=\"{$temp_args['onclick']}\" ";
		}
		
		if ($temp_args['disabled']) {
			$radio_output .= "disabled ";
		}
		$radio_output .= "{$checked} />{$label}</label> ";
		if ($temp_args['vertical']) {
			$radio_output .= "<br/>\n";
		} else { $radio_output .= "&nbsp; "; }
		
	}
	
	return $radio_output;



}
?>