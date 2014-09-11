<?php

$a = $case_row;
$a['recipient'] = $case_row['client_id'];
$a['client'] = $case_row['client_id'];



$template = new pikaTempLib('subtemplates/case-docs.html', $a);
$C .= $template->draw();
?>
