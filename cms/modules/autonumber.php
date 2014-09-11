<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.net        */
/**********************************/

/*
Generate a case number
*/
function autonumber($a)
{	
	$open_year = $a['open_date'][2] . $a['open_date'][3];

	$n = "{$a['office']}-$open_year-";

	// get next available zzz_case_number, add to case number
	$next_id = pl_mysql_next_id('case_number');

	// make sure this is at least a 5 digit number
	$n .= str_pad(sprintf("%s", $next_id), 5, '0', STR_PAD_LEFT);

	return $n;
}
?>
