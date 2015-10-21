<?php

require_once('plHtmlReportTable.php');

/**
* plCsvReportTable - creates an individual HTML table in a report
* works with plCsvReport and plHtmlReportTable as part of a collection of 
* tables stored in an array - stored in the plCsvReport $tables array.
*
* @author Aaron Worley <amworley@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
class plCsvReportTable extends plHtmlReportTable 
{
	public function __construct(){
		$this->title = '';
		$this->header_contents = '';
		$this->grid_contents = '';
	}
	
	public function set_header($a){
		$this->header_contents = $this->format_csv_row($a);
	}

	public function add_row($a){
		$this->grid_contents .= $this->format_csv_row($a);
	}

	
	public function build(){
		$buffer = '';
		$buffer .= $this->format_csv_cell($this->title) . "\n";
		$buffer .= $this->header_contents . $this->grid_contents;
		
		return $buffer;
	}
	
	public function format_csv_cell($str){
		return '"' . addslashes($str) . '",';
	}
	
	private function format_csv_row($row = array()) 
	{
		$handle = fopen('php://memory', 'w');
		fputcsv($handle, $row);
		fseek($handle, 0);
		return stream_get_contents($handle);
	}
}

?>