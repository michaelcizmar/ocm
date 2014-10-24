<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.net        */
/**********************************/

//chdir('../');
require_once ('pika-danio.php');
pika_init();

require_once('pikaIntake.php');

// VARIABLES
$base_url = pl_settings_get('base_url');
$intake = new pikaIntake(pl_grab_post('intake_id', 0));
$button_press_1 = pl_grab_post('button_press_1');
$button_press_2 = pl_grab_post('button_press_2');
$button_press_3 = pl_grab_post('button_press_3');
$button_press_4 = pl_grab_post('button_press_4');
$button_press_5 = pl_grab_post('button_press_5');
$current_step = pl_grab_post('current_step', 2);

// end VARIABLES


// BEGIN MAIN CODE...

if (strlen($button_press_1) > 0)
{
	// The client is eligible for service.

	require_once('pikaCase.php');
	require_once('pikaActivity.php');
	
	// Save any changes made to the intake record since the last save.
	$intake->setValues(pl_clean_form_input($_POST));
	// Get the data that will be moved over to the case record.
	$intake_data = $intake->getValues();
	unset($intake_data['number']);  // TODO - delete the intakes.number field so I get rid of this
	
	// Create a new case record from the intake record.	
	$new_case = new pikaCase();
	$new_case->setValues($intake_data);
	$new_case->addContact($intake->client_id, 1);

	// AMW
	$client_id = $intake->client_id;
	
	// Create a new case note record for the intake notes.
	$case_notes = new pikaActivity();
	$case_notes->notes = $intake->intake_notes;
	$case_notes->case_id = $new_case->case_id;
	$case_notes->user_id = $auth_row['user_id'];
	$case_notes->save();
	
	
	/*
	foreach ($intake->getContacts() as $key => $val)
	{
		$new_case->addContact($key, $val);
	}
	*/
	
	
	
	// Convert intake notes field into case notes.
	
	// Delete the intake record.
	$intake->delete();
	// mark info hack
	//header("Location: {$base_url}/contacts.php/{$new_case->client_id}/?case_id={$new_case->case_id}");


	// AMW
	$screen = pl_grab_post('screen', 'info');
	header("Location: {$base_url}/contact.php?contact_id={$client_id}&case_id={$new_case->case_id}&screen={$screen}");

}

else if (strlen($button_press_2) > 0)
{
	// The client is not eligible for service.
	
	$intake->delete();
	
	header("Location: {$base_url}/");
}

else if (strlen($button_press_3) > 0)
{
	// The user is saving the intake record.
	$intake->setValues(pl_clean_form_input($_POST));
	$intake->save();
	
	header("Location: {$base_url}/pm.php/lsnc_intake/intakes.php?intake_id={$intake->intake_id}&step=step{$current_step}");
}

else if (strlen($button_press_4) > 0)
{
	/*	-- For Northern California --
	The client is an eligible alien.
	*/
	$intake->setValues(pl_clean_form_input($_POST));
	//require_once('pikaCase.php');
	
	// Save any changes made to the intake record since the last save.
	//$intake->setValues($_POST);
	
	// Create a new case record from the intake record.	
	//$new_case = new pikaCase();
	//$new_case->setValues($intake->getValues());
	
	//foreach ($intake->getContacts() as $key => $val)
	//{
	//	$new_case->addContact($key, $val);
	//}
	
	// Convert intake notes field into case notes.
	
	// Delete the intake record.
	//$intake->delete();
	
	//header("Location: {$base_url}/eligible_alien.php/{$new_case->case_id}/");
	// Mark Hack
	$intake->save();
	header("Location: {$base_url}/pm.php/lsnc_intake/intakes.php?intake_id={$intake->intake_id}&step=step1b");
}

else if (strlen($button_press_5) > 0)
{
	// The user is saving the intake record and continuing to Step 2.
	$intake->setValues(pl_clean_form_input($_POST));

// Mark Hack
	$intake->save();
	header("Location: {$base_url}/pm.php/lsnc_intake/intakes.php?intake_id={$intake->intake_id}&step=step2");
}

else 
{
	trigger_error('');
}

exit();

?>
