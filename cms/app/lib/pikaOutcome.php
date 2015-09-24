<?php

/**********************************/
/* Pika CMS (C) 2015 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

require_once('plBase.php');

/**
* Something.
*
* @author Aaron Worley <amworley@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
class pikaOutcome extends plBase 
{
	
	public function __construct($outcome_id = null)
	{
		$this->db_table = 'outcomes';
		parent::__construct($outcome_id);
	}
}

?>