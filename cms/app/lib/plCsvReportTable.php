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
		$this->header_contents = '';
		
		foreach ($a as $val){
			$this->header_contents .= $this->format_csv_cell($val);
		}
		$this->header_contents .= "\n";
	}

	public function add_row($a){
		foreach ($a as $val){
			$this->grid_contents .= $this->format_csv_cell($val);
		}
		
		$this->grid_contents .= "\n";
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
}

?>