<?php


function themes_menu($field_name = null, $field_value = null, $menu_array = null, $args = null)
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
	
	
	$themes_menu_output = '';
	
	$dh = opendir('themes');
	$ban_list = array();
	
	while ($file = readdir($dh))
	{
		// Do not display hidden files or any that have been banned
		if ($file[0] != '.' && !in_array($file, $ban_list))
		{
			$file_name = str_replace('.php','',$file);
			$menu_array[$file_name] = $file_name;		
		}
	}
		
	ksort($menu_array);
	closedir($dh);
	
	$themes_menu_output .= pikaTempLib::plugin('menu',$field_name,$field_value,$menu_array,$args);
	
	
	return $themes_menu_output;
}

?>