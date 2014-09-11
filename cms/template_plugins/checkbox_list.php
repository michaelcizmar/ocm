<?php
/**
* checkbox_list (alternative to multiselect)
* 
* Accepts list of comma separated values ($field_value) and generates list of checkboxes for values
* specified in supplied menu ($menu_array)
*
* @author Matthew <matt@pikasoftware.com>;
* @version 1.0
* @package Danio
* @return string list of values as checkboxes contained in div
* @param string $field_name - name of value container (hidden input - contains comma separated values)
* @param string $field_value - list of comma separated values in DB (for retrieval/saving purposes)
* @param array $menu_array - list of values to generate checkboxes (in pika menu format key=>value)
* @param array $args - arguments that alter list presentation
* 
**/

function checkbox_list($field_name = null, $field_value = null, $menu_array = null, $args = null)
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
		'hidden' => true,
		'div' => true,
		// DIV Directives
		'id' => '',
		'width' => '220',
		'height' => '250',
		'class' => ''
		
	);
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	
	// Begin building menu
	$checklist_output = '';
	$field_value_array = array();
	if(!is_array($field_value) && strlen($field_value) > 0) 
	{
		$field_value_array = explode(',',$field_value);	
	}
	
	$checklist_rand = rand(0,99999); // Needed in case there are several checklists
	
	$checklist_output .= "<table id=\"checkbox_list_{$checklist_rand}\" width=\"100%\" class=\"nopad\" cellspacing=\"0\" cellpadding=\"0\">";
	$checklist_output .= "<tr>\n\t<th>";
	$checklist_output .= "Check:&nbsp;";
	$checklist_output .= "<a onClick=\"checkAll('checkbox_list_{$checklist_rand}','{$field_name}');return false;\">All</a>&nbsp;|&nbsp;";
	$checklist_output .= "<a onClick=\"checkNone('checkbox_list_{$checklist_rand}','{$field_name}');return false;\">None</a>&nbsp;|&nbsp;";
	$checklist_output .= "<a onClick=\"checkInvert('checkbox_list_{$checklist_rand}','{$field_name}');return false;\">Invert</a>";
	$checklist_output .= "</th>\n</tr>";
	foreach($menu_array as $key => $val) {
		$checked = 0;
		if(in_array($key,$field_value_array)) 
		{
			$checked = 1;
		}
		
		$checklist_output .= "<tr>\n\t<td>";
		$checklist_output .= pikaTempLib::plugin('checkbox',$key,$checked,array(),array("no_hidden","label=$val","onclick=update_checkbox_list('{$key}','{$field_name}');"));	
		$checklist_output .= "</td>\n</tr>";

	}
	$checklist_output .= "</table>";

	
	
	
	if($temp_args['div']) { // checklist contained in DIV
		$width = '';
		if($temp_args['width']) 
		{
			$width = 'width:' . $temp_args['width'] . 'px;';
		}
		$height = '';
		if($temp_args['height']) 
		{
			$height = 'height:' . $temp_args['height'] . 'px;';
		}
		$class = '';
		if($temp_args['class']) 
		{
			$class = " class=\"{$temp_args['class']}\"";
		}
		$id = '';
		if($temp_args['id'])
		{
			$id = " id=\"{$temp_args['id']}\"";
		}
		
		$checklist_output = "<div{$class}{$id} style=\"background-color:#FFFFFF;{$width}{$height}border:1px black solid;overflow:auto;\">"
							. $checklist_output . "</div>";
	}
	if($temp_args['hidden']) {
		$checklist_output .= "\n";
		$checklist_output .= pikaTempLib::plugin('input_hidden',$field_name,$field_value);
	}
	
	return $checklist_output;
}

?>