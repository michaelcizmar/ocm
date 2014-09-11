<?php

define('PIKA_NO_COMPRESSION', 1);

// AMW 2004-01-02
// See http://php3.de/manual/en/function.session-cache-limiter.php
$pikaAllowCaching = true;

require_once ('pika_cms.php');

unset($C);
unset($a);

$pk = new pikaCms;

$report = '';
$C = '';
$plMenus['output_format'] = array('pdf' => 'PDF', 'html' => 'HTML');

/*
$url_parts = explode('/', $REQUEST_URI);
$url_parts = array_reverse($url_parts);
$report = $url_parts[1];
*/

if (isset($_GET['report']))
{
	$report = pl_clean_path_chars($_GET['report']);
}


if (!$report)
{
	$C .= "<p>Available reports:</p>";
	/*
	$C .= '<ul>';
	
	// TODO - get rid of this
	$pikaAvailableReports = pika_report_list();
	
	while (list($key, $val) = each($pikaAvailableReports))
	{
		$C .= "<li><a href='report.php?report=$val'>$val</a>\n";
	}
	
	$C .= "</ul>\n";
	*/
	$C .= pika_html_report_list();
	$report_title = "All Reports";
}

else
{
	$case_print_path = getcwd() . "-custom/extensions/case_print/case_print-form.php";
	if (file_exists($case_print_path))
	{
		include($case_print_path);
	}
	
	else if (file_exists("reports/{$report}/{$report}-form.php"))
	{
		include("reports/{$report}/{$report}-form.php");
	}

	else
	{
		die(pika_error_notice('Pika is sick', "Can't find the file 'reports/{$report}/{$report}-form.php'"));
	}
}

$plTemplate["content"] = $C;
$plTemplate["page_title"] = $report_title;
$plTemplate['nav'] = "<a href=\".\" class=light>$pikaNavRootLabel</a> &gt; <a href=\"reports/\" class=light>Reports</a> &gt; $report_title";

echo pl_template($plTemplate, 'templates/default.html');
echo pl_bench('results');
exit();

?>
