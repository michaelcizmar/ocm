<?php

$C .= "<h1>Outcomes Tracking</h1>\n";

if (strlen($case_row['problem']) < 1)
{
	$C .= "<div>Please assign a Problem Code to this case before recording outcomes.</div>\n";
	//$C .= pikaTempLib::plugin('lsc_problem','problem',$case_row,null,array('onchange=problem_code_lookup(this.value)'));
}

else
{
	// AMW - I think there are some single digit problem codes floating around.
	// This is a workaround for them.
	$problem_code = str_pad($case_row['problem'], 2, "0", STR_PAD_LEFT);
	$problem_category = substr($problem_code, 0, 1) . 'X';
	$problem_code = mysql_real_escape_string($problem_code);
	$problem_category = mysql_real_escape_string($problem_category);
	$sql = "SELECT goal, result, outcome_definition_id FROM
		outcome_goals LEFT JOIN outcomes USING(outcome_definition_id)
		WHERE (case_id={$case_row['case_id']} OR case_id IS NULL) 
		AND outcome_problem IN ('{$problem_category}X', '{$problem_code}')
		ORDER BY outcome_problem DESC, outcome_goal_order ASC";
	$sql = "select a.outcome_goal_id, a.goal, b.result 
			from outcome_goals AS a
			LEFT JOIN outcomes AS b USING (outcome_goal_id)
			where problem in ('{$problem_category}', '{$problem_code}') AND case_id = {$case_row['case_id']} 
			order by problem DESC, outcome_goal_order ASC";
	$result = mysql_query($sql) or trigger_error(mysql_error($result));

	if (mysql_num_rows($result) == 0)
	{
		$sql = "select a.outcome_goal_id, a.goal, 2 AS result 
				from outcome_goals AS a
				where problem in ('{$problem_category}', '{$problem_code}') 
				order by problem DESC, outcome_goal_order ASC";
		$result = mysql_query($sql) or trigger_error(mysql_error($result));		
	}
	
	
	$C .= "<form action=\"{$base_url}/ops/update_case.php\" method=\"POST\">";
	$C .= "<table class=\"table table-striped\">\n";
	$i = 0;
	
	while ($row = mysql_fetch_assoc($result))
	{
		switch ($row['result'])
		{
			case 1:
			$yes_checked = " checked";
			$no_checked = "";
			$na_checked = "";
			break;
			
			case 0:
			$yes_checked = "";
			$no_checked = " checked";
			$na_checked = "";
			break;
			
			case 2:
			default:
			$yes_checked = "";
			$no_checked = "";
			$na_checked = " checked";
			break;			
		}
		
		
		$C .= "<tr>\n";
		$C .= "<td>
		<label class=\"radio inline\">
		<input type=\"radio\" name=\"outcomes[{$row['outcome_goal_id']}]\" id=\"optionsRadios{$i}\" value=\"1\"{$yes_checked}>
		Yes</label>
		<label class=\"radio inline\">
		<input type=\"radio\" name=\"outcomes[{$row['outcome_goal_id']}]\" id=\"optionsRadios{$i}\" value=\"0\"{$no_checked}>
		No</label>
		<label class=\"radio inline\">
		<input type=\"radio\" name=\"outcomes[{$row['outcome_goal_id']}]\" id=\"optionsRadios{$i}\" value=\"2\"{$na_checked}>
		N/A</label>
		</td>\n";
		$C .= "<td>{$row['goal']}</td>\n";
		$C .= "</tr>\n";
		$i++;
	}
	
	if ($i == 0)
	{
		$C .= "<tr>\n";
		$C .= "<td colspan=\"2\">No goals exist for problem code {$problem_code}. 
				<a href=\"{$base_url}/system-outcomes.php\">Add some here.</a></td>\n";
		$C .= "</tr>\n";
		
	}
	
		$C .= "<tr>\n";
		$C .= "<td><textarea rows=\"5\" class=\"span3\" name=\"outcome_notes\" tabindex=\"1\">{$case_row['outcome_notes']}</textarea></td>\n";
		$C .= "<td>What other significant outcome?</td>\n";
		$C .= "</tr>\n";

	$C .= "</table>\n";
	
	$C .= "<table class=\"table table-striped\">\n";
	$C .= "<tr><td colspan=\"2\">If income was an issue, answer these two questions</td></tr>\n";

	function draw_outcome_row($label, $column)
	{
		global $case_row;
		$C = '';
		$C .= "<tr>\n";
		$C .= "<td>{$label}</td>
		<td><div class=\"input-prepend input-append\">
		<span class=\"add-on\">$</span>
		<input class=\"span2\" id=\"{$column}\" name=\"{$column}\" value=\"{$case_row[$column]}\" type=\"text\" tabindex=\"1\">
		</div></td>\n";
		$C .= "</tr>\n";
		return $C;		
	}
	
	$C .= draw_outcome_row('Actual monthly income at the time the case was closed.', 'outcome_income_before');
	$C .= draw_outcome_row('If Legal Aid had not been involved, what would current monthly income be at the time case was closed?', 'outcome_income_after');

	$C .= "</table>\n";
	

	$C .= "<table class=\"table table-striped\">\n";
	$C .= "<tr><td colspan=\"2\">If assets were an issue, answer these two questions</td></tr>\n";

	$C .= draw_outcome_row('Actual value of assets at the time the case was closed.', 'outcome_assets_before');
	$C .= draw_outcome_row('If Legal Aid had not been involved, what would the value of assets be at the time case was closed?', 'outcome_assets_after');

	$C .= "</table>\n";


	$C .= "<table class=\"table table-striped\">\n";
	$C .= "<tr><td colspan=\"2\">If debt was an issue, answer these two questions</td></tr>\n";

	$C .= draw_outcome_row('If debt was an issue, answer these two questions', 'outcome_debt_before');
	$C .= draw_outcome_row('If Legal Aid had not been involved, what would the amount of debt be at the time case was closed?', 'outcome_debt_after');

	$C .= "</table>\n";
	$C .= "<input type=\"hidden\" name=\"case_id\" value=\"{$case_row['case_id']}\">\n";
	$C .= "<input type=\"hidden\" name=\"screen\" value=\"outcomes\">\n";
	$C .= "<input type=\"submit\" value=\"Save\" tabindex=\"1\" class=\"save\" accesskey=\"s\"></form>\n";
}

?>
