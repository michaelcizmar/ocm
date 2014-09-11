<?php

chdir('../');

require_once('pika-danio.php');
pika_init();

require_once('pikaMisc.php');

$base_url = pl_settings_get('base_url');
$C = '';
$C .= "<p>Available reports:</p>";
$C .= pikaMisc::htmlReportList();

$main_html['page_title'] = "Reports";
$main_html['content'] = $C;
$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a> &gt; <a href=\"{$base_url}/reports/\">Reports</a> &gt; Report Listing";

$buffer = pl_template($main_html, 'templates/default.html');
pika_exit($buffer);

?>
