<?php

chdir('../../');

require_once ('pika_cms.php'); 
require_once ('pl_report.php');


$rep = new pikaReport;
$rep->setFormat(pl_grab_var('format', 'html'));


$pk = new pikaCms;


// run the report

$z = '';
//$conflicts = 0;
$case_id = pl_grab_var('case_id', 0);


pl_menu_get('case_status');

$pri = new plTable();
$names = new plTable();
$ssn = new plTable();

$columns = array('Issue', 'Case Number', 'Problem', 'Status');
$pri->assignLabels($columns);
$names->assignLabels($columns);
$ssn->assignLabels($columns);

$pri->sortable = FALSE;
$pri->show_pager = FALSE;
$names->sortable = FALSE;
$names->show_pager = FALSE;
$ssn->sortable = FALSE;
$ssn->show_pager = FALSE;

// This is necessary on every page view - example: client is added as opposing party in newer case
$case_row['poten_conflicts'] = $pk->resetConflictStatus($case_id);


// TODO - limit these listings to 10 each, provide link to entire list
$cons = $pk->fuzzyConflictCheck($case_id, 10000);

foreach ($cons as $val)
{
	$a = array();
	
	if ('ID' == $val['match'])
	{
		$a[] = "<strong><a href=\"../../contact.php?contact_id={$val['contact_id']}\">" . pl_format_name($val) . "</a></strong> was a(n) {$val['role']}";
	}
	
	else
	{
		$a[] = "<strong><a href=\"../../contact.php?contact_id={$val['contact_id']}\">" . pl_format_name($val) . "</a></strong> was a(n) {$val['role']}<br>\n
				DoB: <strong>{$val['birth_date']}</strong><br>\n
				SSN: <strong>{$val['ssn']}</strong><br>\n
				Address:  <strong>" . pl_format_address($val) . "</strong>";
	}
	
	if ($val['number'])
	{
		$a[] = "<a href=\"../../case.php?case_id={$val['case_id']}\">{$val['number']}</a>";
	}
	
	else
	{
		$a[] = "<a href=\"../../case.php?case_id={$val[case_id]}\">an un-numbered case</a>";
	}
	
	$a[] = $val['problem'];
	$a[] = $plMenus['case_status'][$val['status']];
	
	if ('ID' == $val['match'])
	{
		$pri->addRow($a);
	}
	
	else if ('NAME' == $val['match'])
	{
		$names->addRow($a);
	}
	
	else 
	{
		$ssn->addRow($a);
	}
	
	//$conflicts++;
}

if (sizeof($pri->rows) == 0)
{
	$pri->addRow(array('<i>none found</i>'));
}
$z .= "<h2>Primary Conflict Check</h2>\n";
$z .= $pri->draw();

if (sizeof($names->rows) == 0)
{
	$names->addRow(array('<i>none found</i>'));
}
$z .= "<br><h2>Name-based Conflict Check</h2>\n";
$z .= $names->draw();

if (sizeof($ssn->rows) == 0)
{
	$ssn->addRow(array('<i>none found</i>'));
}
$z .= "<br><h2>SSN-based Conflict Check</h2>\n";
$z .= $ssn->draw();




$plTemplate["content"] = $z;
$buffer = pl_template($plTemplate, 'templates/empty.html', 'yes');
$buffer .= pl_bench('results');

$rep->display($buffer);
	
exit();

?>
