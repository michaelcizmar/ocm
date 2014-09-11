<?php

/**********************************/
/* Pika CMS (C) 2009 Aaron Worley */
/* http://pikasoftware.com        */
/**********************************/


require_once('pika-danio.php');
pika_init();
require_once('pikaTempLib.php');

$error = pl_grab_get('error');


if ($error == 'php')
{
	$buffer = pikaTempLib::plugin('pika_error',E_USER_NOTICE,'Cannot divide by zero',__FILE__,__LINE__);
}
else
{
	$buffer = pikaTempLib::plugin('pika_error',E_USER_NOTICE,'SELECT * FROM show_me_the_penguin',__FILE__,__LINE__);
}


pika_exit($buffer);
