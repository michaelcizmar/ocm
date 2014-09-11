<?php

require_once('pika-danio.php');
pika_init();

require_once('pikaMisc.php');

$case_id = pl_grab_get('case_id');
$number = pl_grab_get('number');
$main_html = array();  // Values for the main HTML template.
$content_t = array();
$extra_url = pl_simple_url();
$base_url = pl_settings_get('base_url');

$content_t = pikaMisc::htmlContactList('case_contact');

// Create a case number label.
if ($number)
{
	$num = $number;
}

else
{
	$num = 'This Case';
}

$main_html['content'] = pl_template('subtemplates/case_contact_list.html', $content_t);
$main_html['page_title'] = "Adding a Case Contact";
$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a> 
	&gt; <a href=\"{$base_url}/case_list.php\">Cases</a> 
	&gt; <a href=\"{$base_url}/case.php?case_id={$case_id}\">${num}</a> 
	&gt; Adding a Case Contact";


$buffer = pl_template('templates/default.html', $main_html);
pika_exit($buffer);

?>
