<?php


/**
* plHtmlReportTable - creates an individual HTML table in a report
* works with plHtmlReport as part of a collection of tables stored in
* an array - stored in the plHtmlReport $tables array.
*
* @author Aaron Worley <amworley@pikasoftware.com>;
* @version 1.0
* @package Danio
* 
*/
class plHtmlReportTable
{
	public $title;
	public $sql;
	public $grid_contents;
	public $header_contents;
	public $i;  // Counter for alternating row colors.
	public $row_count = 0;
	public $row_count_display = true;
	public $template_file = 'templates/pl_html_report.html';
	
	
	public function __construct(){
		$this->header_contents = '';
		$this->grid_contents = '';
		$this->sql = '';
	}

	public function set_title($new_title){
		$this->title = htmlentities($new_title);
	}
	
	public function set_sql($new_sql){
		$this->sql = htmlentities($new_sql);
	}

	public function set_header($a){
		$this->header_contents = '<tr>';
		
		foreach ($a as $val){
			$clean_val = $val;
			$this->header_contents .= "<th nowrap>{$clean_val}</th>";
		}
		$this->header_contents .= "</tr>\n";
	}
	
	public function display_row_count($value) {
		if($value) {
			$this->row_count_display = true;
		} else {
			$this->row_count_display = false;
		}
	}

	public function add_row($a){
		if ($this->i){
			$this->grid_contents .= '<tr class="GrayRow" bgcolor="#dddddd">';
			$this->i = false;
		} else {
			$this->grid_contents .= '<tr>';
			$this->i = true;
		}
		
		foreach ($a as $val) {
			$clean_val = $val;
			
			if (strlen($clean_val) < 1){
				$clean_val = '&nbsp;';
			}
			
			$this->grid_contents .= "<td>{$clean_val}</td>";
		}
		
		$this->grid_contents .= "</tr>\n";
		$this->row_count++;
	}

	public function build() {
		$w = array();
		$w['table_title'] = $this->title;
		$w['table_header'] = $this->header_contents;
		$w['table_body'] = $this->grid_contents;
		if($this->row_count_display) {
			$w['row_count'] = "<p>Number of rows: <em>". $this->row_count ."</em>";
		}

		if (strlen($this->sql) > 0) {
			$w['sql'] = "<p>SQL Query Used: <code>{$this->sql};</code>";
		}
		
		return pl_template($this->template_file, $w, 'full_table');
	}
}

?>