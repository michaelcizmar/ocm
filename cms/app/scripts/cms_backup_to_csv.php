<?php

$username = 'absmith';
$password = 'backups-are-very-important';
$url = 'https://localhost/cms';

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url . '/services/table_listing.php');
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
$status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$result=curl_exec($ch);
curl_close ($ch);
echo $status_code;
echo $result;
echo "\n";



	
?>