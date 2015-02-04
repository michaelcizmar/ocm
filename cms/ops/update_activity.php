<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/
// 2012 point release update appending url so user will return to case listing instead of case when updating case related activity from case listing

chdir('../');

require_once ('pika-danio.php');
pika_init();

require_once('pikaActivity.php');

// VARIABLES
$base_url = pl_settings_get('base_url');
$act_interval = pl_settings_get('act_interval');

$act_id = pl_grab_post('act_id');
$act_date = pl_grab_post('act_date', date('Y-m-d'));
$act_url = pl_grab_post('act_url');
$act_type = pl_grab_post('act_type', 'C');
$funding = pl_grab_post('funding');
$case_id = pl_grab_post('case_id');
$user_id = pl_grab_post('user_id');
$pba_id = pl_grab_post('pba_id');

$next_act = pl_grab_post('next_act');
$close_act = pl_grab_post('close_act');
$cancel = pl_grab_post('cancel');

$a = pl_clean_form_input($_POST);


// BEGIN MAIN CODE...

// AMW 2013-05-03 - $act_url is getting set to "case.php" in some cases, which causes a error due to the missing case_id.  This is 
// an ugly workaround for that.  Future TODO: fix the code that sets $act_url in activity.php
/*
if ("case.php" == $act_url)
{
	$act_url = "index.php";
}
*/


// The user is saving the activity record.
if($act_id && is_numeric($act_id)) {
	$activity = new pikaActivity($act_id);
	$act_row = $activity->getValues();
	if (pika_authorize('edit_act', $act_row)) 
	{	
		$activity->setValues($a);
		$activity->hours = pikaActivity::roundHoursByInterval($activity->hours,$act_interval);
		$activity->save();
	}
} else if (!$cancel) {
	$activity = new pikaActivity();
	unset($a['act_id']);
	$activity->setValues($a);
	$activity->hours = pikaActivity::roundHoursByInterval($activity->hours,$act_interval);
	
	if ($activity->act_type == 'K' && file_exists(getcwd() . '-custom/extensions/create_tickler/create_tickler.php'))
	{
		require_once(getcwd() . '-custom/extensions/create_tickler/create_tickler.php');
		create_tickler($activity->getValues()) or trigger_error('Extension failed.');
	}
	
	$activity->save();
}

// 2012 point release update appending url so user will return to case listing instead of case when updating case related activity from case listing 
/* if ($next_act) {
	header("Location: {$base_url}/activity.php?act_type={$act_type}&act_date={$act_date}&case_id={$case_id}&funding={$funding}&user_id={$user_id}&pba_id={$pba_id}&act_url={$act_url}");
} else if ($close_act){
	if ($case_id && is_numeric($case_id)) {
		header("Location: {$base_url}/case.php?case_id={$a['case_id']}");
	} else {
		if($act_url == 'case.php') { $act_url = 'cal_day.php';}
		header("Location: {$base_url}/{$act_url}?cal_date={$act_date}");
	}
} else {
	if ($case_id && is_numeric($case_id)) {
		header("Location: {$base_url}/case.php?case_id={$case_id}");
	} else {
		header("Location: {$base_url}/cal_day.php?cal_date={$act_date}");
	}
}
*/

if ($next_act) 
{
	header("Location: {$base_url}/activity.php?act_type={$act_type}&act_date={$act_date}&case_id={$case_id}&funding={$funding}&user_id={$user_id}&pba_id={$pba_id}&act_url={$act_url}");
} 

else if ($close_act)
{
	if ($case_id && is_numeric($case_id) && strpos($act_url,'case.php') !== false) 
	{
		if (strpos($act_url,'case_id') !== false)
		{	
			header("Location: {$base_url}/{$act_url}");	
		}
		
		else 
		{
			header("Location: {$base_url}/case.php?case_id={$case_id}");
		}
	}
	
	else if(preg_match('/cal_(day|week|adv).php$/',$act_url)) 
	{
		header("Location: {$base_url}/{$act_url}?cal_date={$act_date}");
	}
	
	else 
	{
		header("Location: {$base_url}/{$act_url}");
	}
} 

else 
{
	if ($case_id && is_numeric($case_id)) 
	{
		header("Location: {$base_url}/case.php?case_id={$case_id}");
	}
	
	else 
	{
		header("Location: {$base_url}/cal_day.php?cal_date={$act_date}");
	}
}

exit();

?>