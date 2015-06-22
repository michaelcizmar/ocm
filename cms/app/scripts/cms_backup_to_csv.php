<?php

$username = 'absmith';
$password = 'backups-are-very-important';
$url = 'https://localhost/cms';
$save_folder_path = '/tmp';

$c = curl_init();
curl_setopt($c, CURLOPT_URL, $url . '/services/table_listing.php');
echo $url . '/services/table_listing.php';
curl_setopt($c, CURLOPT_TIMEOUT, 60);
curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($c, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
curl_setopt($c, CURLOPT_USERPWD, "$username:$password");
curl_setopt($c, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 2);
$status_code = curl_getinfo($c, CURLINFO_HTTP_CODE);
$result=curl_exec($c);
curl_close ($c);
echo $status_code;
echo "\n";
$result = json_decode($result);

foreach ($result as $v)
{
	echo $v ."\n";
	$c = curl_init();
	curl_setopt($c, CURLOPT_URL, $url . '/services/csv.php?action=' . $v);
	curl_setopt($c, CURLOPT_TIMEOUT, 60);
	curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($c, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
	curl_setopt($c, CURLOPT_USERPWD, "$username:$password");
	curl_setopt($c, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 2);
	$status_code = curl_getinfo($c, CURLINFO_HTTP_CODE);
	$result=curl_exec($c);
	curl_close ($c);
	$file_path = $save_folder_path . '/' . $v . '.csv';
	echo $file_path;
	file_put_contents($file_path, $result);
	echo "\n";
}



	
?>