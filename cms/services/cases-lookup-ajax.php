<?php

/**********************************/
/* Pika CMS (C) 2009 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('..');
require_once('pika-danio.php');
pika_init();

require_once('pikaCase.php');

$case_id = pl_grab_get('case_id');

if(!is_numeric($case_id)) { $case_id = ''; }
$case = new pikaCase($case_id);
$case_row = $case->getValues();
$doc = new DOMDocument();
$case_xml = $doc->createElement('pikaCase');
$case_xml = $doc->appendChild($case_xml);


if (pika_authorize('read_case',$case_row) && !$case->is_new)
{
	foreach ($case_row as $field => $value) {
		$case_node = $doc->createElement($field,$value);
		$case_node = $case_xml->appendChild($case_node);
	}
	
} else {
	foreach ($case_row as $field => $value) {
		$case_node = $doc->createElement($field,$value);
		$case_node = $case_xml->appendChild($case_node);
	}
}


$buffer = $doc->saveXML();
header('Content-type: text/xml');
exit($buffer);
?>
