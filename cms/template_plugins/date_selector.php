<?php

/**
* date_selector - draws calendar table 
*
* @var $field_name = Name of form field to populate with value
* @var $field_value = Current date stored in form field
* @var $container - The id of the DOMElement that will display the calendar (for js links)
* @param month = Display this month <default blank> - assumes current month if $field_value is blank
* @param year = Display this year <default blank> - assumes current year if $field_value is blank
* @author Matthew Friedlander <matt@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
function date_selector($field_name = null, $field_value = null, $container = null, $args = null)
{
	
	if(strlen($field_value) < 1 || strtotime($field_value) === false) {
		$field_value = date('n/d/Y');
	}if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		'month' => '',
		'year' => ''
	);
	
	// Allow arg override
	
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	$date_selector = '';
	
	$ts = strtotime($field_value);
	$month = date('n',$ts);
	$year = date('Y',$ts);
	
	
	
	// Determine display month/year
	$display_month = $temp_args['month'];
	if(!$display_month || !is_numeric($display_month)) {
		$display_month = $month;
	} 
	
	$display_year = $temp_args['year'];
	if(!$display_year || !is_numeric($display_year)) {
		$display_year = $year;
	}
	$first_day_of_month = $display_month."/1/".$display_year;
	$num_days_in_month = date('t',strtotime($first_day_of_month));
	$first_day_of_week = date('w',strtotime($first_day_of_month));
	$display_month_name = date('M',strtotime($first_day_of_month));
	
	
	// Draw calendar
	
	$date_selector .= "<table cellspacing=\"0\" cellpadding=\"2\"><tr class='DSCalHeader'>";
	// Generate previous month link
	$display_prev_month = $display_month;
	$display_prev_year = $display_year;
	if($display_month == 1) {
		$display_prev_month = 12;
		$display_prev_year = $display_year - 1;
	} else {
		$display_prev_month = $display_month - 1;
	}
	// Generate next month link
	$display_next_month = $display_month;
	$display_next_year = $display_year;
	if($display_month == 12) {
		$display_next_month = 1;
		$display_next_year = $display_year + 1;
	} else {
		$display_next_month = $display_month + 1;
	}
	$date_selector .= "<td><a onclick=\"date_selector('{$field_name}','{$container}','{$display_prev_month}','{$display_prev_year}');\">&lt;&lt;</a></td>";
	$date_selector .= "<td colspan='5' align='center'>". $display_month_name . " " . $display_year ."</td>";
	$date_selector .= "<td><a onclick=\"date_selector('{$field_name}','{$container}','{$display_next_month}','{$display_next_year}');\">&gt;&gt;</a></td>";
	$date_selector .= "</tr>";
	$date_selector .= "<tr class='DSCalDaysOfWeek'><td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>";
	
	$first_week = true;
	$current_week = $current_day = 1;
	while($current_day <= $num_days_in_month) {
		$date_selector .= "<tr class=\"DSCalWeek\">";
		for($day=0;$day<7;$day++) {
			// Determine if current day is equal to $field_value 
			$current_full_date = $display_month . "/" . $current_day . "/" . $display_year;
			$current_full_date_display = pikaTempLib::plugin('text_date','',$current_full_date);
			$selected_class = '';
			if($ts == strtotime($current_full_date) && $day == date('w',strtotime($current_full_date))) {
				$selected_class = 'DSCalSelectedDate';
			}
			$date_selector .= "<td class=\"{$selected_class}\">";
			if($first_week && $day == $first_day_of_week) {$first_week = false;} 
			if(!$first_week && $current_day <= $num_days_in_month) {
				$date_selector .= "<a onclick=\"selectDate('{$field_name}','{$current_full_date_display}','{$container}');\">";
				$date_selector .= $current_day; 
				$date_selector .= "</a>";
				$current_day++;
			}
			$date_selector .= "</td>";
		}
		$date_selector .= "</tr>";
		$current_week++;
	}
	
	$date_selector .= "<tr class=\"DSCalFooter\"><td colspan=\"7\"><a onclick=\"closeCalendar('{$container}');\">Close [X]</a></td></tr></table>";
	
	return $date_selector;
	
}



