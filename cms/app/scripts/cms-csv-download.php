<?php

$username = '%%[username]%%';
$password = '%%[password]%%';
$url = '%%[url]%%';
$save_folder_path = '%%[save_folder_path]%%';

$c = curl_init();
curl_setopt($c, CURLOPT_URL, $url . '/services/table_listing.php');
echo "Connecting to {$url}\n";
curl_setopt($c, CURLOPT_TIMEOUT, 60);
curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($c, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
curl_setopt($c, CURLOPT_USERPWD, "$username:$password");
curl_setopt($c, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 2);
$status_code = curl_getinfo($c, CURLINFO_HTTP_CODE);
$result=curl_exec($c);
curl_close ($c);
$result = json_decode($result);

foreach ($result as $v)
{
	echo "Table {$v} ";
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
	file_put_contents($file_path, $result);
	echo "saved to {$file_path}\n";
}

?>