<?php

require_once('lib/plHtmlReportTable.php');

class plHtmlReport extends plHtmlReportTable 
{	
	function plHtmlReport()
	{
		$this->title = 'A Report';
		$this->header_contents = '';
		$this->grid_contents = '';
		$this->sql = '';
	}

	function display()
	{
		$w = array();
		$w['title'] = $this->title;
		$w['full_table'] = $this->build();
		
		echo pl_template('templates/pl_html_report.html', $w);
		exit();
	}
}

?>