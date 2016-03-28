<?php

/***************************/
/* Pika CMS (C) 2015       */
/* Pika Software, LLC.     */
/* http://pikasoftware.com */
/***************************/

chdir('../');

define('PL_HTTP_SECURITY',true);

require_once ('pika-danio.php');
pika_init();
require_once('pikaTransfer.php');

$auth_row = pikaAuthHttp::getInstance()->getAuthRow();
$transfer = new pikaTransfer;
$tranfer->user_id = $auth_row['user_id'];
$transfer->json_data = file_get_contents('php://input');
$tranfer->accepted = 2;  // Pending review.
$transfer->save();
echo '1';
exit();
