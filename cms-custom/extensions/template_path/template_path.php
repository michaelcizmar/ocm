<?php

function template_path($template_file)
{
	if (isset($_SESSION['def_office']) && file_exists(getcwd(). "-" . $_SESSION['def_office']. "-custom/{$template_file}"))
	{
	    $template_file = getcwd(). "-" . $_SESSION['def_office']."-custom/{$template_file}";        
	}
	
	else if (file_exists(getcwd(). "-custom/{$template_file}"))
	{
	        $template_file = getcwd(). "-custom/{$template_file}";
	}
	
	return $template_file;
}

?>
