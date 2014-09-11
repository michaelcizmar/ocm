<?php

/**
* date_selector - draws calendar table 
*
* @var $field_name = Not used
* @var $field_value = Legacy pl_template tag
* @var $menu_array - Not used
* @author Matthew Friedlander <matt@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
function legacy_tag_converter($field_name = null, $field_value = null, $menu_array = array(), $args = array())
{
	if(strlen($field_value) < 5) 
	{
		return $field_value;
	}
	
	$def_args = array(
		'template_prefix' => '%%[',
		'template_suffix' => ']%%'
	);
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	
	$new_tag = '';
	$temp_string = $field_value;
	
	$template_prefix_length = strlen($temp_args['template_prefix']);
	$template_suffix_length = strlen($temp_args['template_suffix']);
	$temp_string_length = strlen($temp_string);
	
	
	if(substr($temp_string,0,$template_prefix_length) == $temp_args['template_prefix'])
	{
		$temp_string = substr($temp_string,$template_prefix_length);
		$temp_string_length = $temp_string_length - $template_prefix_length;
	}
	if(substr($temp_string,$temp_string_length-$template_suffix_length) == $temp_args['template_suffix'])
	{
		$temp_string = substr($temp_string,0,$temp_string_length-$template_suffix_length);
		$temp_string_length = $temp_string_length - $template_suffix_length;
	}
	
	if(strpos($temp_string,' ') !== false) {
		$tag_array = explode(' ',$temp_string);
		
		$new_tag_array = array('field_name' => $tag_array[0], 'menu' => '', 'op' => '', 'args' => array());
		for ($i=1;$i<count($tag_array);$i++) {
			switch ($tag_array[$i]) 
			{
				case 'menu_no_blank':
					$new_tag_array['args'][] = 'noblank';
				case 'menu':
					
					break;
				case 'text':
					$new_tag_array['op'] = 'text_menu';
					break;
				case 'vradio':
					$new_tag_array['op'] = 'radio';
					$new_tag_array['args'][] = 'vertical';
					break;
				case 'radio':
					$new_tag_array['op'] = 'radio';
					break;
				case 'checkbox':
					$new_tag_array['op'] = 'checkbox';
					break;
					
				default:
					if(strpos($tag_array[$i],'=') !== false) 
					{
						$sub_tag_array = explode('=',$tag_array[$i]);
						switch ($sub_tag_array[0]) 
						{
							case 'source':		
							case 'lookup':		
							case 'menu':
								$new_tag_array['menu'] = $sub_tag_array[1];
								break;
							case 'show_blank':
								$new_tag_array['args'][] = 'noblank';
								break;
							default: // Assume Argument
								$new_tag_array['args'][] = $tag_array[$i];
								break;
						}
					}
					else {
						$new_tag_array['args'][] = $tag_array[$i];
					}
					break;
			}
			
		}
		
		$new_tag .= $new_tag_array['field_name'];
		if(strlen($new_tag_array['menu']) > 0)
		{
			$new_tag .= "," . $new_tag_array['menu'];
		}
		if(strlen($new_tag_array['op']) > 0) {
			$new_tag .= "," . $new_tag_array['op'];
		}
		foreach ($new_tag_array['args'] as $val) {
			$new_tag .= "," . $val;
		}
		
		
		
		$new_tag = $temp_args['template_prefix'] . $new_tag . $temp_args['template_suffix'];
	}
	
	return $new_tag;
	
}



