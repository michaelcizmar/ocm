<?php

function file_list($field_name = null, $field_value = null, $menu_array = null, $args = null, $data_array = null)
{
    $server_name_and_port = 'https://dev0.pikasoftware.com:4430';
	
	if(!is_numeric($field_value))
	{
		$field_value = '0';
	}
	
	if (!is_array($data_array))
	{
		$data_array = array();
	}
	
	if(!is_array($args)) {
		$args = array();
	}
	
	$def_args = array(
		// STD Directives
		'doc_type' => 'C',
		'id' => $field_name,
		'folder_field' => $field_name . '_current_folder_id', // Stores current folder location (ex current folder_ptr)
		'doc_field' => $field_name . '_current_doc_id', // Stores current doc_id (ex current doc_id for forms)
		// Display Directives
		'folder_id_hidden' => false, // Hidden current_folder field (for folder selection)
		'doc_id_hidden' => false, // Hidden current doc_id field (for document selection)
		'div' => true,
		'width' => '305',
		'height' => '170',
		'class' => '',
		// Mode (edit/select/edit_select)
		'mode' => 'edit'
	);
	// Allow arg override
	$temp_args = pikaTempLib::getPluginArgs($def_args,$args);
	
	$case_id = $report_name = $id = '';
	//print_r($temp_args);
	switch ($temp_args['doc_type'])
	{
		case 'C':
			$doc_type_description = 'Case Files';
			if(isset($data_array['case_id']) && is_numeric($data_array['case_id']))
			{
				$case_id = $id = $data_array['case_id'];
			}
			break;
		case 'F':
			$doc_type_description = 'Forms';
			break;
		case 'R':
			$doc_type_description = 'Saved Reports';
			if(isset($data_array['report_name']) && strlen($data_array['report_name']) > 0)
			{
				$report_name = $id = $data_array['report_name'];
				
			}
			break;
		default:
			$doc_type_description = 'Files';
	}
	
	
	require_once('pikaSettings.php');
	$settings = pikaSettings::getInstance();
	$base_url = $settings['base_url'];
	$file_list_output = '';
	$file_list = $folder_list = '';
	
	
		
	
	
	$file_list_output .= "<table width=\"100%\" class=\"nopad\" cellspacing=\"0\" cellpadding=\"0\">";
	$file_list_output .= "<tr><th><a href=\"\" onClick=\"fileList('{$field_name}','0','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}');return false;\">{$doc_type_description}</a></th></tr><tr><td style='padding-left: 20px;padding-top: 3px;'>";
	
	require_once('pikaDocument.php');
	require_once('pikaUser.php');
	
	
	
	
	$docs_array = pikaDocument::getFiles($field_value,$temp_args['doc_type'],$id);
	$docs = $doc_types = array();
	foreach ($docs_array as $key => $file)
	{
		// Files		
		$user = new pikaUser($file['user_id']);
		$user_name = pikaTempLib::plugin('text_name','',$user->getValues());
		//print_r($docs_array);
		if($file['folder'] != 1)
		{
			$docs[$key]['li'] = "<a href=\"{$base_url}/documents.php?doc_id={$file['doc_id']}&action=download\" target=\"_blank\">{$file['doc_name']}</a>&nbsp;";
		
           switch ($file['mime_type']) 
            {
                case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
                case 'application/vnd.openxmlformats-officedocument.word':
                case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
                case 'application/vnd.openxmlformats-officedocument.spre':
                case 'application/vnd.ms-excel':
                case 'application/rtf':
                case 'application/msword':
                case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
                case 'application/vnd.openxmlformats-officedocument.pres':
                case 'application/vnd.ms-powerpoint':

	            if (preg_match('/MSIE/i', $_SERVER['HTTP_USER_AGENT'])
	            	|| preg_match('/Trident/i', $_SERVER['HTTP_USER_AGENT'])
	            	|| preg_match('/Edge/i', $_SERVER['HTTP_USER_AGENT']))
	            {
	            	$safe_name = $file['doc_name'];
	            	// AMW 2013-07-19 - Workaround for Cleveland docs with slashes in filename.
	                $safe_name = str_replace("/", "_", $safe_name);
	                // AMW - urlencode() needs to be run *after* str_replace().
	                $safe_name = urlencode($safe_name);
	                $docs[$key]['li'] .= "<a href=\"#\" onclick='new ActiveXObject(\"SharePoint.OpenDocuments.1\").EditDocument(\"{$server_name_and_port}/{$settings['db_name']}/{$file['doc_id']}/{$safe_name}\")'>[Edit Online]</a>";                    
	            }
	            
	            else
	            {
	            	$docs[$key]['li'] .= "&nbsp;[Online edits only available with Internet Explorer]";
				}
            			

                break;
                
                default:
                break;
			}
			
			if(in_array($temp_args['mode'],array('select','edit_select')))
			{
				$number_pad = str_pad(rand(0,99999),5,'0');
				$uid = "form_id_" . $number_pad;
				/*$docs[$key]['li'] = "<input type=\"radio\" name=\"form_id_radio\" class=\"plradio\" id=\"{$uid}\" value=\"{$file['doc_id']}\" 
									onClick=\"updateCurrentDoc('{$temp_args['doc_field']}','{$file['doc_id']}');\" />
									<label for=\"{$uid}\">{$file['doc_name']}</label>&nbsp;";*/
				$docs[$key]['li'] = pikaTempLib::plugin('radio','form_id_radio',null,array($file['doc_id'] => $file['doc_name']),array("id={$uid}","onclick=updateCurrentDoc('{$temp_args['doc_field']}','{$file['doc_id']}');")) . "&nbsp;";
				//$docs[$key]['li'] = "<a href=\"\" onClick=\"updateCurrentDocument('{$temp_args['doc_field']}','{$file['doc_id']}');\">{$file['doc_name']}</a>&nbsp;";
			}
			$docs[$key]['li'] .= "<img id=\"{$file['doc_id']}_pointer\" title=\"More Info\" src='{$base_url}/images/pointer.gif' onClick='setDescription({$file['doc_id']})'>";
			
			$doc_size = pikaDocument::format_bytes($file['doc_size']);
			$description = array();
			$description['li_class'] = 'description';
			$description['li'] = "<div id='{$file['doc_id']}_description' name='{$file['doc_id']}_description' style='display: none'>";
			if(in_array($temp_args['mode'],array('edit','edit_select')))
			{
				$description['li'] .= 	"(<a href=\"\" onClick=\"editFile('{$field_name}','{$file['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}');return false;\">Edit</a>
										|
										<a href=\"\" onClick=\"confirmDeleteFile('{$field_name}','{$file['folder_ptr']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}','{$file['doc_id']}');return false;\">Delete</a>
										)<br/>";
			}
			$description['li'] .= 	"Description: {$file['description']}<br/>
									Created by: {$user_name}&nbsp;({$doc_size})</div>";
									
						
			$docs[$key]['li'] .= pikaTempLib::plugin('ul','','',array($description),array('ul_class=pika_files'));
			$docs[$key]['li_class'] = "file";
			
			
		}
		
		// Folders
		elseif($file['folder'] == 1)
		{
			$docs[$key]['li'] = "<a onClick=\"fileList('{$field_name}','{$file['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}');return false;\">{$file['doc_name']}</a>&nbsp;";
			if($temp_args['mode'] != 'select')
			{
				$docs[$key]['li'] .= "<span class='folder_actions'>
									(<a href=\"\" onClick=\"editFile('{$field_name}','{$file['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}');return false;\">Edit</a>
									|
									<a href=\"\" onClick=\"confirmDeleteFile('{$field_name}','{$file['folder_ptr']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}','{$file['doc_id']}');return false;\">Delete</a>
									)</span>";
			}	
			$docs[$key]['li_class'] = "directory";
		}
		
	}
	if(count($docs) > 0)
	{
		$file_list .= pikaTempLib::plugin('ul','','',$docs,array('ul_class=pika_files'));
	}
	
	
	$folder_array = pikaDocument::getParentFolders($field_value);
	
	if(count($folder_array))
	{
		foreach ($folder_array as $folder)
		{
			
			if($temp_args['mode'] != 'select')
			{
				$file_list= "<a onClick=\"fileList('{$field_name}','{$folder['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}');\">{$folder['doc_name']}</a>&nbsp;".
							"<span class='folder_actions'>
							(<a href=\"\" onClick=\"editFile('{$field_name}','{$folder['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}');return false;\">Edit</a>
							|
							<a href=\"\" onClick=\"confirmDeleteFile('{$field_name}','{$folder['folder_ptr']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}','{$folder['doc_id']}');return false;\">Delete</a>
							)</span>" . $file_list;
			}
			else 
			{
				$file_list= "<a onClick=\"fileList('{$field_name}','{$folder['doc_id']}','{$temp_args['mode']}','{$temp_args['doc_type']}','{$temp_args['folder_field']}','{$temp_args['doc_field']}','{$case_id}','{$report_name}');\">{$folder['doc_name']}</a>&nbsp;" . $file_list;
			}
			$file_list = pikaTempLib::plugin('ul','','',array(array('li'=>$file_list,'li_class'=>'directory_open')),array('ul_class=pika_files'));
		}
		
	}
	
	$file_list_output .= $file_list;
	
	
	$file_list_output .= "</td></tr></table>";
	
	
	
	
	if($temp_args['div']) { // checklist contained in DIV
		$width = '';
		if($temp_args['width']) 
		{
			$width = 'width:' . $temp_args['width'] . 'px;';
		}
		$height = '';
		if($temp_args['height']) 
		{
			$height = 'height:' . $temp_args['height'] . 'px;';
		}
		$class = '';
		if($temp_args['class']) 
		{
			$class = " class=\"{$temp_args['class']}\"";
		}
		
		if($temp_args['id'])
		{
			$div_id = " id=\"{$temp_args['id']}\"";
		}
		
		$file_list_output = "<div{$class}{$div_id} style=\"background-color:#FFFFFF;{$width}{$height}border:1px black solid;overflow:auto;\">"
							. $file_list_output . "</div>";
							
		if($temp_args['folder_id_hidden']) 
		{
			$file_list_output .= "\n";
			$file_list_output .= pikaTempLib::plugin('input_hidden',$temp_args['folder_field']);
		}
		if($temp_args['doc_id_hidden']) 
		{
			$file_list_output .= "\n";
			$file_list_output .= pikaTempLib::plugin('input_hidden',$temp_args['doc_field']);
		}
	}
	
	
	
	
	return $file_list_output;
}