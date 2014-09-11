<?php

/***********************************/
/* Pika CMS (C) 2010 Pika Software */
/* http://pikasoftware.com         */
/***********************************/

/**
* class pikaPrefs - Loads and retrieves pika user preferences
* @author Matthew Friedlander <matt@pikasoftware.com>;
* @version 1.0
* @package Danio
**/

require_once('pikaFileArray.php');

class pikaDefPrefs extends pikaFileArray  
{
	private static $instance;
	
	protected function __construct()
	{
		$this->file_location = PL_DEFAULT_PREFS_FILE;
		parent::__construct();
	}
	
	public static function getInstance()
	{
		if(empty(self::$instance)) 
		{
			self::$instance = new self();
		} 
		return self::$instance;
	}
	
	
	/**
	 * public function initPrefs()
	 * 
	 * This function is meant to replace the legacy pl_session_set_default calls
	 * by instantiating all default preferences into the $_SESSION variable at
	 * runtime.  This will alleviate the need to iteratively call each value.
	 *
	 */
	public function initPrefs($user_id = null)
	{
		$user_prefs = array();
		
		if(!is_null($user_id) && is_numeric($user_id))
		{
			require_once('pikaUser.php');
			$user = new pikaUser($user_id);
			$user_prefs = $user->getUserPrefs();
			foreach ($this->values as $name => $value)
			{
				if(!isset($user_prefs[$name]) || !$user_prefs[$name])
				{
					$user_prefs[$name] = $value;
				}
			}
			$user->session_data = serialize($user_prefs);
			$user->save();
		}
		
		foreach ($this->values as $name => $value)
		{
			if(isset($user_prefs[$name]))
			{
				$_SESSION[$name] = $user_prefs[$name];
			}
		}
		
	}
}