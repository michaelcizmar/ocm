ALTER TABLE cases ADD COLUMN case_address varchar(50) DEFAULT NULL AFTER good_story,
ADD COLUMN case_address2 varchar(50) DEFAULT NULL AFTER case_address,
ADD COLUMN case_city varchar(25) DEFAULT NULL AFTER case_address2,
ADD COLUMN case_state varchar(25) DEFAULT NULL AFTER case_city;

CREATE TABLE `compens` (
  `compen_id` int(11) NOT NULL default '0',
  `case_id` int(11) NOT NULL default '0',
  `billing_date` date default NULL,
  `payment_date` date default NULL,
  `billing_amount` decimal(8,2) default NULL,
  `payment_amount` decimal(8,2) default NULL,
  `billing_hours` decimal(8,2) default NULL,
  `notes` varchar(128) default NULL,
  `time_amount` decimal(8,2) default NULL,
  `expenses_amount` decimal(8,2) default NULL,
  `donated_amount` decimal(8,2) default NULL,
  PRIMARY KEY  (`compen_id`),
  KEY `case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE settings MODIFY value mediumtext NOT NULL DEFAULT '';
