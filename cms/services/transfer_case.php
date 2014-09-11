<?php

/***************************/
/* Pika CMS (C) 2011       */
/* Pika Software, LLC.     */
/* http://pikasoftware.com */
/***************************/

chdir('../');

define('PL_HTTP_SECURITY',true);

require_once ('pika-danio.php');
pika_init();
require_once('pikaCase.php');
require_once('pikaContact.php');
require_once('pikaActivity.php');

$auth_row = pikaAuthHttp::getInstance()->getAuthRow();

$user_id = $auth_row['user_id'];

$action = pl_grab_post('action');
$payload_serialized = pl_grab_post('payload');
$payload = unserialize($payload_serialized);

$buffer = '';
switch ($action)
{
	case 'newCase':
		$case = new pikaCase();
		$unset_fields = array(	'case_id','number','office',
								'user_id','cocounsel','cocounsel2','intake_user_id',
								'pba_id1','pba_id2','pba_id3',
								'created','close_date','close_code','outcome','reject_code',
								'poten_conflicts','status'
								);
		foreach ($unset_fields as $key)
		{
			if_unset($payload,$key);
		}
		$case->setValues($payload);
		$case->status = 1;
		$case->save();
		$buffer = $case->case_id;
		break;
	case 'newContact':
		$contact = new pikaContact();
		if_unset($payload,'contact_id');
		$contact->setValues($payload);
		$contact->save();
		
		$buffer = $contact->contact_id;
		break;
	case 'addCaseContact':
		if(isset($payload[0]) && is_numeric($payload[0]))
		{
			$case = new pikaCase($payload[0]);
			if(isset($payload[1]) && is_numeric($payload[1]) && $payload[2] && is_numeric($payload[2]))
			{			
				$case->addContact($payload[1],$payload[2]);
				$buffer = $payload[1];
			}
		}
		break;
	case 'newActivity':
		$activity = new pikaActivity();
		if(isset($payload['act_id']))
		{
			unset($payload['act_id']);
		}
		$activity->setValues($payload);
		$activity->user_id = $user_id;
		$activity->hours = null;  // AMW 2013-04-08 - based on feedback from LSNM.
		$activity->save();
		$buffer = $activity->act_id;
		break;
	
	default:
		$buffer = 'Error: Unrecognized Action';
		break;
}

echo $buffer;
exit();


function if_unset(&$data,$key)
{
	if(isset($data[$key]))
	{
		unset($data[$key]);
	}
}

