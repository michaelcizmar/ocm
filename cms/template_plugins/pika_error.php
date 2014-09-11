<?php

function pika_error($errno = null, $errstr = null, $errfile = null, $errline = null)
{
	
	
	$error_output = '';
	//print_r($_SERVER);
	$a = array('action' => 'NONE', 'screen' => 'NONE', 'HTTP_REFERER' => 'NOT SET', 'QUERY_STRING' => 'NONE');
	$a['message'] = $errstr;
	$a['file'] = $errfile;
	$a['line'] = $errline;
	if(isset($_REQUEST['action'])) {
		$a['action'] = $_REQUEST['action'];
	}if(isset($_REQUEST['screen'])) {
		$a['screen'] = $_REQUEST['screen'];
	}if(isset($_SERVER['HTTP_RERERER'])) {
		$a['HTTP_RERERER'] = $_SERVER['HTTP_RERERER'];
	}if(isset($_SERVER['REQUEST_METHOD'])) {
		$a['REQUEST_METHOD'] = $_SERVER['REQUEST_METHOD'];
	}if(isset($_SERVER['REMOTE_ADDR'])) {
		$a['REMOTE_ADDR'] = $_SERVER['REMOTE_ADDR'];
	}if(isset($_SERVER['HTTP_USER_AGENT'])) {
		$a['HTTP_USER_AGENT'] = $_SERVER['HTTP_USER_AGENT'];
	}if(isset($_SERVER['SERVER_NAME'])) {
		$a['SERVER_NAME'] = $_SERVER['SERVER_NAME'];
	}if(isset($_SERVER['SERVER_SOFTWARE'])) {
		$a['SERVER_SOFTWARE'] = $_SERVER['SERVER_SOFTWARE'];
	}if(isset($_SERVER['REQUEST_URI'])) {
		$a['REQUEST_URI'] = $_SERVER['REQUEST_URI'];
	}if(isset($_SERVER['QUERY_STRING']) && $_SERVER['QUERY_STRING']) {
		$a['QUERY_STRING'] = $_SERVER['QUERY_STRING'];
	}

	require_once('pikaSettings.php');
	require_once('pikaAuth.php');
	require_once('pikaAuthHttp.php');
	$settings = pikaSettings::getInstance();
	
	// Verify the user is logged into pika
	
	
	
	// 3 possibilities (logged in/not logged in/no security)
	if(defined('PL_DISABLE_SECURITY'))
	{
		$error_output = $errstr . ' Line: ' . $errline . ' File:' . $errfile; 
	}
	elseif
	((defined('PL_HTTP_SECURITY') && pikaAuthHttp::getInstance()->isAuthorized()) || pikaAuth::getInstance()->isAuthorized()) 
	{
		$template = new pikaTempLib('templates/unavailable.html',$a);
		$main_html['content'] = $template->draw();
		$main_html['nav'] = "<a href=\"{$settings['base_url']}\">Pika Home</a>";
		$main_html['page_title'] = "Pika Error";
		$default_template = new pikaTempLib('templates/default.html',$main_html);
		$error_output = $default_template->draw();
	}
	else 
	{
		$html['messages'] = $errno . ': ' . $errstr;
		$html['auth_id'] = $_SESSION['auth_id'];
		$default_template = new pikaTempLib('templates/login-form.html',$html);
		if(browser_is_mobile())
		{
			$default_template = new pikaTempLib('m/login-form.html',$html);
		}
		$error_output = $default_template->draw();	
	}
	
	
	
	
	
	return $error_output;
}

?>