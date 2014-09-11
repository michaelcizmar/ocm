<?php

// RED FLAGS
$warnings = '';
require_once('pikaFlags.php');
require_once('pikaTempLib.php');
$flags = pikaFlags::generateFlags($case_row['case_id']);
foreach ($flags as $key => $flag) {
	$warnings .= pikaTempLib::plugin('red_flag',$key,$flag['description']);
}


// LANM JS warnings
/*
function js_warning($str)
{
	$clean_str = addslashes($str);
	return "alert('{$clean_str}');\n";
}

if ('2' == $case_row['status']) 
{
	$warnings .= "<script type=\"text/javascript\" language=\"JavaScript\">\n<!--\n";

	if (!$case_row['problem'])
	{
		$warnings .= js_warning('LSC Problem Code is Blank');
	}
	
	$warnings .= "//-->\n</script>\n";
}
*/

?>
