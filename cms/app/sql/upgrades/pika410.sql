-- Add characters to countername to avoid truncation -- 
ALTER TABLE `counters` CHANGE `id` `id` CHAR( 32 ) NOT NULL DEFAULT 'COUNTERNAME';

-- Add case_tabs table


CREATE TABLE `case_tabs` (
  `tab_id` tinyint(3) NOT NULL default '0',
  `name` varchar(65) NOT NULL default 'New Tab',
  `file` varchar(255) default NULL,
  `enabled` tinyint(1) default '1',
  `tab_order` tinyint(3) default '0',
  `autosave` tinyint(1) default '0',
  `tab_row` tinyint(3) default '1',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tab_id`),
  KEY `order` (`tab_order`)
) ENGINE=MyISAM;


-- Convert old case_tabs to new system
-- first_row
SET @case_tab_id = 0;
SET @tab_order = 0;
INSERT INTO case_tabs (
tab_id,
name,
file,
enabled,
tab_order,
autosave,
tab_row
) SELECT
@case_tab_id:=@case_tab_id + 1,
label,
CONCAT('case-',value,'.php'),
'1',
@tab_order:=@tab_order+1,
'0',
'1'
FROM menu_case_tabs;

-- second_row
INSERT INTO case_tabs (
tab_id,
name,
file,
enabled,
tab_order,
autosave,
tab_row
) SELECT
@case_tab_id:=@case_tab_id + 1,
label,
CONCAT('case-',value,'.php'),
'1',
@tab_order:=@tab_order+1,
'0',
'2'
FROM menu_case_tabs2;

-- RSS feeds -- 

CREATE TABLE `rss_feeds` (
  `feed_id` int(11) NOT NULL default '0',
  `name` varchar(80) default 'No Name',
  `feed_url` tinytext,
  `feed_cache` mediumtext,
  `feed_type` tinyint(1) default NULL,
  `enabled` tinyint(1) default '0',
  `list_limit` tinyint(1) default '5',
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`feed_id`)
) ENGINE=MyISAM;


-- MOTD --

ALTER TABLE `motd` CHANGE `user_id` `user_id` INT( 11 ) NULL DEFAULT NULL;
ALTER TABLE `motd` ADD `full_name` VARCHAR( 80 ) AFTER `user_id` ;
ALTER TABLE `motd` ADD `title` VARCHAR( 255 ) AFTER `full_name` ;

ALTER TABLE `motd` ADD `last_modified` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
ADD `created` TIMESTAMP DEFAULT '0000-00-00 00:00:00';

-- Report Security -- 
ALTER TABLE `groups` ADD `reports` TEXT;


-- Doc Storage Update -- 
ALTER TABLE `doc_storage` ADD `report_name` VARCHAR( 55 ) NULL AFTER `user_id`;
ALTER TABLE `doc_storage` ADD INDEX ( `report_name` );
INSERT INTO `menu_doc_type` VALUES ('U', 'User Files', 1);
INSERT INTO `menu_doc_type` VALUES ('R', 'Saved Report Files', 3);
