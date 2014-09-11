<?php

function pika_warning($field_name = null, $field_value = null, $menu_array = null, $args = null)
{
	/*if (!is_array($menu_array))
	{
		$menu_array = array();
	}
	if(is_array($field_value)){
		$field_value = null;
	}
	if(!is_array($args)) {
		$args = array();
	}*/
	
	require_once('app/lib/pikaWarning.php');
	$warning = pikaWarning::getInstance();
	$warnings = $warning->getWarnings();
	
	$warning_output = '';
	// Check to see if warnings were generated - otherwise nothing to display
	if(!is_array($warnings) || (is_array($warnings) &&  count($warnings) < 1)) {
		return $warning_output;
	}
	$num_warnings = count($warnings);
	$base_url = pl_settings_get('base_url');
	
	// At least one warning exists (TODO - tie this to display_errors?)
	$warning_output .= "<div id='warning_link'><a href={$base_url} onclick='toggleWarnings();return false;'>PHP Warnings [{$num_warnings}]</a></div>";
	$warning_output .= "<div id='warning_list' style='display: none'>";
	$i = 1;
	foreach ($warnings as $val) {
		$warning_level = $val[0];
		switch ($warning_level) {
			case E_WARNING: // 2
				$warning_level = 'E_WARNING [2]';
	    		break;
			case E_PARSE: // 4
				$warning_level = 'E_PARSE [4]';
	    		break;
			case E_NOTICE: // 8
				$warning_level = 'E_NOTICE [8]';
	    		break;
			case E_STRICT: // 2048
				$warning_level = 'E_STRICT [2048]';
	    		break;
			case E_RECOVERABLE_ERROR: // 4096
				$warning_level = 'E_RECOVERABLE_ERROR [4096]';
	    		break;	
		}
		$warning_output .= $i++ . "/{$num_warnings} " . $warning_level . ": " . $val[1] . " - File: " . $val[2] . " - Line: " . $val[3] . "<br/>";
	}
	$warning_output .= "</div>\n";
	$warning_output .= pikaTempLib::plugin('javascript','toggleDiv.js');
	$warning_output .= pikaTempLib::plugin('javascript','pika_warning.js');
	
	return $warning_output;
}

?>