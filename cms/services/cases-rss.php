<?php


define('PL_DISABLE_SECURITY',true);

chdir("../");

require_once ('pika-danio.php');
pika_init();


$user_id = pl_grab_get('user_id');
$clean_user_id = mysql_escape_string($user_id);

$base_url = pl_settings_get('base_url');
if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == TRUE) {
	$cal_url= "https://".$_SERVER['HTTP_HOST'].$base_url;
}else { $cal_url= "http://".$_SERVER['HTTP_HOST'].$base_url; }


//header("Content-Type: application/xml; charset=ISO-8859-1"); 
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
echo "<rss version=\"2.0\">\n";
echo "\t<channel>\n";
echo "\t\t<title>Pika CMS Case List</title>\n";
echo "\t\t<link>{$cal_url}/case_list.php</link>\n";
echo "\t\t<description>My open cases</description>\n";


$sql = "SELECT case_id, number, SUBSTRING(first_name, 1, 1) AS f, 
		SUBSTRING(last_name, 1, 1) AS l
		FROM cases LEFT JOIN contacts ON cases.client_id=contacts.contact_id
		WHERE cases.user_id={$clean_user_id} LIMIT 200";
		
$result = mysql_query($sql) or die("query failed");

while ($row = mysql_fetch_assoc($result))
{
	echo "\t\t<item>\n";
	echo "\t\t\t<title>{$row['number']}, {$row['f']} {$row['l']}</title>\n";
	echo "\t\t\t<link>{$cal_url}/case.php?case_id={$row['case_id']}</link>\n";
	echo "\t\t</item>\n";
}


echo "\t</channel>\n";
echo "</rss>";
?>