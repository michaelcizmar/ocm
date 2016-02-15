<?php

/************************************/
/* Pika CMS (C) 2008 Aaron Worley   */
/* http://pikasoftware.com          */
/************************************/

require_once('pika-danio.php');
pika_init();

require_once('pikaTempLib.php');
require_once('plFlexList.php');
require_once('pikaCounter.php');


$action = pl_grab_post('action');
$base_url = pl_settings_get('base_url');

$main_html = array();
$main_html['content'] = '';

if (!pika_authorize("system", array()))
{
	$temp["content"] = "Access denied";
	$temp["nav"] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"site_map.php\">Site Map</a> &gt;
					 System Maintenance";

	$default_template = new pikaTempLib('templates/default.html',$temp);
	$buffer = $default_template->draw();
	pika_exit($buffer);
}

switch ($action) {
	case 'calc_age':
		set_time_limit(0);
		$start_time = time();
		$sql = "SELECT case_id, birth_date, open_date
			FROM contacts 
			LEFT JOIN cases ON cases.client_id = contacts.contact_id
			WHERE 1 
			AND birth_date IS NOT NULL 
			AND birth_date <> '0000-00-00'
			AND open_date IS NOT NULL
			AND open_date <> '0000-00-00'
			AND client_age IS NULL";
		//$sql .= " LIMIT 1000";
		$result = mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
		$a['num_found'] = mysql_num_rows($result);
		$a['num_updated'] = 0;
		while($row = mysql_fetch_assoc($result)) {
			if(function_exists('date_parse')) {
				$dob_array = date_parse($row['birth_date']);
			} else {
				$dob_array = getdate(strtotime($row['birth_date']));
				$dob_array['month'] = $dob_array['mon'];
				$dob_array['day'] = $dob_array['mday'];
			}
			if(function_exists('date_parse')) {
				$open_array = date_parse($row['open_date']);
			} else {
				$open_array = getdate(strtotime($row['open_date']));
				$open_array['month'] = $open_array['mon'];
				$open_array['day'] = $open_array['mday'];
			}

			$years = $open_array['year'] - $dob_array['year'];
			if($years > 0) {
				if($dob_array['month'] > $open_array['month']) {$years = $years - 1;}
				elseif ($dob_array['month'] == $open_array['month'] && $dob_array['day'] > $open_array['day']) {
					$years = $years - 1;
				}
			}
			$sql = "UPDATE LOW_PRIORITY cases
					SET client_age = '{$years}' 
					WHERE 1
					AND case_id = '{$row['case_id']}'
					LIMIT 1;";
			mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
			$a['num_updated']++;
		}
		$a['duration'] = time() - $start_time;
		$template = new pikaTempLib('subtemplates/system-maint.html',$a,'calc_age');
		$main_html['content'] .= $template->draw();
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
					 <a href=\"{$base_url}/system-maint.php\">System Maintenance</a> &gt;
					 Calculate Age";
		break;
	case 'metaphone':
		set_time_limit(0);
		$start_time = time();
		$sql = "SELECT alias_id, last_name, first_name
				FROM aliases 
				WHERE 1
				AND mp_first IS NULL 
				AND mp_last IS NULL 
				ORDER BY alias_id;";
		$result = mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
		$a['num_found'] = mysql_num_rows($result);
		$a['num_updated'] = 0;
		while ($row = mysql_fetch_assoc($result)) {
			$alias_id = $row['alias_id'];
			$mp_first = '';
			if(strlen($row['first_name']) > 0) {
				$first_arr = explode(" ", $row['first_name']);
				$mp_first = metaphone($first_arr[0]);
			}
			$mp_last = metaphone($row['last_name']);
			$sql = "UPDATE LOW_PRIORITY aliases
					SET mp_first='$mp_first', mp_last='$mp_last' 
					WHERE 1
					AND alias_id='$alias_id' 
					AND mp_first IS NULL 
					AND mp_last IS NULL 
					LIMIT 1;";
			mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
			$a['num_updated']++;
		}
		$sql = "SELECT contact_id, last_name, first_name
				FROM contacts 
				WHERE 1
				AND mp_first IS NULL 
				AND mp_last IS NULL 
				ORDER BY contact_id;";
		$result = mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
		$a['num_found'] += mysql_num_rows($result);
		while ($row = mysql_fetch_assoc($result)){
			$contact_id = $row['contact_id'];
			$mp_first = '';
			if(strlen($row['first_name']) > 0) {
				$first_arr = explode(" ", $row['first_name']);
				$mp_first = metaphone($first_arr[0]);
			}
			$mp_last=metaphone($row['last_name']);
			$sql = "UPDATE LOW_PRIORITY contacts
					SET mp_first='$mp_first', mp_last='$mp_last' 
					WHERE 1
					AND contact_id='$contact_id' 
					AND mp_first IS NULL 
					AND mp_last IS NULL 
					LIMIT 1;";
			mysql_query($sql) or trigger_error("SQL: " . $sql . " ERROR: " . mysql_error());
			$a['num_updated']++;
		}
		$a['duration'] = time() - $start_time;
		$template = new pikaTempLib('subtemplates/system-maint.html',$a,'metaphone');
		$main_html['content'] .= $template->draw();
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
					 <a href=\"{$base_url}/system-maint.php\">System Maintenance</a> &gt;
					 Populate Metaphone";
		break;
		
	case 'ssn_truncate':
		set_time_limit(0);
		$result = mysql_query("UPDATE contacts SET ssn = RIGHT(ssn, 4)") or trigger_error(mysql_error());
		$result = mysql_query("ALTER TABLE contacts MODIFY ssn CHAR(4)") or trigger_error(mysql_error());
		$result = mysql_query("UPDATE aliases SET ssn = RIGHT(ssn, 4)") or trigger_error(mysql_error());
		$result = mysql_query("ALTER TABLE aliases MODIFY ssn CHAR(4)") or trigger_error(mysql_error());
		$main_html['content'] .= 'SSNs have been truncated to the last 4 digits.';
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
					 <a href=\"{$base_url}/system-maint.php\">System Maintenance</a> &gt;
					 Populate Metaphone";
		break;
		
	case 'ssn_remove':
		set_time_limit(0);
		$result = mysql_query("UPDATE contacts SET ssn = NULL") or trigger_error(mysql_error());
		$result = mysql_query("ALTER TABLE contacts MODIFY ssn enum('deactivated')") or trigger_error(mysql_error());
		$result = mysql_query("UPDATE aliases SET ssn = NULL") or trigger_error(mysql_error());
		$result = mysql_query("ALTER TABLE aliases MODIFY ssn enum('deactivated')") or trigger_error(mysql_error());
		$main_html['content'] .= 'SSNs have been removed from the data.';
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
					 <a href=\"{$base_url}/system-maint.php\">System Maintenance</a> &gt;
					 Populate Metaphone";
		break;
		
	default:
		$size_of_ssn = '';
		$result = mysql_query("DESCRIBE contacts") or trigger_error(mysql_error());
		
		while ($row = mysql_fetch_assoc($result))
		{
			if ($row['Field'] == 'ssn')
			{
				$size_of_ssn = $row['Type'];
			}
		}
		
		$template = new pikaTempLib('subtemplates/system-maint.html',array());
		$main_html['content'] .= $template->draw();
		
		/*
		$disabled = '';
		$not_available = '';
		
		if ($size_of_ssn != 'varchar(11)')
		{
			$disabled = ' disabled';
			$not_available = '<p>The SSN Truncate function is not available because this database does not have a full length, 11-character SSN field.</p>';
		}
		
		$main_html['content'] .= '<form action="' . $base_url . '/system-maint.php" method="POST">
		<h2>Truncate SSNs</h2>';
		$main_html['content'] .= $not_available . 
		'<input type="submit" name="submit" value="Truncate SSNs" onclick="if ( confirm(\'Are you sure you want to shorten all SSNs to the last four digits?  This operation can not be undone.\')) { return confirm(\'Click OK to truncate all SSNs.\'); } else {return false;}"';
		$main_html['content'] .= $disabled . '>
		<input type="hidden" name="action" value="ssn_truncate">
		</form>';
		*/

		$disabled = '';
		$not_available = '';
		
		if ($size_of_ssn == 'enum(\'deactivated\')')
		{
			$disabled = ' disabled';
			$not_available = '<p>The SSN Delete function is not available because the SSNs in this database have already been deleted.</p>';
		}

		$main_html['content'] .= '<form action="' . $base_url . '/system-maint.php" method="POST">
		<h2>Remove SSNs</h2>';
		$main_html['content'] .= $not_available . 
		'<input type="submit" name="submit" value="Remove SSNs" onclick="if ( confirm(\'Are you sure you want to remove all SSNs?  This operation can not be undone.\')) { return confirm(\'Click OK to delete all SSNs.\'); } else {return false;}"';
		$main_html['content'] .= $disabled . '>
		<input type="hidden" name="action" value="ssn_remove">
		</form>';
		
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
					 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
					 System Maintenance";

		break;

}






// Display a screen
$main_html['page_title'] = "System Maintenance";

$default_template = new pikaTempLib('templates/default.html',$main_html);
$buffer = $default_template->draw();

pika_exit($buffer);

?>
