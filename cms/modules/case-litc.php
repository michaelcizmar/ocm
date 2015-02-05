<?php

$q = pl_menu_get('main_benefit');

/*echo "ALTER TABLE cases";

foreach($q as $key => $val)
{
	echo ",\nADD COLUMN litc_ci_{$key} TINYINT NULL DEFAULT NULL";
}
echo ";";


foreach($q as $key => $val)
{
	$safe_val = htmlentities($val);
	echo "%%[litc_ci_{$key},yes_no,checkbox]%%&nbsp;{$safe_val}<br>\n";
}
*/

$menu_tax_years = array();
$current_year = date('Y');
for ($i=0;$i<30;$i++)
{
	$menu_tax_years[$current_year-$i] = $current_year-$i;
}

$litc_template = new pikaTempLib('subtemplates/case-litc.html',$case_row);
$litc_template->addMenu('tax_years',$menu_tax_years);
$C .= $litc_template->draw();
