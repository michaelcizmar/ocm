<?php

/**********************************/
/* Pika CMS (C) 2002 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/

chdir('../');

require_once ('pika-danio.php');
pika_init();

require_once('pikaDocument.php');

$doc = new pikaDocument();
$file_array = array();
if (isset($_FILES['doc_upload'])) {
	$file_array = $_FILES['doc_upload'];
}
$description = pl_grab_post('description');
$case_id = pl_grab_post('case_id');
$doc_type = pl_grab_post('doc_type');
$folder = pl_grab_post('folder');
$folder_name = pl_grab_post('folder_name');
$report_name = pl_grab_post('report_name');
$parent_folder = pl_grab_post('parent_folder');
$base_url = pl_settings_get('base_url');


if ($folder) {
	if($doc_type == 'F') {
		$doc->createFolder($folder_name,$parent_folder,$doc_type);
		header("Location: {$base_url}/system-forms.php");
	}elseif ($doc_type == 'C' && is_numeric($case_id)){
		$doc->createFolder($folder_name,$parent_folder,$doc_type,$case_id);
		header("Location: {$base_url}/case.php?case_id={$case_id}&screen=docs");
	}elseif ($doc_type == 'R'){
		$doc->createFolder($folder_name,$parent_folder,$doc_type,$report_name);
		header("Location: {$base_url}/reports/$report_name/");
	}else {  // Unknown Type - back to home screen
		header("Location: {$base_url}");
	}
}
else  {
	$doc->uploadDoc($file_array, $description, $parent_folder, $doc_type, $case_id);
	if($doc_type == 'C' && is_numeric($case_id)) {
		header("Location: {$base_url}/case.php?case_id={$case_id}&screen=docs");
	} elseif($doc_type == 'F') {
		header("Location: {$base_url}/system-forms.php");
	} else {  // Unknown Type - back to home screen
		header("Location: {$base_url}");
	}
	
}

?>