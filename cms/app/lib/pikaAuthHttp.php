<?php

require_once('pikaSettings.php');

class pikaAuthHttp
{
	private static $instance;
	
	private $session_id;
	private $user;
	private $pass;
	
	private $messages = array();
	private $is_authorized = false;
	private $auth_row = array(	'user_id' => '',
								'username' => '',
								'group_id' => ''										
	);
	
	
	private function __construct()
	{
		if(session_id() == '')
		{
			session_start();
		}
		$this->session_id = session_id();
		if(isset($_SESSION['SID']) && $_SESSION['SID'])
		{
			$this->session_id = $_SESSION['SID'];
		}
	}
	
	public static function getInstance()
	{
		if(empty(self::$instance)) 
		{
			self::$instance = new self();
		} 
		return self::$instance;
	}
	
	public function authenticate($authAdapterObj) 
	{
		
		$this->is_authorized = false;
		
		$settings = pikaSettings::getInstance();
		
		$session_name = 'PikaCMS' . PIKA_VERSION . PIKA_REVISION . PIKA_PATCH_LEVEL;
		if(isset($settings['cookie_prefix']) && strlen($settings['cookie_prefix']))
		{ // Session Name only accepts letters and numbers so remove all non letters and/or numbers
			$session_name = preg_replace('/[^a-z0-9]/i','',$settings['cookie_prefix']);
		}
		
		if (!isset($_SERVER['PHP_AUTH_USER']))
		{
			header("WWW-Authenticate: Basic realm=\"{$session_name}\", stale=FALSE");
			header('HTTP/1.0 401 Unauthorized');
			exit();
		}
		
		// If no authorization adapter is supplied assume users
		if(!is_object($authAdapterObj) || !method_exists($authAdapterObj,'authenticate'))
		{
			$authAdapterObj = new pikaAuthDb('users','username','password');
		}
		if($authAdapterObj->authenticate($_SERVER['PHP_AUTH_USER'],$_SERVER['PHP_AUTH_PW']))
		{
			// Check to see that the login is not a back/refresh of submission form
			$this->is_authorized = true;
			$this->auth_row = $authAdapterObj->getAuthRow();		
		}
		else 
		{
			header("WWW-Authenticate: Basic realm=\"{$session_name}\", stale=FALSE");
			header('HTTP/1.0 401 Unauthorized');
			exit();
		}
		
		$this->processAuthRow();
		
		if($this->is_authorized && !$settings['enable_system'] && $this->auth_row['group_id'] != 'system')
		{	
			$this->is_authorized = false;
		}
		
		return $this->is_authorized;
		
	}

	private function processAuthRow()
	{
		$temp = $this->auth_row;
	
		if(isset($temp['read_office']) && strlen($temp['read_office']))
		{
			$temp['read_office'] = explode(',',$temp['read_office']);
		}
		if(isset($temp['read_office']) && strlen($temp['read_office']))
		{
			$temp['edit_office'] = explode(',', $temp['edit_office']); 		
		}

		$this->auth_row = $temp;
	}
	
	public function getAuthRow()
	{
		return $this->auth_row;
	}

	public function isAuthorized()
	{
		return $this->is_authorized;
	}
	
	
}
