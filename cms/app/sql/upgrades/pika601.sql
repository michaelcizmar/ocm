ALTER TABLE pb_attorneys
  ADD `username` varchar(16) DEFAULT NULL,
  ADD `password` varchar(64) DEFAULT NULL,
  ADD `enabled` tinyint(4) DEFAULT '0',
  ADD `session_data` text;

DELETE FROM menu_lsc_other_services WHERE value IN ('101', '113');

ALTER TABLE cases ADD COLUMN income_type5 CHAR(3) NULL AFTER annual4, 
	ADD COLUMN annual5 DECIMAL(9,2) NULL AFTER income_type5,
	ADD COLUMN income_type6 CHAR(3) NULL AFTER annual5, 
	ADD COLUMN annual6 DECIMAL(9,2) NULL AFTER income_type6,
	ADD COLUMN income_type7 CHAR(3) NULL AFTER annual6, 
	ADD COLUMN annual7 DECIMAL(9,2) NULL AFTER income_type7,
	ADD COLUMN dom_viol tinyint(4) default NULL AFTER destroy_date,
	ADD COLUMN veteran_household date default NULL AFTER dom_viol;
