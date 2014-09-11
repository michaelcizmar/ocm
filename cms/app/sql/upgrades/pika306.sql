ALTER TABLE menu_main_benefit CHANGE menu_order menu_order smallint NOT NULL default '0';
ALTER TABLE `cases` ADD `reduced_fee` TINYINT NOT NULL AFTER `date_sent` ,
ADD `retainer_on_file` TINYINT NULL AFTER `reduced_fee` ,
ADD `case_is_pro_bono` TINYINT NULL AFTER `retainer_on_file` ,
ADD `pb_attorney_hrs` DECIMAL( 4, 2 ) NULL AFTER `case_is_pro_bono` ,
ADD `atty_fee_normal` DECIMAL( 6, 2 ) NULL AFTER `pb_attorney_hrs` ,
ADD `atty_fee_to_client` DECIMAL( 6, 2 ) NULL AFTER `atty_fee_normal` ,
ADD `client_savings` DECIMAL( 6, 2 ) NULL AFTER `atty_fee_to_client`;
