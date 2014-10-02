<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.net        */
/**********************************/

require_once('plBase.php');

/**
* Something.
*
* @author Aaron Worley <amworley@pikasoftware.net>;
* @version 1.0
* @package Danio
*/
class pikaIntake extends plBase 
{
	private $contacts = array();  // An array of case-related contact_id's.
	
	
	public function __construct($intake_id = null)
	{
		global $auth_row;
		
		$this->db_table = 'intakes';
		parent::__construct($intake_id);
		
		if (is_null($intake_id)) 
		{
			$this->created = date('YmdHis');
			$this->intake_user_id = $auth_row['user_id'];

			if (strlen($this->intake_type) < 1)
			{
				$this->intake_type = $_SESSION['def_intake_type'];
			}
		}
		
		return true;
	}
	
	
	public function delete()
	{
		parent::delete();
	}
}


?>