<?php

/**********************************/
/* Pika CMS (C) 2009 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/


/**
* Pika PHP Warning System
* Implements Singleton - a way to add to the list of warnings
* @author Matthew Friedlander <matt@pikasoftware.com>;
* @version 1.0
* @package Danio
*/
final class pikaWarning
{
	private static $instance;
	private $warnings = array();
	
	private function __construct() {}
	private function __clone()	{}
	
	public static function getInstance(){
		if(empty(self::$instance)) {
			self::$instance = new self();
		} 
		return self::$instance;
	}
	
	public function setWarning($errno = null, $errstr = null, $errfile = null, $errline = null){
		$this->warnings[] = array($errno,$errstr,$errfile,$errline);
	}

	public function getWarnings(){
		return $this->warnings;
	}
	
	
}
