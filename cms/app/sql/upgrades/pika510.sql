ALTER TABLE `users` ADD `password_expire` INT( 11 ) DEFAULT '0';
ALTER TABLE `doc_storage` CHANGE `mime_type` `mime_type` VARCHAR( 255 ) NULL DEFAULT 'application/octet-stream';

ALTER TABLE `cases` ADD `dom_viol` TINYINT( 1 ) NULL ,
ADD `veteran_household` TINYINT( 1 ) NULL;

DELETE FROM menu_lsc_other_matters WHERE value >=130;
ALTER TABLE menu_lsc_other_matters RENAME menu_lsc_other_services;

UPDATE `menu_annotate_activities` SET `label` = 'LSC OS Code' WHERE `value` = 'om_code' LIMIT 1;
UPDATE `menu_annotate_activities` SET `label` = 'LSC OS PH Measured' WHERE `value` = 'ph_measured' LIMIT 1;
UPDATE `menu_annotate_activities` SET `label` = 'LSC OS PH Estimated' WHERE `value` = 'ph_estimated' LIMIT 1;
UPDATE `menu_annotate_activities` SET `label` = 'LSC OS Estimate Notes' WHERE `value` = 'estimate_notes' LIMIT 1;
UPDATE `menu_annotate_activities` SET `label` = 'LSC OS Media Items' WHERE `value` = 'media_items' LIMIT 1;

UPDATE `menu_act_type` SET `label` = 'LSC Other Services' WHERE `value` = 'L' LIMIT 1;

