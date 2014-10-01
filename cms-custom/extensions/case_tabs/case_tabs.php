<?php

// Custom code for LSNC; it decides which case tab table to use.

function case_tabs_extension()
{	
	if ("Mediator" == $_SESSION['def_group'])
	{
		$m = pl_menu_get('case_tabs_med');
	}
	
	else if ("Med Mgr" == $_SESSION['def_group'])
	{
		$m = pl_menu_get('case_tabs_medmgr');
	}
	
	else if ("95" == $_SESSION['def_office'])
	{
		$m = pl_menu_get('case_tabs_hrh');
	}
	
	else if (("system" == $_SESSION['def_group']) &&  ("80" == $_SESSION['def_office']))
	{
		$m = pl_menu_get('case_tabs_medmgr');
	}
	
	else if (("default" == $_SESSION['def_group']) &&  ("80" == $_SESSION['def_office']))
	{
		$m = pl_menu_get('case_tabs_slh');
	}
	
	else
	{
		$m = pl_menu_get('case_tabs');
	}
	
	$i = 0;
	foreach($m as $key => $val)
	{
		$menu_array['case-' .$key . '.php'] = array('file' => 'case-' .$key . '.php',
													'name' => $val,
													'enabled' => "1",
													'tab_id' => "$i",
													'tab_order' => "$i",
													'tab_row' => "1");
		$i++;
	}
	
	return $menu_array;
}	
?>