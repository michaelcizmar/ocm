<?php


function case_menu($field_name = null, $field_value = null, $menu_array = null, $args = null)
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
	
	// Begin building menu
	
	foreach ($menu_array as $key => $val) {
		$menu_array[$key] = "{$val['contacts.last_name']}, {$val['contacts.first_name']}
			{$val['contacts.middle_name']} {$val['contacts.extra_name']} - {$val['number']} - {$val['problem']} - {$val['funding']}";
	}
	
	if (!is_null($field_value) && !isset($menu_array[$field_value]) && strlen($field_value) > 0) {	
		require_once('pikaCase.php');
		require_once('pikaContact.php');
		
		$case = new pikaCase($field_value);
		$contact = new pikaContact($case->client_id);
		$menu_array[$field_value] = "{$contact->last_name}, {$contact->first_name}
						 {$contact->middle_name} {$contact->extra_name} - {$case->number} - {$case->problem} - {$case->funding}";
		
		$case = $contact = null;
		
	}
	
	
	$case_menu_output = pikaTempLib::plugin('menu',$field_name,$field_value,$menu_array,$args);
	
	return $case_menu_output;
}

?>