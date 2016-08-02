<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
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
class pikaAlias extends plBase 
{
	
	public function __construct($alias_id = null)
	{
		$this->db_table = 'aliases';
		parent::__construct($alias_id);
	}
	
	public function save()
	{
		if ($this->is_modified || $this->is_new) 
		{
			$this->genMetaphone();
			$this->capitolizeNames();
			
			/*	This used to autofill the City/State/County based on
				ZIP code, but this is now down in Javascript by the 
				client.
			*/

			// There *must* be a last name.
			if (strlen($this->last_name) < 1) 
			{
				$this->last_name = 'NONAME';
			}
		}

		parent::save();
	}
	
	
	public function capitolizeNames()
	{
		// Automatically make the first letter of these fields uppercase.
		$this->first_name = ucfirst($this->first_name);
		$this->middle_name = ucfirst($this->middle_name);
		$this->extra_name = ucfirst($this->extra_name);
		$this->last_name = ucfirst($this->last_name);
	}
	
	public function firstNameOnly($str)
	{
		$pos = strpos($str, " ");
		
		if (!($pos === false))
		{
			return substr($str, 0, $pos);
		}
		
		else
		{
			return $str;
		}
	}
	
	public function genMetaphone()
	{
		$first = $this->firstNameOnly($this->first_name);
		$last = $this->last_name;
		
		$this->mp_first = metaphone($first);
		$this->mp_last = metaphone($last);
	}
	
	public function keywordsBuild()
	{
		$this->genMetaphone();
		$this->keywords = '';
		
		$this->keywords .= pl_text_searchify($this->first_name);
		$this->keywords .= pl_text_searchify($this->middle_name);
		$this->keywords .= pl_text_searchify($this->last_name);
		$this->keywords .= pl_text_searchify($this->extra_name);

		$x = str_replace($this->first_name, '-', ' ');
		$y = explode($x, ' ');

		foreach ($y as $value) 
		{
			if (strlen($value) > 1)  // Ignore punctuation and initials.
			{
				$sql = "SELECT root_name FROM name_variants WHERE first_name = '{$value}'";
				$result = mysql_query($sql) or trigger_error('hi');
				
				while ($row = mysql_fetch_assoc($result))
				{
					$this->keywords .= ' ' . $row['root_name'];
					$this->keywords .= ' ' . metaphone($row['root_name']);
				}
			}
		}
																						
		if (isset($this->birth_date) && strlen($this->birth_date) == 10)
		{
			$this->keywords .= ' y' . date('Y F jS', strtotime($this->birth_date));
		}
		
		$this->keywords = trim($this->keywords);
	}
}

?>