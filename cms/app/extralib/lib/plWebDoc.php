<?php

class plWebDoc
{
	var $format = 'html';
	var $align = 'landscape';
	var $filename = 'pika-report';
	var $convert_to_pdf = false;
	var $mime_type = 'text/html';
	
	/**
	* @return boolean
	* @param $val string
	* @desc Specify the format of the document that will be provided to display().
 	*/
	function setFormat($val)
	{
		if ('pdf' == $val || 'html' == $val || 'rtf' == $val)
		{
			$this->format = $val;
			return true;
		}
		
		return false;
	}

	/**
	* @return boolean
	* @param $val string
	* @desc Specify landscape or portrait alignment for PDF documents.
 	*/
	function setAlign($val)
	{
		if ('landscape' == $val || 'portrait' == $val)
		{
			$this->align = $val;
			return true;
		}
		
		return false;
	}
	
	/**
	* @return boolean
	* @param $str string
	* @desc Specify the filename for the document.	
 	*/
	function setFilename($str)
	{
		$this->filename = $str;
		return true;
	}
	
	/**
	* @return boolean
	* @param $val string
	* @desc Specify whether the document should be converted to PDF upon transmission.	
 	*/
	function convertToPdf($val)
	{
		if (true == $val || false == $val)
		{
			$this->convert_to_pdf = $val;
			return true;
		}
		
		return false;
	}

	/**
	* @return void
	* @param $buffer string
	* @desc Submit $buffer to the user as a document, according to specified options.	
 	*/
	function display($buffer)
	{
		global $plSettings;
		$final_buffer = '';		
		$filename_ext = 'html';
		$rand_str = substr(md5(microtime()), 0, 5);
		
		
		// doesn't seem to help
		// header('Cache-control: private');
		
		// PDF will crash netscape 4.x on win32 test system
		// But this is taking out IE 6 as well.
		/*
		if (strstr($_SERVER['HTTP_USER_AGENT'], 'Mozilla/4.'))
		{
			$this->format = 'html';
		}
		*/
		
		// Determine which mime type to apply.
		switch ($this->format)
		{
			case 'html':
			$this->mime_type = 'text/html';
			break;
			
			case 'rtf':
			$this->mime_type = 'application/rtf';
			break;
			
			case 'csv':
			$this->mime_type = 'text/csv';
			break;
			
			default:
			$this->mime_type = 'application/octet-stream';
			break;
		}

		// Handle PDF conversion, if specified
		if (true == $this->convert_to_pdf && 'html' == $this->format)
		{
			$fp = fopen("/tmp/csr-$rand_str.html", 'w');
			fputs($fp, $buffer);
			fclose($fp);

			$pdf_command = "htmldoc -t pdf \
									--{$this->align} --no-links \
									--webpage --gray --textfont courier --headingfont courier\
									--header \"   \" --footer \"   \" \
									--fontsize 10 --top 0.5in --bottom 0.5in \
									--left 0.5in --right 0.5in /tmp/csr-$rand_str.html";
			$final_buffer = shell_exec($pdf_command);
			unlink("/tmp/csr-$rand_str.html");
			
			$this->mime_type = 'application/pdf';
			$filename_ext = 'pdf';
		}
		
		else 
		{
			$final_buffer = $buffer;
			$filename_ext = $this->format;
		}

		// Dropbox method.
		/*
		$fp = fopen("dropbox/{$this->filename}-$rand_str.pdf", 'w');
		fputs($fp, $pdf_buffer);
		fclose($fp);
		
		header("Location: {$plSettings['base_url']}/dropbox/{$this->filename}-$rand_str.pdf");
		*/
		
		// Passthru method.
		header('Content-Type: '. $this->mime_type);
		header("Content-Disposition: inline; filename=\"{$this->filename}.{$filename_ext}\"");
		header('Content-Size: ' . strlen($final_buffer));
		echo $final_buffer;
		exit;
	}
}

?>
