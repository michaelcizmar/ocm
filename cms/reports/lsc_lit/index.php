<?php
// 08-05-2011 - caw - modified to run under v5
chdir('../../');

require_once('pika-danio.php'); 
pika_init();
require_once('pikaTempLib.php');

$report_title = 'LSC Litigation Report';
$report_name = "lsc_lit";

$base_url = pl_settings_get('base_url');
if(!pika_report_authorize($report_name)) {
	$main_html = array();
	$main_html['base_url'] = $base_url;
	$main_html['page_title'] = $report_title;
	$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a>
    				  &gt; <a href=\"{$base_url}/reports/\">Reports</a> 
    				  &gt; $report_title";
	$main_html['content'] = "You are not authorized to run this report";

	$default_template = new pikaTempLib('templates/default.html', $main_html);
	$buffer = $default_template->draw();
	pika_exit($buffer);
}


$a = array();
$a['report_name'] = $report_name;

$a['filed_date_begin'] = '1/1/Y';
$a['filed_date_end'] = '12/31/Y';

$a['show_protected'] = 1;
$a['program_filed'] = 1;

$main_html = array();
$main_html['base_url'] = $base_url;
$main_html['page_title'] = $report_title;
$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a>
      &gt; <a href=\"{$base_url}/reports/\">Reports</a> &gt; $report_title";
$template = new pikaTempLib("reports/{$report_name}/form.html", $a);
$template->addMenu('show_protected', array(1 => 'Show All', 2 => 'Show Only Unprotected', 3 => 'Show Only Protected'));
$template->addMenu('program_filed', array(1 => 'Show All', 2 => 'Show Program Filed', 3 => 'Show Not Program Filed'));
$template->addMenu('user_id',pikaUser::getUserArray());

$main_html['content'] = $template->draw();

$default_template = new pikaTempLib('templates/default.html', $main_html);
$buffer = $default_template->draw();
pika_exit($buffer);

?>
