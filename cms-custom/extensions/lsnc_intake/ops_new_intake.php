<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.net        */
/**********************************/

//chdir('../');
require_once ('pika-danio.php');
pika_init();

require_once('pikaIntake.php');
require_once('pikaContact.php');

// VARIABLES
$thiscon = pl_grab_get('thiscon');
$newcon = pl_grab_get('newcon');
$base_url = pl_settings_get('base_url');


// end VARIABLES


// BEGIN MAIN CODE...


/*
The user is coming from intake.php, and wants to create a new case.  The client
is either an existing contact or needs a new contact record created.
*/

if (1 == $newcon)
{
	$intake = new pikaIntake();
	
	// set default office value
	//$intake->office = $_SESSION['def_office'];
	
	// Create the new client's contact record.
	$client = new pikaContact();
	$client->setValues(pl_clean_form_input($_GET));
	
	// Set the first client as the primary client
	$intake->client_id = $client->contact_id;

	// Now link the client to the case.
	//$intake->addContact($client, 1);
	// Not implemented.
	
	$intake->save();
	$client->save();
}


/*	used when adding a new case for a client with an existing contact record
don't import any data from previous cases, however
*/
else if (is_numeric($thiscon))
{
	$intake = new pikaIntake();
	
	// set default office value
	//$intake->office = $_SESSION['def_office'];
	$intake->setValues(pl_clean_form_input($_GET));
	
	$primary_client = new pikaContact($thiscon);
	// Now link the client to the case.
	// set the first client as the primary client
	$intake->client_id = $thiscon;
	//$intake->addContact($primary_client, 1);
}

/*	The user is creating a new case record, but first a new contact record for the primary
client.  When done, redirect to the new case on case.php.
*/
else
{
	// Create the new contact record.
	$primary_client = new pikaContact();
	$primary_client->setValues(pl_clean_form_input($_POST));
	
	// Add any user-supplied aliases
	$al_first_name = pl_grab_var('al_first_name', array(), 'POST', 'array');
	$al_middle_name = pl_grab_var('al_middle_name', array(), 'POST', 'array');
	$al_last_name = pl_grab_var('al_last_name', array(), 'POST', 'array');
	$al_extra_name = pl_grab_var('al_extra_name', array(), 'POST', 'array');
	$for_limit = sizeof($al_first_name);
	$j = 0;
	for ($j = 0; $j < $for_limit; $j++)
	{
		if ($al_first_name[$j] || $al_middle_name[$j] || $al_last_name[$j] || $al_extra_name[$j]
		|| $al_ssn[$j] || $al_state_id[$j])
		{
			$alias_data['first_name'] = $al_first_name[$j];
			$alias_data['middle_name'] = $al_middle_name[$j];
			$alias_data['last_name'] = $al_last_name[$j];
			$alias_data['extra_name'] = $al_extra_name[$j];
			$alias_data['ssn'] = $al_ssn[$j];
			$alias_data['state_id'] = $al_state_id[$j];
			$alias_data['contact_id'] = $contact_id;
			
			$primary_client->addAlias($alias_data);
		}
	}
	
	
	$intake = new pikaIntake();
	
	// set default office value
	//$intake->office = $_SESSION['def_office'];
	$intake->setValues(pl_clean_form_input($_POST));
	
	// Now link the client to the case.
	//$intake->addContact($primary_client, 1);
	// set the first client as the primary client
	$intake->client_id = $primary_client->contact_id;
}

/*	Go directly into the next intake screen.
*/
header("Location: {$base_url}/pm.php/lsnc_intake/intakes.php?intake_id={$intake->intake_id}&step=step1");
exit();
?>