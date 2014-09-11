<?php

require_once('plHtmlReportTable.php');

/**
* plHtmlReport - Creates an HTML report display containing one or more instances
* of plHtmlReportTable.  Creates first table automatically - for legacy support.
*
* @author Aaron Worley <amworley@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
class plHtmlReport 
{	
	public $tables = array();
	public $current_table_index;
	public $title = '';
	public $parameters = array();
	public $report_footer = '';
	
	
	public function __construct()
	{
		$this->title = 'A Report';
		// 2013-08-13 AMW - Removed =& for compatibility with PHP 5.3.
		$this->tables[] = new plHtmlReportTable();
		$this->current_table_index = '0';
	}
	
	public function add_table() {
		// 2013-08-13 AMW - Removed =& for compatibility with PHP 5.3.
		$this->tables[] = new plHtmlReportTable();
		$this->current_table_index += 1;
	}
	
	public function add_row($a = array()) {
		$this->tables[$this->current_table_index]->add_row($a);
	}
	
	public function add_parameter($name,$parameter) {
		$parameters = $this->parameters;
		$parameters[] = array('name'=>$name,'param'=>$parameter);
		$this->parameters = $parameters;
	}
	
	public function set_sql($sql) {
		$this->tables[$this->current_table_index]->set_sql($sql);
	}
	
	public function set_header($a = array()) {
		$this->tables[$this->current_table_index]->set_header($a);
	}
	
	public function set_footer($footer = '') {
		$this->report_footer = $footer;
	}
	
	public function set_title($title) {
		$this->title = htmlentities($title);
	}
	
	public function set_table_title($title) {
		$this->tables[$this->current_table_index]->set_title($title);
	}
	
	public function display_row_count($value) {
		$this->tables[$this->current_table_index]->display_row_count($value);
	}

	public function display()
	{
		$w = array();
		$w['title'] = $this->title;
		$w['parameters'] = '';
		foreach ($this->parameters as $parameter) {
			if(isset($parameter['name']) && $parameter['name']) {
				$w['parameters'] .= "<strong>" .  $parameter['name'] . ":</strong>";	
			}
			if(isset($parameter['param']) && $parameter['param']) {
				$w['parameters'] .= " " .  $parameter['param'] . "<br/>\n";	
			}
		}
		$w['report_footer'] = $this->report_footer;
		$w['full_table'] = '';
		for ($i=0;$i<count($this->tables);$i++) {
			$w['full_table'] .= $this->tables[$i]->build(); 	
		}
		
		echo pl_template('templates/pl_html_report.html', $w);
		exit();
	}
}

?>