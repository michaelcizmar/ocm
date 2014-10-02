<?php

require_once('pika-danio.php');
pika_init();

$main_html = array();  // Values for the main HTML template.
//$extra_url = pl_simple_url();
$base_url = pl_settings_get('base_url');
$order = pl_grab_get('order', 'ASC');
$order_field = pl_grab_get('order_field', 'intake_id');
$first_row = pl_grab_get('first_row', '0', 'intake_id');
$offset = pl_grab_get('offset', '0', 'intake_id');
$page_size = $_SESSION['paging'];
$row_count = null;
$intake_id = pl_grab_get('intake_id', 0);
$step = pl_grab_get('step', 'step1');

if ($intake_id == 0)
{
	require_once('pikaMisc.php');
	require_once('plFlexList.php');
	
	// begin INTAKE LIST
	
	pl_menu_set_temp('user_id', pikaMisc::fetchStaffArray());
	
	$cases_table = new plFlexList();
	$cases_table->template_file = 'extensions/lsnc_intake/intake_list.html';
	$cases_table->column_names = array('intake_id', 'client_name' , 'intake_user_id', 'office');
	$cases_table->table_url = "{$base_url}/intake_list.php/";
	$cases_table->order_field = $order_field;
	$cases_table->order = $order;
	$cases_table->records_per_page = $page_size;
	$cases_table->page_offset = $offset;




	
	$i = 1;
	$result = pikaMisc::getIntakes();
	while ($row = mysql_fetch_assoc($result))
	{
		$row['row_class'] = $i;
		if ($i > 1)
		{
			$i = 1;
		}
		else 
		{
			$i++;
		}
	
		$row['client_name'] = pl_text_last_name($row, 'contacts.');
		$cases_table->addRow($row);
	}
	
	$t_array['flex_header'] = $cases_table->draw();
	
	$main_html['page_title'] = 'Incomplete Intake List';
	$main_html['content'] = pl_template('extensions/lsnc_intake/intake_list.html', $t_array);
	$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a> | <a href=\"{$base_url}/intakes.php/\">Incomplete Intakes</a> | Current Intake List";
}

else
{
	require_once('pikaIntake.php');
	// begin CASE SCREEN
	
	$case = new pikaIntake($intake_id);
	$clean_case_screen = $case->getValues();
	$template_file = 'extensions/lsnc_intake/intake_step2.html';
	
	if (is_numeric($case->client_id))
	{
		require_once('pikaContact.php');
		$primary_client = new pikaContact($case->client_id);
		//var_dump($primary_client->getValues());
		$clean_case_screen = array_merge($clean_case_screen, $primary_client->getValues());
		
		$clean_case_screen['client_name'] = pl_text_name($clean_case_screen);
		$clean_case_screen['client_phone'] = pl_text_phone($clean_case_screen);
		$clean_case_screen['birth_date'] = pl_date_unmogrify($clean_case_screen['birth_date']);
	}
	
	if ($step == 'step1') 
	{
		$template_file = 'extensions/lsnc_intake/intake_step1.html';
	}
	
	if ($step == 'step1b') 
	{
		$template_file = 'extensions/lsnc_intake/intake_step1b.html';
	}
		
	$clean_case_screen = pl_clean_html_array($clean_case_screen);
	$clean_case_screen['client_address'] = pl_html_address($clean_case_screen);
	
	$main_html['page_title'] = "Incomplete Intake #{$clean_case_screen['intake_id']}";
	$main_html['content'] = pl_template($template_file, $clean_case_screen);
	$main_html['nav'] = "<a href=\"{$base_url}/\">Pika Home</a> | <a href=\"{$base_url}/pm.php/lsnc_intake/intakes.php\">Incomplete Intakes</a> | {$clean_case_screen['intake_id']}";
}

$buffer = pl_template('templates/default.html', $main_html);
pika_exit($buffer);

?>
