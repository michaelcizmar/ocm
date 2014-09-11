<?php

require_once('lib/pl.php');

class plHtmlReportTable
{
	var $title;
	var $sql;
	var $grid_contents;
	var $header_contents;
	var $i;  // Counter for alternating row colors.
	var $row_count = 0;
	var $template_file = 'templates/pl_html_report.html';
	
	
	function plHtmlReportTable()
	{
		$this->title = 'A Report';
		$this->header_contents = '';
		$this->grid_contents = '';
		$this->sql = '';
	}

	function set_title($new_title)
	{
		$this->title = htmlentities($new_title);
	}
	
	function set_sql($new_sql)
	{
		$this->sql = htmlentities($new_sql);
	}

	function set_header($a)
	{
		$this->header_contents = '<tr bgcolor="#0000dd">';
		foreach ($a as $val)
		{
			$clean_val = $val;
			$this->header_contents .= "<th><font color=\"#ffffff\">{$clean_val}</font></th>";
		}
		$this->header_contents .= "</tr>\n";
	}

	function add_row($a)
	{
		if ($this->i)
		{
			$this->grid_contents .= '<tr class="GrayRow" bgcolor="#dddddd">';
			$this->i = false;
		}
		
		else 
		{
			$this->grid_contents .= '<tr>';
			$this->i = true;
		}
		
		foreach ($a as $val)
		{
			$clean_val = $val;
			
			if (strlen($clean_val) < 1)
			{
				$clean_val = '&nbsp;';
			}
			
			$this->grid_contents .= "<td>{$clean_val}</td>";
		}
		
		$this->grid_contents .= "</tr>\n";
		
		$this->row_count++;
	}

	function build()
	{
		$w = array();
		$w['table_title'] = $this->title;
		$w['table_header'] = $this->header_contents;
		$w['table_body'] = $this->grid_contents;
		$w['row_count'] = $this->row_count;

		if (strlen($this->sql) > 0)
		{
			$w['sql'] = "<p>SQL Query Used: <code>{$this->sql};</code>";
		}
		
		return pl_template($this->template_file, $w, 'full_table');
	}
}

?>