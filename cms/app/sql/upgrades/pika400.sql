ALTER TABLE `cases` 
CHANGE `poverty` `poverty` DECIMAL( 5, 2 ) NULL DEFAULT NULL;  

-- 
-- Table structure for table `doc_storage`
-- 

CREATE TABLE `doc_storage` (
  `doc_id` int(11) NOT NULL default '0',
  `doc_name` varchar(255) NOT NULL default 'NONAME.txt',
  `doc_data` mediumblob,
  `doc_text` mediumtext,
  `doc_size` mediumint(9) default '0',
  `mime_type` varchar(50) default 'application/octet-stream',
  `doc_type` char(3) default 'C',
  `description` varchar(255) default NULL,
  `created` date default '0000-00-00',
  `case_id` int(11) default NULL,
  `user_id` int(11) default '0',
  `folder` tinyint(1) default '0',
  `folder_ptr` int(11) default NULL,
  PRIMARY KEY  (`doc_id`),
  KEY `case_id` (`case_id`),
  KEY `folder` (`folder`),
  KEY `folder_ptr` (`folder_ptr`),
  KEY `doc_type` (`doc_type`)
) ENGINE=InnoDB;

ALTER TABLE `transfer_options` 
ADD `user` VARCHAR( 32 ) NULL ,
ADD `password` VARCHAR( 32 ) NULL ;

ALTER TABLE `transfer_options` 
CHANGE `transfer_mode` `transfer_mode` TINYINT( 4 ) NULL DEFAULT '1';

ALTER TABLE `transfer_options` CHANGE `id` `transfer_option_id` INT( 11 ) NOT NULL DEFAULT '0';

-- 
-- Table structure for table `menu_comparison`
-- 

CREATE TABLE `menu_comparison` (
  `value` tinyint(4) NOT NULL default '0',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `flags`
-- 

CREATE TABLE `flags` (
  `flag_id` int(11) NOT NULL default '0',
  `name` varchar(32) default 'pika_flag',
  `description` varchar(255) default NULL,
  `rules` text,
  `enabled` tinyint(1) default '0',
  `created` timestamp NULL default '0000-00-00 00:00:00',
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`flag_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_comparison`
-- 

INSERT INTO `menu_comparison` VALUES (1, 'is blank', 0);
INSERT INTO `menu_comparison` VALUES (2, 'is NOT blank', 1);
INSERT INTO `menu_comparison` VALUES (3, '!= (NOT Equal)', 2);
INSERT INTO `menu_comparison` VALUES (4, '== (Equals)', 3);
INSERT INTO `menu_comparison` VALUES (5, '> (Greater Than)', 4);
INSERT INTO `menu_comparison` VALUES (6, '>= (Greater Than or Equal)', 5);
INSERT INTO `menu_comparison` VALUES (7, '< (Less Than)', 6);
INSERT INTO `menu_comparison` VALUES (8, '<= (Less Than or Equal)', 7);
INSERT INTO `menu_comparison` VALUES (9, 'Between', 8);
UNLOCK TABLES;

-- 
-- Table structure for table `menu_doc_type`
-- 

CREATE TABLE `menu_doc_type` (
  `value` char(1) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_doc_type`
-- 

INSERT INTO `menu_doc_type` VALUES ('C', 'Case Files', 0);
INSERT INTO `menu_doc_type` VALUES ('F', 'Forms', 2);
UNLOCK TABLES;


-- 
-- Table structure for table `menu_transfer_mode`
-- 

CREATE TABLE `menu_transfer_mode` (
  `value` tinyint(4) NOT NULL default '0',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_transfer_mode`
-- 

INSERT INTO `menu_transfer_mode` VALUES (1, 'Pika->Pika', 0);

--
-- Dumping data for table `counters`
--

INSERT INTO counters VALUES ('doc_storage',8);
INSERT INTO counters VALUES ('flags',12);
INSERT INTO counters VALUES ('transfer_options',0);

-- 
-- Dumping data for table `flags`
-- 

INSERT INTO `flags` VALUES (1, 'poverty_125', 'Client Over Income [125%]', 'a:1:{i:0;a:4:{s:10:"field_name";s:13:"cases.poverty";s:10:"comparison";s:1:"5";s:5:"value";s:3:"125";s:3:"and";a:2:{i:0;a:3:{s:14:"and_field_name";s:13:"cases.poverty";s:14:"and_comparison";s:1:"7";s:9:"and_value";s:5:"187.5";}i:1;a:3:{s:14:"and_field_name";s:17:"cases.just_income";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}}}}', 1, '2008-10-03 12:32:25', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (2, 'poverty_187.5', 'Client Over Income [187.5%]', 'a:1:{i:0;a:3:{s:10:"field_name";s:13:"cases.poverty";s:10:"comparison";s:1:"5";s:5:"value";s:5:"187.5";}}', 1, '2008-10-03 12:29:02', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (3, 'assets', 'Asset information is blank', 'a:1:{i:0;a:4:{s:10:"field_name";s:12:"cases.asset0";s:10:"comparison";s:1:"1";s:5:"value";s:0:"";s:3:"and";a:4:{i:0;a:3:{s:14:"and_field_name";s:12:"cases.asset1";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:1;a:3:{s:14:"and_field_name";s:12:"cases.asset2";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:2;a:3:{s:14:"and_field_name";s:12:"cases.asset3";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:3;a:3:{s:14:"and_field_name";s:12:"cases.asset4";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}}}}', 1, '2008-10-02 10:58:04', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (4, 'household_size', 'Household Size Info is Blank', 'a:1:{i:0;a:4:{s:10:"field_name";s:14:"cases.children";s:10:"comparison";s:1:"7";s:5:"value";s:1:"1";s:3:"and";a:1:{i:0;a:3:{s:14:"and_field_name";s:12:"cases.adults";s:14:"and_comparison";s:1:"7";s:9:"and_value";s:1:"1";}}}}', 1, '2008-10-02 14:51:08', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (5, 'citizenship', 'Citizenship Status is Blank', 'a:1:{i:0;a:3:{s:10:"field_name";s:13:"cases.citizen";s:10:"comparison";s:1:"1";s:5:"value";s:0:"";}}', 1, '2008-10-02 15:06:22', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (6, 'invalid_citizenship', 'Invalid Citizenship Status', 'a:1:{i:0;a:4:{s:10:"field_name";s:13:"cases.citizen";s:10:"comparison";s:1:"3";s:5:"value";s:1:"A";s:3:"and";a:2:{i:0;a:3:{s:14:"and_field_name";s:13:"cases.citizen";s:14:"and_comparison";s:1:"3";s:9:"and_value";s:1:"B";}i:1;a:3:{s:14:"and_field_name";s:13:"cases.citizen";s:14:"and_comparison";s:1:"2";s:9:"and_value";s:0:"";}}}}', 1, '2008-10-02 15:14:33', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (7, 'conflicts', 'This Case has a Conflict of Interest', 'a:1:{i:0;a:3:{s:10:"field_name";s:15:"cases.conflicts";s:10:"comparison";s:1:"5";s:5:"value";s:1:"0";}}', 1, '2008-10-02 16:04:32', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (8, 'potential_conflicts', 'This Case has a Potential Conflict of Interest', 'a:1:{i:0;a:4:{s:10:"field_name";s:21:"cases.poten_conflicts";s:10:"comparison";s:1:"5";s:5:"value";s:1:"0";s:3:"and";a:2:{i:0;a:3:{s:14:"and_field_name";s:15:"cases.conflicts";s:14:"and_comparison";s:1:"3";s:9:"and_value";s:1:"0";}i:1;a:3:{s:14:"and_field_name";s:15:"cases.conflicts";s:14:"and_comparison";s:1:"3";s:9:"and_value";s:1:"1";}}}}', 1, '2008-10-03 12:21:09', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (9, 'funding', 'Funding Code is Blank', 'a:1:{i:0;a:3:{s:10:"field_name";s:13:"cases.funding";s:10:"comparison";s:1:"1";s:5:"value";s:0:"";}}', 1, '2008-10-03 12:23:32', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (10, 'income', 'Income Info is Blank', 'a:1:{i:0;a:4:{s:10:"field_name";s:13:"cases.annual0";s:10:"comparison";s:1:"1";s:5:"value";s:0:"";s:3:"and";a:4:{i:0;a:3:{s:14:"and_field_name";s:13:"cases.annual1";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:1;a:3:{s:14:"and_field_name";s:13:"cases.annual2";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:2;a:3:{s:14:"and_field_name";s:13:"cases.annual3";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}i:3;a:3:{s:14:"and_field_name";s:13:"cases.annual4";s:14:"and_comparison";s:1:"1";s:9:"and_value";s:0:"";}}}}', 1, '2008-10-03 12:26:13', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (11, 'problem', 'LSC Problem Code is Blank', 'a:1:{i:0;a:3:{s:10:"field_name";s:13:"cases.problem";s:10:"comparison";s:1:"1";s:5:"value";s:0:"";}}', 1, '2008-10-03 12:40:36', '0000-00-00 00:00:00');
INSERT INTO `flags` VALUES (12, 'num_opposings', 'No Opposing Parties Have Been Entered', 'a:1:{i:0;a:3:{s:10:"field_name";s:15:"relation_code.2";s:10:"comparison";s:1:"7";s:5:"value";s:1:"1";}}', 1, '2008-10-03 12:41:38', '0000-00-00 00:00:00');


UNLOCK TABLES;