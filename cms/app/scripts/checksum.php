<?php

function directory_checksum($directory_name)
{
	$dh = opendir($directory_name);
	
	while ($file = readdir($dh))
	{
		if ($file[0] != '.')
		{
			if (!is_dir("{$directory_name}/{$file}"))
			{
				echo md5_file("{$directory_name}/{$file}") . "  {$directory_name}/{$file}\n";			
			}
		}
	}
	
	closedir($dh);
}

$directories = array('subtemplates', 'templates', 'ops', 'modules');

foreach ($directories as $directory_name)
{
	directory_checksum($directory_name);
}

$dh = opendir('reports');

while ($file = readdir($dh))
{
	if ($file[0] != '.')
	{
		if (is_dir("reports/{$file}"))
		{
			directory_checksum("reports/{$file}");
		}
	}
}

closedir($dh);
?>