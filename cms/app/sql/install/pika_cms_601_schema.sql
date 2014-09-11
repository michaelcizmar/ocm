-- MySQL dump 9.11
--
-- Host: localhost    Database: danio
-- ------------------------------------------------------
-- Server version	4.0.24-standard

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `act_id` int(11) NOT NULL default '0',
  `act_date` date default NULL,
  `act_time` time default NULL,
  `act_end_time` time default NULL,
  `hours` decimal(4,2) default NULL,
  `completed` tinyint(4) NOT NULL default '0',
  `act_type` char(1) NOT NULL default 'T',
  `category` char(3) default NULL,
  `case_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `pba_id` int(11) default NULL,
  `funding` char(3) default NULL,
  `summary` varchar(75) default NULL,
  `notes` text,
  `last_changed` timestamp NOT NULL,
  `om_code` char(3) default NULL,
  `ph_measured` mediumint(9) default NULL,
  `ph_estimated` mediumint(9) default NULL,
  `estimate_notes` tinytext,
  `act_end_date` date default NULL,
  `problem` char(3) default NULL,
  `location` varchar(5) default NULL,
  `media_items` smallint(6) default NULL,
  PRIMARY KEY  (`act_id`),
  KEY `ud` (`user_id`,`act_date`),
  KEY `case_id` (`case_id`),
  KEY `act_type` (`act_type`),
  KEY `act_date` (`act_date`),
  KEY `act_time` (`act_time`),
  KEY `completed` (`completed`)
) ENGINE=MyISAM;

--
-- Table structure for table `aliases`
--

CREATE TABLE `aliases` (
  `alias_id` int(11) NOT NULL default '0',
  `contact_id` int(11) NOT NULL default '0',
  `primary_name` tinyint(4) NOT NULL default '0',
  `first_name` char(50) default NULL,
  `middle_name` char(50) default NULL,
  `last_name` char(50) default NULL,
  `extra_name` char(20) default NULL,
  `mp_first` char(8) default NULL,
  `mp_last` char(8) default NULL,
  `ssn` char(11) default NULL,
  PRIMARY KEY  (`alias_id`),
  KEY `first_name` (`first_name`),
  KEY `middle_name` (`middle_name`),
  KEY `extra_name` (`extra_name`),
  KEY `ssn` (`ssn`),
  KEY `contact_id` (`contact_id`),
  KEY `mp_first` (`mp_first`),
  KEY `mp_last` (`mp_last`),
  KEY `sorting` (`last_name`,`first_name`,`extra_name`,`middle_name`),
  KEY `last_name` (`last_name`),
  KEY `test` (`primary_name`,`contact_id`,`mp_first`,`mp_last`,`ssn`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `case_tabs`
-- 

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

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `case_id` int(11) NOT NULL default '0',
  `number` varchar(24) default NULL,
  `client_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `cocounsel1` int(11) default NULL,
  `cocounsel2` int(11) default NULL,
  `office` char(3) default NULL,
  `problem` char(3) default NULL,
  `sp_problem` char(3) default NULL,
  `status` char(1) NOT NULL default '1',
  `open_date` date default NULL,
  `close_date` date default NULL,
  `close_code` char(3) default NULL,
  `reject_code` char(3) default NULL,
  `poten_conflicts` tinyint(4) NOT NULL default '1',
  `conflicts` tinyint(4) default NULL,
  `funding` char(3) default NULL,
  `undup` tinyint(4) default NULL,
  `referred_by` char(3) default NULL,
  `intake_type` char(3) default NULL,
  `intake_user_id` int(11) default NULL,
  `last_changed` timestamp NOT NULL,
  `created` timestamp NOT NULL default '00000000000000',
  `income` decimal(9,2) default NULL,
  `assets` decimal(9,2) default NULL,
  `poverty` decimal(5,2) default NULL,
  `income_type0` char(3) default NULL,
  `annual0` decimal(9,2) default NULL,
  `income_type1` char(3) default NULL,
  `annual1` decimal(9,2) default NULL,
  `income_type2` char(3) default NULL,
  `annual2` decimal(9,2) default NULL,
  `income_type3` char(3) default NULL,
  `annual3` decimal(9,2) default NULL,
  `income_type4` char(3) default NULL,
  `annual4` decimal(9,2) default NULL,
  `asset_type0` char(3) default '1',
  `asset0` decimal(9,2) default NULL,
  `asset_type1` char(3) default '2',
  `asset1` decimal(9,2) default NULL,
  `asset_type2` char(3) default '3',
  `asset2` decimal(9,2) default NULL,
  `asset_type3` char(3) default '4',
  `asset3` decimal(9,2) default NULL,
  `asset_type4` char(3) default '5',
  `asset4` decimal(9,2) default NULL,
  `adults` tinyint(4) default NULL,
  `children` tinyint(4) default NULL,
  `persons_helped` tinyint(4) default NULL,
  `citizen` char(3) default NULL,
  `citizen_check` tinyint(4) default NULL,
  `client_age` smallint(3) default NULL,
  `outcome` char(3) default NULL,
  `lsc_income_change` tinyint(4) default NULL,
  `just_income` char(3) default NULL,
  `main_benefit` varchar(4) default NULL,
  `sex_assault` tinyint(4) default NULL,
  `stalking` tinyint(4) default NULL,
  `case_county` varchar(25) default NULL,
  `rural` tinyint(4) default NULL,
  `good_story` tinyint(4) default NULL,
  `case_zip` varchar(15) default NULL,
  `elig_notes` varchar(150) default NULL,
  `cause_action` varchar(100) default NULL,
  `lit_status` char(3) default NULL,
  `judge_name` varchar(50) default NULL,
  `court_name` varchar(50) default NULL,
  `court_address` varchar(50) default NULL,
  `court_address2` varchar(50) default NULL,
  `court_city` varchar(25) default NULL,
  `court_state` varchar(25) default NULL,
  `court_zip` varchar(15) default NULL,
  `docket_number` varchar(20) default NULL,
  `date_filed` date default NULL,
  `protected` tinyint(4) default NULL,
  `why_protected` varchar(50) default NULL,
  `pba_id1` int(11) default NULL,
  `pba_id2` int(11) default NULL,
  `pba_id3` int(11) default NULL,
  `referral_date` date default NULL,
  `compensated` tinyint(4) default NULL,
  `thank_you_sent` tinyint(4) default NULL,
  `date_sent` date default NULL,
  `payment_received` tinyint(4) default NULL,
  `program_filed` tinyint(4) default NULL,
  `dollars_okd` decimal(8,2) default NULL,
  `hours_okd` decimal(8,2) default NULL,
  `destroy_date` date default NULL,
  `dom_viol` tinyint(4) default NULL,
  `veteran_household` date default NULL,
  `source_db` varchar(16) default NULL,
  `in_holding_pen` tinyint(4) default NULL,
  `doc1` int(11) default NULL,
  `doc2` int(11) default NULL,
  `vawa_served` tinyint(4) default NULL,
  PRIMARY KEY  (`case_id`),
  UNIQUE KEY `number` (`number`),
  KEY `client_id` (`client_id`),
  KEY `office` (`office`),
  KEY `problem` (`problem`),
  KEY `status` (`status`),
  KEY `funding` (`funding`),
  KEY `open_date` (`open_date`),
  KEY `close_date` (`close_date`),
  KEY `user_id` (`user_id`),
  KEY `cocounsel1` (`cocounsel1`),
  KEY `cocounsel2` (`cocounsel2`)
) ENGINE=MyISAM;

--
-- Table structure for table `conflict`
--

CREATE TABLE `conflict` (
  `conflict_id` int(11) NOT NULL default '0',
  `contact_id` int(11) NOT NULL default '0',
  `case_id` int(11) NOT NULL default '0',
  `relation_code` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`conflict_id`),
  KEY `contact_id` (`contact_id`),
  KEY `case_id` (`case_id`),
  KEY `relation_code` (`relation_code`)
) ENGINE=MyISAM;

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL default '0',
  `first_name` varchar(50) default NULL,
  `middle_name` varchar(25) default NULL,
  `last_name` varchar(50) NOT NULL default 'NONAME',
  `extra_name` varchar(10) default NULL,
  `alt_name` varchar(50) default NULL,
  `title` varchar(10) default NULL,
  `mp_first` varchar(8) default NULL,
  `mp_last` varchar(8) default NULL,
  `mp_alt` varchar(8) default NULL,
  `address` varchar(50) default NULL,
  `address2` varchar(50) default NULL,
  `city` varchar(25) default NULL,
  `state` varchar(25) default NULL,
  `zip` varchar(15) default NULL,
  `county` varchar(25) default NULL,
  `area_code` char(3) default NULL,
  `phone` varchar(15) default NULL,
  `phone_notes` varchar(50) default NULL,
  `area_code_alt` char(3) default NULL,
  `phone_alt` varchar(15) default NULL,
  `phone_notes_alt` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `org` varchar(35) default NULL,
  `birth_date` date default NULL,
  `ssn` varchar(11) default NULL,
  `language` char(3) default NULL,
  `gender` char(1) default NULL,
  `ethnicity` char(3) default NULL,
  `notes` text,
  `disabled` tinyint(4) default NULL,
  `residence` char(3) default NULL,
  `marital` char(3) default NULL,
  `frail` tinyint(4) default NULL,
  PRIMARY KEY  (`contact_id`),
  KEY `sorting` (`last_name`,`first_name`,`extra_name`,`middle_name`),
  KEY `mp_names` (`mp_last`,`mp_first`),
  KEY `ssn` (`ssn`),
  KEY `phone` (`phone`),
  KEY `phone_alt` (`phone_alt`)
) ENGINE=MyISAM;

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` char(16) NOT NULL default 'COUNTERNAME',
  `count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM;


-- 
-- Table structure for table `doc_storage`
-- 

CREATE TABLE `doc_storage` (
  `doc_id` int(11) NOT NULL default '0',
  `doc_name` varchar(255) NOT NULL default 'NONAME.txt',
  `doc_data` longblob,
  `doc_text` mediumtext,
  `doc_size` mediumint(9) default '0',
  `mime_type` varchar(255) default 'application/octet-stream',
  `doc_type` char(3) default 'C',
  `description` varchar(255) default NULL,
  `created` date default '0000-00-00',
  `case_id` int(11) default NULL,
  `user_id` int(11) default '0',
  `report_name` varchar(55) default NULL,
  `folder` tinyint(1) default '0',
  `folder_ptr` int(11) default NULL,
  PRIMARY KEY  (`doc_id`),
  KEY `case_id` (`case_id`),
  KEY `folder` (`folder`),
  KEY `folder_ptr` (`folder_ptr`),
  KEY `doc_type` (`doc_type`),
  KEY `report_name` (`report_name`)
) ENGINE=InnoDB;

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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` char(12) NOT NULL default 'NOGROUP',
  `read_office` char(64) default NULL,
  `read_all` tinyint(4) NOT NULL default '0',
  `edit_office` char(64) default NULL,
  `edit_all` tinyint(4) NOT NULL default '0',
  `users` tinyint(4) NOT NULL default '0',
  `pba` tinyint(4) NOT NULL default '0',
  `motd` tinyint(4) NOT NULL default '0',
  `reports` text default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM;

--
-- Table structure for table `motd`
--
CREATE TABLE `motd` (
  `motd_id` int(11) NOT NULL default '0',
  `user_id` int(11) default NULL,
  `full_name` varchar(80) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`motd_id`)
) ENGINE=MyISAM;

--
-- Table structure for table `pb_attorneys`
--

CREATE TABLE `pb_attorneys` (
  `pba_id` int(11) NOT NULL default '0',
  `atty_id` varchar(20) default NULL,
  `first_name` varchar(50) default NULL,
  `middle_name` varchar(20) default NULL,
  `last_name` varchar(50) default NULL,
  `extra_name` varchar(20) default NULL,
  `email` varchar(35) default NULL,
  `firm` varchar(25) default NULL,
  `phone_notes` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `address2` varchar(25) default NULL,
  `city` varchar(25) default NULL,
  `state` varchar(25) default NULL,
  `zip` varchar(15) default NULL,
  `county` varchar(50) default NULL,
  `languages` varchar(100) default NULL,
  `practice_areas` varchar(100) default NULL,
  `notes` varchar(50) default NULL,
  `last_case` date default NULL,
  `username` varchar(16) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT '0',
  `session_data` text,
  PRIMARY KEY  (`pba_id`)
) ENGINE=MyISAM;

--
-- Table structure for table `rss_feeds`
--

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


-- 
-- Table structure for table `settings`
-- 

CREATE TABLE settings (
  `label` char(255) NOT NULL default '',
  `value` text(255) NULL,
  PRIMARY KEY  (`label`)
) ENGINE=InnoDB;

INSERT INTO `settings` VALUES ('act_interval','0'),('admin_email','admin@legalaidprogram'),('autonumber_on_new_case','1'),('cookie_prefix','Pika CMS at Legal Services Program'),('enable_benchmark','0'),('enable_compression','1'),('enable_system','1'),('force_https','1'),('owner_name','Legal Services Program'),('password_expire','0'),('pass_min_length','8'),('pass_min_strength','3'),('session_timeout','28800'),('time_zone','America/New_York'),('time_zone_offset','0');

-- 
-- Table structure for table `transfer_options`
-- 

CREATE TABLE `transfer_options` (
  `transfer_option_id` int(11) NOT NULL default '0',
  `label` varchar(64) NOT NULL default 'NONAME',
  `url` varchar(128) NOT NULL default '',
  `transfer_mode` tinyint(4) default '1',
  `user` varchar(32) default NULL,
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`transfer_option_id`)
) ENGINE=MyISAM;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL default '0',
  `username` varchar(25) NOT NULL default '',
  `password` varchar(128) NOT NULL default '',
  `enabled` tinyint(4) NOT NULL default '0',
  `group_id` varchar(12) NOT NULL default 'NOGROUP',
  `first_name` varchar(50) default NULL,
  `middle_name` varchar(20) default NULL,
  `last_name` varchar(50) default 'NONAME',
  `extra_name` varchar(20) default NULL,
  `description` varchar(30) default NULL,
  `email` varchar(35) default NULL,
  `attorney` tinyint(4) default NULL,
  `atty_id` varchar(20) default NULL,
  `session_data` text,
  `firm` varchar(64) default NULL,
  `address` varchar(64) default NULL,
  `address2` varchar(64) default NULL,
  `city` varchar(24) default NULL,
  `state` varchar(24) default NULL,
  `zip` varchar(15) default NULL,
  `county` varchar(64) default NULL,
  `phone_notes` varchar(64) default NULL,
  `languages` varchar(64) default NULL,
  `practice_areas` varchar(64) default NULL,
  `notes` varchar(255) default NULL,
  `last_case` date default NULL,
  `password_expire` int(11) default '0',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM;

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `user_session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logout` tinyint(1) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_session_id`),
  UNIQUE KEY `session_id_value` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `enabled` (`logout`)
) ENGINE=MyISAM;

--
-- Table structure for table `zip_codes`
--

CREATE TABLE `zip_codes` (
  `city` char(30) default NULL,
  `state` char(2) default NULL,
  `zip` char(5) default NULL,
  `area_code` char(3) default NULL,
  `county` char(27) default NULL
) ENGINE=MyISAM;

-- MySQL dump 9.11
--
-- Host: localhost    Database: danio
-- ------------------------------------------------------
-- Server version	4.0.24-standard

--
-- Table structure for table `menu_act_type`
--

CREATE TABLE `menu_act_type` (
  `value` char(1) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_act_type`
--

LOCK TABLES `menu_act_type` WRITE;
INSERT INTO `menu_act_type` VALUES ('N','Case Note',0),('L','LSC Other Services',1),('T','Time Slip',2),('K','Tickler',3),('C','Appointment',4);
UNLOCK TABLES;

--
-- Table structure for table `menu_annotate_activities`
--

CREATE TABLE `menu_annotate_activities` (
  `value` char(32) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_annotate_activities`
--

LOCK TABLES `menu_annotate_activities` WRITE;
INSERT INTO `menu_annotate_activities` VALUES ('act_id', 'act_id', 0);
INSERT INTO `menu_annotate_activities` VALUES ('act_date', 'Activity Date', 1);
INSERT INTO `menu_annotate_activities` VALUES ('act_time', 'Activity Start Time', 2);
INSERT INTO `menu_annotate_activities` VALUES ('act_end_time', 'Activity End Time', 3);
INSERT INTO `menu_annotate_activities` VALUES ('hours', 'Hours', 4);
INSERT INTO `menu_annotate_activities` VALUES ('completed', 'Completed', 5);
INSERT INTO `menu_annotate_activities` VALUES ('act_type', 'Type of Activity', 6);
INSERT INTO `menu_annotate_activities` VALUES ('category', 'Category', 7);
INSERT INTO `menu_annotate_activities` VALUES ('case_id', 'case_id', 8);
INSERT INTO `menu_annotate_activities` VALUES ('user_id', 'User ID', 9);
INSERT INTO `menu_annotate_activities` VALUES ('pba_id', 'PBA ID', 10);
INSERT INTO `menu_annotate_activities` VALUES ('funding', 'Funding Source Code', 11);
INSERT INTO `menu_annotate_activities` VALUES ('summary', 'Summary', 12);
INSERT INTO `menu_annotate_activities` VALUES ('notes', 'Notes', 13);
INSERT INTO `menu_annotate_activities` VALUES ('last_changed', 'Last Updated', 14);
INSERT INTO `menu_annotate_activities` VALUES ('om_code', 'LSC OS Code', 15);
INSERT INTO `menu_annotate_activities` VALUES ('ph_measured', 'LSC OS PH Measured', 16);
INSERT INTO `menu_annotate_activities` VALUES ('ph_estimated', 'LSC OS PH Estimated', 17);
INSERT INTO `menu_annotate_activities` VALUES ('estimate_notes', 'LSC OS Estimate Notes', 18);
INSERT INTO `menu_annotate_activities` VALUES ('act_end_date', 'Activity End Date', 19);
INSERT INTO `menu_annotate_activities` VALUES ('problem', 'LSC Problem Code', 20);
INSERT INTO `menu_annotate_activities` VALUES ('location', 'Location', 21);
INSERT INTO `menu_annotate_activities` VALUES ('media_items', 'OS Media Items', 22);
UNLOCK TABLES;

--
-- Table structure for table `menu_annotate_cases`
--

CREATE TABLE `menu_annotate_cases` (
  `value` char(32) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_annotate_cases`
--

LOCK TABLES `menu_annotate_cases` WRITE;
INSERT INTO `menu_annotate_cases` VALUES ('number', 'Case Number', 0);
INSERT INTO `menu_annotate_cases` VALUES ('user_id', 'Primary Attorney ID', 1);
INSERT INTO `menu_annotate_cases` VALUES ('cocounsel1', 'Co-counsel #1 ID', 2);
INSERT INTO `menu_annotate_cases` VALUES ('cocounsel2', 'Co-counsel #2 ID', 3);
INSERT INTO `menu_annotate_cases` VALUES ('office', 'Office Code', 4);
INSERT INTO `menu_annotate_cases` VALUES ('problem', 'LSC Problem Code', 5);
INSERT INTO `menu_annotate_cases` VALUES ('sp_problem', 'Special Problem Code', 6);
INSERT INTO `menu_annotate_cases` VALUES ('status', 'Case Status', 7);
INSERT INTO `menu_annotate_cases` VALUES ('open_date', 'Open Date', 8);
INSERT INTO `menu_annotate_cases` VALUES ('close_date', 'Closing Date', 9);
INSERT INTO `menu_annotate_cases` VALUES ('close_code', 'Closing Code', 10);
INSERT INTO `menu_annotate_cases` VALUES ('reject_code', 'Rejection Code', 11);
INSERT INTO `menu_annotate_cases` VALUES ('poten_conflicts', 'Potential Conflicts Exist', 12);
INSERT INTO `menu_annotate_cases` VALUES ('conflicts', 'Conflicts Exist', 13);
INSERT INTO `menu_annotate_cases` VALUES ('funding', 'Funding Source Code', 14);
INSERT INTO `menu_annotate_cases` VALUES ('undup', 'LSC Unduplicated Service', 15);
INSERT INTO `menu_annotate_cases` VALUES ('referred_by', 'Referred By', 16);
INSERT INTO `menu_annotate_cases` VALUES ('intake_type', 'Type of Intake', 17);
INSERT INTO `menu_annotate_cases` VALUES ('intake_user_id', 'Intake User ID', 18);
INSERT INTO `menu_annotate_cases` VALUES ('last_changed', 'Last Changed Date', 19);
INSERT INTO `menu_annotate_cases` VALUES ('created', 'Created Date', 20);
INSERT INTO `menu_annotate_cases` VALUES ('income', 'Total Income', 21);
INSERT INTO `menu_annotate_cases` VALUES ('assets', 'Total Assets', 22);
INSERT INTO `menu_annotate_cases` VALUES ('poverty', '% of Poverty', 23);
INSERT INTO `menu_annotate_cases` VALUES ('adults', '# Adults', 24);
INSERT INTO `menu_annotate_cases` VALUES ('children', '# Children', 25);
INSERT INTO `menu_annotate_cases` VALUES ('persons_helped', '# Persons Helped', 26);
INSERT INTO `menu_annotate_cases` VALUES ('citizen', 'Citizenship Status', 27);
INSERT INTO `menu_annotate_cases` VALUES ('citizen_check', 'Citizenship Verified', 28);
INSERT INTO `menu_annotate_cases` VALUES ('client_age', 'Primary Client Age', 29);
INSERT INTO `menu_annotate_cases` VALUES ('dom_viol', 'Domestic Violence', 30);
INSERT INTO `menu_annotate_cases` VALUES ('outcome', 'Outcome', 31);
INSERT INTO `menu_annotate_cases` VALUES ('just_income', 'Income Justification', 32);
INSERT INTO `menu_annotate_cases` VALUES ('main_benefit', 'Main Benefit', 33);
INSERT INTO `menu_annotate_cases` VALUES ('sex_assault', 'Sexual Assault', 34);
INSERT INTO `menu_annotate_cases` VALUES ('stalking', 'Stalking', 35);
INSERT INTO `menu_annotate_cases` VALUES ('case_county', 'Case County', 36);
INSERT INTO `menu_annotate_cases` VALUES ('rural', 'Rural', 37);
INSERT INTO `menu_annotate_cases` VALUES ('good_story', 'Good Story', 38);
INSERT INTO `menu_annotate_cases` VALUES ('case_zip', 'Case Zipcode', 39);
INSERT INTO `menu_annotate_cases` VALUES ('elig_notes', 'Eligibility Notes', 40);
INSERT INTO `menu_annotate_cases` VALUES ('cause_action', 'Cause of Action', 41);
INSERT INTO `menu_annotate_cases` VALUES ('lit_status', 'Litigation Status', 42);
INSERT INTO `menu_annotate_cases` VALUES ('judge_name', 'Judge Name', 43);
INSERT INTO `menu_annotate_cases` VALUES ('court_name', 'Court Name', 44);
INSERT INTO `menu_annotate_cases` VALUES ('court_address', 'Court Address Line 1', 45);
INSERT INTO `menu_annotate_cases` VALUES ('court_address2', 'Court Address Line 2', 46);
INSERT INTO `menu_annotate_cases` VALUES ('court_city', 'Court City', 47);
INSERT INTO `menu_annotate_cases` VALUES ('court_state', 'Court State', 48);
INSERT INTO `menu_annotate_cases` VALUES ('court_zip', 'Court Zip', 49);
INSERT INTO `menu_annotate_cases` VALUES ('docket_number', 'Docket Number', 50);
INSERT INTO `menu_annotate_cases` VALUES ('date_filed', 'Filed Date', 51);
INSERT INTO `menu_annotate_cases` VALUES ('protected', 'Protected Information', 52);
INSERT INTO `menu_annotate_cases` VALUES ('why_protected', 'Reason Protected', 53);
INSERT INTO `menu_annotate_cases` VALUES ('pba_id1', 'PBA ID #1', 54);
INSERT INTO `menu_annotate_cases` VALUES ('pba_id2', 'PBA ID #2', 55);
INSERT INTO `menu_annotate_cases` VALUES ('pba_id3', 'PBA ID #3', 56);
INSERT INTO `menu_annotate_cases` VALUES ('referral_date', 'Referral Date', 57);
INSERT INTO `menu_annotate_cases` VALUES ('compensated', 'Compensated', 58);
INSERT INTO `menu_annotate_cases` VALUES ('thank_you_sent', 'Thank You Letter Sent', 59);
INSERT INTO `menu_annotate_cases` VALUES ('date_sent', 'Sent Date', 60);
INSERT INTO `menu_annotate_cases` VALUES ('payment_received', 'Payment Received', 61);
INSERT INTO `menu_annotate_cases` VALUES ('program_filed', 'Program Filed', 62);
INSERT INTO `menu_annotate_cases` VALUES ('dollars_okd', 'Dollars OKD', 63);
INSERT INTO `menu_annotate_cases` VALUES ('hours_okd', 'Hours OKD', 64);
INSERT INTO `menu_annotate_cases` VALUES ('destroy_date', 'Destroy Date', 65);
INSERT INTO `menu_annotate_cases` VALUES ('in_holding_pen', 'In Holding Pen', 66);
INSERT INTO `menu_annotate_cases` VALUES ('vawa_served', 'VAWA Service Level', 67);
UNLOCK TABLES;

--
-- Table structure for table `menu_annotate_contacts`
--

CREATE TABLE `menu_annotate_contacts` (
  `value` char(32) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_annotate_contacts`
--

LOCK TABLES `menu_annotate_contacts` WRITE;
INSERT INTO `menu_annotate_contacts` VALUES ('contact_id', 'contact_id', 0);
INSERT INTO `menu_annotate_contacts` VALUES ('first_name', 'First Name', 1);
INSERT INTO `menu_annotate_contacts` VALUES ('middle_name', 'Middle Name', 2);
INSERT INTO `menu_annotate_contacts` VALUES ('last_name', 'Last Name', 3);
INSERT INTO `menu_annotate_contacts` VALUES ('extra_name', 'Extra Name', 4);
INSERT INTO `menu_annotate_contacts` VALUES ('alt_name', 'Alternative Name', 5);
INSERT INTO `menu_annotate_contacts` VALUES ('title', 'Title/Position', 6);
INSERT INTO `menu_annotate_contacts` VALUES ('mp_first', 'mp_first', 7);
INSERT INTO `menu_annotate_contacts` VALUES ('mp_last', 'mp_last', 8);
INSERT INTO `menu_annotate_contacts` VALUES ('mp_alt', 'mp_alt', 9);
INSERT INTO `menu_annotate_contacts` VALUES ('address', 'Address Line 1', 10);
INSERT INTO `menu_annotate_contacts` VALUES ('address2', 'Address Line 2', 11);
INSERT INTO `menu_annotate_contacts` VALUES ('city', 'City', 12);
INSERT INTO `menu_annotate_contacts` VALUES ('state', 'State', 13);
INSERT INTO `menu_annotate_contacts` VALUES ('zip', 'Zipcode', 14);
INSERT INTO `menu_annotate_contacts` VALUES ('county', 'County', 15);
INSERT INTO `menu_annotate_contacts` VALUES ('area_code', 'Area Code', 16);
INSERT INTO `menu_annotate_contacts` VALUES ('phone', 'Phone', 17);
INSERT INTO `menu_annotate_contacts` VALUES ('phone_notes', 'Phone Notes', 18);
INSERT INTO `menu_annotate_contacts` VALUES ('area_code_alt', 'Alt. Area Code', 19);
INSERT INTO `menu_annotate_contacts` VALUES ('phone_alt', 'Alt Phone', 20);
INSERT INTO `menu_annotate_contacts` VALUES ('phone_notes_alt', 'Alt. Phone Notes', 21);
INSERT INTO `menu_annotate_contacts` VALUES ('email', 'E-mail', 22);
INSERT INTO `menu_annotate_contacts` VALUES ('org', 'Organization', 23);
INSERT INTO `menu_annotate_contacts` VALUES ('birth_date', 'Date of Birth', 24);
INSERT INTO `menu_annotate_contacts` VALUES ('ssn', 'Social Security Number', 25);
INSERT INTO `menu_annotate_contacts` VALUES ('language', 'Language', 26);
INSERT INTO `menu_annotate_contacts` VALUES ('gender', 'Gender', 27);
INSERT INTO `menu_annotate_contacts` VALUES ('ethnicity', 'Ethnicity', 28);
INSERT INTO `menu_annotate_contacts` VALUES ('notes', 'Notes', 29);
INSERT INTO `menu_annotate_contacts` VALUES ('disabled', 'Disabled', 30);
INSERT INTO `menu_annotate_contacts` VALUES ('residence', 'Residence', 31);
INSERT INTO `menu_annotate_contacts` VALUES ('marital', 'Marital Status', 32);
INSERT INTO `menu_annotate_contacts` VALUES ('frail', 'Frail/Needy', 33);
UNLOCK TABLES;


--
-- Table structure for table `menu_asset_type`
--

CREATE TABLE `menu_asset_type` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_asset_type`
--

LOCK TABLES `menu_asset_type` WRITE;
INSERT INTO `menu_asset_type` VALUES ('1','Personal Property',0),('2','Real Property',1),('3','Checking',2),('4','Savings',3),('5','Automobile',4),('9','Other',5);
UNLOCK TABLES;

--
-- Table structure for table `menu_attorney_status`
--

CREATE TABLE `menu_attorney_status` (
  `value` char(1) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_attorney_status`
--

LOCK TABLES `menu_attorney_status` WRITE;
INSERT INTO `menu_attorney_status` VALUES ('0','N/A',0),('1','Staff',1),('2','Volunteer',2);
UNLOCK TABLES;

--
-- Table structure for table `menu_case_status`
--

CREATE TABLE `menu_case_status` (
  `value` char(1) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_case_status`
--

LOCK TABLES `menu_case_status` WRITE;
INSERT INTO `menu_case_status` VALUES ('1','Pending',0),('2','Accepted',1),('5','Accepted/PAI',2),('4','Transferred',3),('6','Not Served',4);
UNLOCK TABLES;


--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
INSERT INTO `menu_category` VALUES ('Cl','C1---Phone call or interview',0),('C2','C2---Review pleadings/correspondence',1),('C3','C3---Draft pleadings/correspondence',2),('C4','C4---Legal research/analysis',3),('C5','C5---Discovery/investigation',4),('C6','C6---Negotiations',5),('C7','C7---Hearing/trial preparation',6),('C8','C8---Administrative appearance',7),('C9','C9---Court appearance',8),('C10','C10--Travel',9),('C11','C11--Consultation re: case/client',10),('C12','C12--Grievances from clients',11),('C13','C13--Volunteer cases',12),('C14','C14--Appellate work',13),('C15','C15--Community work',14),('C16','C16--Legislative work',15),('C17','C17--Other',16),('M10','M10--Intake',17),('M11','M11--Grievances from non-clients',18),('M12','M12--Case acceptance and unit meetings',19),('M13','M13--Case review',20),('M20','M20--Outreach',21),('M21','M21--Community legal education',22),('M22','M22--Pro se and self-help',23),('M23','M23--Legal training of lay service providers',24),('M24','M24--Hotlines, questions/referrals',25),('M25','M25--Other collaboration and impact work',26),('M31','M31--Bar activities',27),('M32','M32--Volunteer recruitment/maintenance',28),('M33','M33--Placement efforts',29),('M34','M34--Training the bar, developing materials',30),('M35','M35--PBI administration.',31),('M40','M40--Training & task forces',32),('M41','M41--Tracking legal developments',33),('M50','M50--Supervising cases/matters',34),('M51','M51--Program management',35),('M52','M52--Training others, developing materials',36),('M60','M60--Matters travel',37),('M61','M61--Other/miscellaneous',38),('S10','S10--Supervision/personnel',39),('S11','S11--Evaluations',40),('S12','S12--Recruitment and hiring',41),('S13','S13--Union',42),('S21','S21--Office management',43),('S22','S22--Program management',44),('S23','S23--Fundraising',45),('S24','S24--Grants administration',46),('S25','S25--Training others, developing materials',47),('S26','S26--Boards',48),('S31','S31--Supporting Activities travel',49),('S32','S32--Time keeping',50),('S33','S33--Other/miscellaneous',51),('X1','X1---Vacation & Compensatory Leave',52),('X2','X2---Sick leave',53),('X3','X3---Holidays',54),('X4','X4---Other paid leave',55),('X5','X5---Leave without pay',56);
UNLOCK TABLES;

--
-- Table structure for table `menu_citizen`
--

CREATE TABLE `menu_citizen` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_citizen`
--

LOCK TABLES `menu_citizen` WRITE;
INSERT INTO `menu_citizen` VALUES ('A','Citizen',0),('B','Eligible Alien',1),('C','Undocumented Alien',2);
UNLOCK TABLES;

--
-- Table structure for table `menu_close_code`
--

CREATE TABLE `menu_close_code` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_close_code`
--

INSERT INTO `menu_close_code` VALUES ('A', 'Counsel and Advice', 0);
INSERT INTO `menu_close_code` VALUES ('B', 'Limited Action', 1);
INSERT INTO `menu_close_code` VALUES ('F', 'Negot. Settlement (w/o Lit.)', 2);
INSERT INTO `menu_close_code` VALUES ('G', 'Negot. Settlement (w/ Lit.)', 3);
INSERT INTO `menu_close_code` VALUES ('H', 'Admin. Agency Decision', 4);
INSERT INTO `menu_close_code` VALUES ('IA', 'Uncontested Court Decision', 5);
INSERT INTO `menu_close_code` VALUES ('IB', 'Contested Court Decision', 6);
INSERT INTO `menu_close_code` VALUES ('IC', 'Appeals', 7);
INSERT INTO `menu_close_code` VALUES ('K', 'Other', 8);
INSERT INTO `menu_close_code` VALUES ('L', 'Extensive Service', 9);

-- 
-- Table structure for table `menu_close_code_2007`
-- 

CREATE TABLE `menu_close_code_2007` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_close_code_2007`
-- 

LOCK TABLES `menu_close_code_2007` WRITE;
INSERT INTO `menu_close_code_2007` VALUES ('A', 'Counsel and Advice', 0);
INSERT INTO `menu_close_code_2007` VALUES ('B', 'Brief Service', 1);
INSERT INTO `menu_close_code_2007` VALUES ('C', 'Referred after Legal Assess.', 2);
INSERT INTO `menu_close_code_2007` VALUES ('D', 'Insufficient Merit to Proceed', 3);
INSERT INTO `menu_close_code_2007` VALUES ('E', 'Client Withdrew', 4);
INSERT INTO `menu_close_code_2007` VALUES ('F', 'Negot. Settlement (w/o Lit.)', 5);
INSERT INTO `menu_close_code_2007` VALUES ('G', 'Negot. Settlement (w/ Lit.)', 6);
INSERT INTO `menu_close_code_2007` VALUES ('H', 'Admin. Agency Decision', 7);
INSERT INTO `menu_close_code_2007` VALUES ('I', 'Court Decision', 8);
INSERT INTO `menu_close_code_2007` VALUES ('J', 'Change in Eligibility Status', 9);
INSERT INTO `menu_close_code_2007` VALUES ('K', 'Other', 10);
UNLOCK TABLES;

-- 
-- Table structure for table `menu_close_code_2008`
-- 

CREATE TABLE `menu_close_code_2008` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_close_code_2008`
-- 

LOCK TABLES `menu_close_code_2008` WRITE;
INSERT INTO `menu_close_code_2008` VALUES ('A', 'Counsel and Advice', 0);
INSERT INTO `menu_close_code_2008` VALUES ('B', 'Limited Action', 1);
INSERT INTO `menu_close_code_2008` VALUES ('F', 'Negot. Settlement (w/o Lit.)', 2);
INSERT INTO `menu_close_code_2008` VALUES ('G', 'Negot. Settlement (w/ Lit.)', 3);
INSERT INTO `menu_close_code_2008` VALUES ('H', 'Admin. Agency Decision', 4);
INSERT INTO `menu_close_code_2008` VALUES ('IA', 'Uncontested Court Decision', 5);
INSERT INTO `menu_close_code_2008` VALUES ('IB', 'Contested Court Decision', 6);
INSERT INTO `menu_close_code_2008` VALUES ('IC', 'Appeals', 7);
INSERT INTO `menu_close_code_2008` VALUES ('K', 'Other', 8);
INSERT INTO `menu_close_code_2008` VALUES ('L', 'Extensive Service', 9);
UNLOCK TABLES;

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
-- Dumping data for table `menu_comparison`
-- 

LOCK TABLES `menu_comparison` WRITE;
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
-- Table structure for table `menu_comparison_sql`
-- 

CREATE TABLE `menu_comparison_sql` (
  `value` varchar(25) NOT NULL default '0',
  `label` varchar(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menu_comparison_sql`
-- 

LOCK TABLES `menu_comparison_sql` WRITE;
INSERT INTO `menu_comparison_sql` VALUES ('=', '=', 0);
INSERT INTO `menu_comparison_sql` VALUES ('LIKE', '= (wildcard match)', 1);
INSERT INTO `menu_comparison_sql` VALUES ('!=', 'NOT =', 2);
INSERT INTO `menu_comparison_sql` VALUES ('>', '&gt;', 3);
INSERT INTO `menu_comparison_sql` VALUES ('<', '&lt;', 4);
INSERT INTO `menu_comparison_sql` VALUES ('between', 'between', 5);
INSERT INTO `menu_comparison_sql` VALUES ('is blank', 'is blank', 6);
INSERT INTO `menu_comparison_sql` VALUES ('is not blank', 'is not blank', 7);
UNLOCK TABLES;

--
-- Table structure for table `menu_disposition`
--

CREATE TABLE `menu_disposition` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_disposition`
--

LOCK TABLES `menu_disposition` WRITE;
INSERT INTO `menu_disposition` VALUES ('11','Dismissed by Court',11),('12','Convicted: At Trial--Top Count',12),('13','Acquitted',13),('15','Convicted: At Trial--Lesser',15),('17','Extradited',17),('18','Conviction: By Plea-- Lesser',18),('28','Bench Warrant Issued',28),('31','ACD',31),('32','Relieved-LAS/18-B',32),('33','Relieved-Retained Counsel',33),('35','Conviction: By Plea--Top Count',35),('34','Transfered to different court',34),('36','Remand to Family Court',36),('37','Dismissed by Grand Jury',37),('38','Cut Slip Ordered',38),('39','Warrant Vacated',39),('40','Conflict Of Interest',40),('41','Dismissed by Prosecution',41),('42','Dismissed & Sealed',42),('43','Abated',43),('44','Hung Jury',44),('45','Consolidated',45),('46','Resentenced',46),('47','Resentenced to Probation',47),('48','Bench Trial-Guilty',48),('49','Bench Trial-Not Guilty',49),('50','Jury Trial-Guilty',50),('51','Jury Trial-Not Guilty',51),('52','No True Bill',52),('53','VOCD',53),('54','VOCD',54),('55','Relieved-Retained PVT. Counsel',55),('56','Dismissed-No True Bill',56),('57','D-730 EXAM',57),('58','Transferred to Family Court',58),('59','Probation Terminated',59);
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

LOCK TABLES `menu_doc_type` WRITE; 
INSERT INTO `menu_doc_type` VALUES ('C', 'Case Files', 0);
INSERT INTO `menu_doc_type` VALUES ('U', 'User Files', 1);
INSERT INTO `menu_doc_type` VALUES ('F', 'Forms', 2);
INSERT INTO `menu_doc_type` VALUES ('R', 'Saved Report Files', 3);
UNLOCK TABLES;

--
-- Table structure for table `menu_dom_viol`
--

CREATE TABLE `menu_dom_viol` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_dom_viol`
--

LOCK TABLES `menu_dom_viol` WRITE;
INSERT INTO `menu_dom_viol` VALUES ('0','No',0),('1','Yes - Abuse to Female',1),('2','Yes - Abuse to Male',2),('3','Yes (Don\'t Use)',3);
UNLOCK TABLES;

--
-- Table structure for table `menu_ethnicity`
--

CREATE TABLE `menu_ethnicity` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_ethnicity`
--

LOCK TABLES `menu_ethnicity` WRITE;
INSERT INTO `menu_ethnicity` VALUES ('10','White',0),('20','Black',1),('30','Hispanic',2),('40','Native American',3),('50','Asian, Pacific Islander',4),('99','Other',6);
UNLOCK TABLES;

--
-- Table structure for table `menu_funding`
--

CREATE TABLE `menu_funding` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_funding`
--

LOCK TABLES `menu_funding` WRITE;
INSERT INTO `menu_funding` VALUES ('1','LSC',0),('2','IOLTA',1),('3','HUD - FHIP',2),('4','Title III',3);
UNLOCK TABLES;

--
-- Table structure for table `menu_gender`
--

CREATE TABLE `menu_gender` (
  `value` char(1) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_gender`
--

LOCK TABLES `menu_gender` WRITE;
INSERT INTO `menu_gender` VALUES ('F','Female',0),('M','Male',1);
UNLOCK TABLES;

--
-- Table structure for table `menu_income_freq`
--

CREATE TABLE `menu_income_freq` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_income_freq`
--

LOCK TABLES `menu_income_freq` WRITE;
INSERT INTO `menu_income_freq` VALUES ('A','Annual',0),('M','Monthly',1),('B','Bi-Weekly',2),('W','Weekly',3);
UNLOCK TABLES;

--
-- Table structure for table `menu_income_type`
--

CREATE TABLE `menu_income_type` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_income_type`
--

LOCK TABLES `menu_income_type` WRITE;
INSERT INTO `menu_income_type` VALUES ('9','Spousal Maint.',0),('11','Worker\'s Comp.',1),('12','Disability',2),('1','Employment',3),('4','General Assistance',4),('3','SSI',5),('6','Child Support',6),('8','No Income',7),('18','Other',8),('13','Pension',9),('2','Social Security',10),('14','Trust, Interest, Div.',11),('15','Unemployment',12),('16','Veteran Benefits',13),('17','Senior, Unknown',14);
UNLOCK TABLES;

--
-- Table structure for table `menu_intake_type`
--

CREATE TABLE `menu_intake_type` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_intake_type`
--

LOCK TABLES `menu_intake_type` WRITE;
INSERT INTO `menu_intake_type` VALUES ('T','Telephone',0),('W','Walk-In',1),('C','Circuit Rider',2),('L','Letter',3);
UNLOCK TABLES;

--
-- Table structure for table `menu_just_income`
--

CREATE TABLE `menu_just_income` (
  `value` char(3) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_just_income`
--

LOCK TABLES `menu_just_income` WRITE;
INSERT INTO `menu_just_income` VALUES ('A','Govmt. Benefits Program',0),('B','High medical expenses',1),('C','Lack of Affordable Altern.',2),('D','Title III',3);
UNLOCK TABLES;

--
-- Table structure for table `menu_language`
--

CREATE TABLE `menu_language` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_language`
--

LOCK TABLES `menu_language` WRITE;
INSERT INTO `menu_language` VALUES ('A','Albanian',0),('B','Cambodian',1),('C','Creole',2),('D','Somali',3),('E','English',4),('F','French',6),('G','German',7),('H','Sign Language',8),('I','Italian',9),('J','Japanese',10),('K','Korean',11),('L','Hmong',12),('M','Mandarin',13),('O','Other',14),('P','Polish',15),('R','Russian',16),('S','Spanish',17),('T','Turkish',18),('V','Vietnamese',19),('W','Serbian',20),('X','Cantonese',21),('Y','Yiddish',22);
UNLOCK TABLES;

--
-- Table structure for table `menu_lit_status`
--

CREATE TABLE `menu_lit_status` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_lit_status`
--

LOCK TABLES `menu_lit_status` WRITE;
INSERT INTO `menu_lit_status` VALUES ('1','Defendant',0),('2','Petitioner',1),('3','Plaintiff',2),('4','Respondent',3),('5','Appellant',4);
UNLOCK TABLES;

--
-- Table structure for table `menu_lsc_income_change`
--

CREATE TABLE `menu_lsc_income_change` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

LOCK TABLES `menu_lsc_income_change` WRITE;
INSERT INTO `menu_lsc_income_change` VALUES ('0', 'Not Likely to Change', 0);
INSERT INTO `menu_lsc_income_change` VALUES ('1', 'Likely to Increase', 1);
INSERT INTO `menu_lsc_income_change` VALUES ('2', 'Likely to Decrease', 2);
UNLOCK TABLES;

--
-- Table structure for table `menu_lsc_other_matters`
--

CREATE TABLE `menu_lsc_other_services` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_lsc_other_services`
--

LOCK TABLES `menu_lsc_other_services` WRITE;
INSERT INTO `menu_lsc_other_services` VALUES ('101','101 - Presentations to community groups',0),('102','102 - Legal education brochures',1),('103','103 - Legal education materials posted on web sites',2),('104','104 - Newsletter articles addressing Legal Ed topics',3),('105','105 - Video legal education materials',4),('109','109 - Other CLE',5),('111','111 - Workshops or Clinics',6),('112','112 - Help desk at court',7),('113','113 - Self-help printed materials (e.g. divorce kits)',8),('114','114 - Self-help materials posted on web site',9),('115','115 - Self-help materials posted on kiosks',10),('119','119 - Other Pro Se assistance',11),('121','121 - Referred to other provider of civil legal services',12),('122','122 - Referred to private bar',13),('123','123 - Referred to provider of human or social services',14),('129','129 - Referred to other source of  assistance',15);
UNLOCK TABLES;

--
-- Table structure for table `menu_main_benefit`
--

CREATE TABLE `menu_main_benefit` (
  `value` char(4) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` smallint NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_main_benefit`
--

LOCK TABLES `menu_main_benefit` WRITE;
INSERT INTO `menu_main_benefit` VALUES ('0000','0000 00 No Main Benefit for Client',0),('0101','0101 01 Obtained federal bankruptcy protection',1),('0201','0201 02 Stopped debt collection harassment',2),('0301','0301 03 Overcame illegal sales contracts and/or warranties',3),('0401','0401 04 Overcame discrimination in obtaining credit',4),('0501','0501 05 Prevented or overcame utility termination',5),('0601','0601 06 Loans/Installment Purch.',6),('0701','0701 07 Prevented or overcame utility termination',7),('0801','0801 08 Unfair Sales Practices',8),('0901','0901 09 Obtained advice, brief services or referral on Consumer matter',9),('1103','1103 11 Obtained advice, brief services or referral on an Ed. matter',10),('2101','2101 21 Overcame job discrimination',11),('2201','2201 22 Obtained wages due',12),('2903','2903 29 Obtained advice, brief services or referral on Employment. matter',13),('3001','3001 30 Successful Adoption',14),('3102','3102 31 Obtained or preserved right to visitation',15),('3201','3201 32 Obtained a divorce, legal separation, or annulment',16),('3302','3302 33 Obtained guardianship for adoption for dependent child',17),('3401','3401 34 Name Change',18),('3501','3501 35 Prevented termination of parental rights',19),('3601','3601 36 Established paternity for a child',20),('3701','3701 37 Obtained protective order for victim of domestic violence',21),('3802','3802 38 Removed/Reduced Unfair Child Support',22),('3901','3901 39 Obtained advice, brief services or referral on a Family matter',23),('4101','4101 41 Delinquent',24),('4203','4203 42 Obtained advice, brief services or referral on Juvenile matter',25),('4901','4901 49 Other Juvenile',26),('5101','5101 51 Gained access to Medicare or Medicaid provider',27),('5201','5201 52 Obtained/preserved/increased Medicare or Medicaid benefits/rights',28),('5907','5907 59 Obtained advice, brief services or referral on a Health matter',29),('6101','6101 61 Obtained access to housing',30),('6201','6201 62 Avoided foreclosure or other loss of home',31),('6305','6305 63 Obtained repairs to dwelling',32),('6401','6401 64 Prevented denial of public housing tenant\'s rights',33),('6902','6902 69 Obtained advice, brief services or referral on a Housing matter',34),('7101','7101 71 Obtained/preserved/increased AFDC/other welfare benefit/right',35),('7201','7201 72 Black Lung',36),('7301','7301 73 Obtained/preserved/increased food stamps eligibility/right',37),('7401','7401 74 Social Security',38),('7501','7501 75 Obtained/preserved/increased SSI/SSD benefit/right',39),('7601','7601 76 Obtained/preserved/increased Unemployment comp. benefit/right',40),('7701','7701 77 Obtained/preserved/increased Veterans Benefits',41),('7801','7801 78 Obtained/preserved/increased Worker\'s Compensation',42),('7901','7901 79 Obtained advice, brief services or referral on an Income M. matter',43),('8105','8105 81 Other Immigration Benefit',44),('8201','8201 82 Mental Health',45),('8301','8301 83 Prisoner\'s Rights',46),('8402','8402 84 Obtained/preserved/increased benefits/rights of instit. persons',47),('8901','8901 89 Obtained advice, brief services or referral on an Ind. Rights matter',48),('9102','9102 91 Obtained assistance with other structural or governance issues.',49),('9201','9201 92 Indian / Tribal Law',50),('9301','9301 93 Overcame illegal taking of or restriction to a driver\'s license',51),('9401','9401 94 Defended a Torts action',52),('9502','9502 95 Obtained a living will or health proxy or power of attorney',53),('9901','9901 99 Obtained other benefit',54);
UNLOCK TABLES;

--
-- Table structure for table `menu_marital`
--

CREATE TABLE `menu_marital` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_marital`
--

LOCK TABLES `menu_marital` WRITE;
INSERT INTO `menu_marital` VALUES ('S','Single',0),('M','Married',1),('D','Divorced',2),('W','Widowed',3),('P','Separated',4);
UNLOCK TABLES;

--
-- Table structure for table `menu_office`
--

CREATE TABLE `menu_office` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_office`
--

LOCK TABLES `menu_office` WRITE;
INSERT INTO `menu_office` VALUES ('M','Main Office',0),('T','Townsville',1),('S','Springfield',2),('CC','Capitol City',3),('P','Parma',4);
UNLOCK TABLES;

--
-- Table structure for table `menu_outcome`
--

CREATE TABLE `menu_outcome` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_outcome`
--

LOCK TABLES `menu_outcome` WRITE;
INSERT INTO `menu_outcome` VALUES ('1','Hearing Won',0),('2','Hearing Lost',1),('3','Settled Favorably',2),('4','Settled Unfavorably',3),('5','Other Favorable',4),('6','Other Unfavorable',5),('7','No Effect',6),('8','Dismissed',7);
UNLOCK TABLES;

--
-- Table structure for table `menu_poverty`
--

CREATE TABLE `menu_poverty` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_poverty`
--

LOCK TABLES `menu_poverty` WRITE;
INSERT INTO `menu_poverty` (`value`, `label`, `menu_order`) VALUES
('0', '4020', 0),
('1', '11490', 1),
('2', '15510', 2),
('3', '19530', 3),
('4', '23550', 4),
('5', '27570', 5),
('6', '31590', 6),
('7', '35610', 7),
('8', '39630', 8);
UNLOCK TABLES;

--
-- Table structure for table `menu_problem`
--

CREATE TABLE `menu_problem` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_problem`
--

INSERT INTO `menu_problem` (`value`, `label`, `menu_order`) VALUES
('01', '01 - Bankruptcy/Debtor Relief', 0),
('02', '02 - Collection (Repo/Def/Garnish)', 1),
('03', '03 - Contracts/Warranties', 2),
('04', '04 - Collection Practices/Creditor Harassment', 3),
('05', '05 - Predatory Lending Practices (Not Mortgages)', 4),
('06', '06 - Loans/Installment Purch.', 5),
('07', '07 - Public Utilities', 6),
('08', '08 - Unfair and Deceptive Sales Practices', 7),
('09', '09 - Other Consumer/Finance.', 8),
('11', '11 - Reserved', 9),
('12', '12 - Discipline (Including Expulsion and Suspension)', 10),
('13', '13 - Special Education/Learning Disabilities', 11),
('14', '14 - Access to Education (Including Bilingual, Residency, Testing)', 12),
('15', '15 - Vocational Education', 13),
('16', '16 - Student Financial Aid', 14),
('19', '19 - Other Education', 15),
('21', '21 - Employment Discrimination', 16),
('22', '22 - Wage Claims and other FLSA (Fair Labor Standards Act) Issues', 17),
('23', '23 - EITC (Earned Income Tax Credit)', 18),
('24', '24 - Taxes (Not EITC)', 19),
('25', '25 - Employee Rights', 20),
('26', '26 - Agricultural Worker Issues (Not Wage Claims/FLSA Issues)', 21),
('29', '29 - Other Employment', 22),
('30', '30 - Adoption', 23),
('31', '31 - Custody/Visitation', 24),
('32', '32 - Divorce/Separ./Annul.', 25),
('33', '33 - Adult Guardianship/Conservatorship', 26),
('34', '34 - Name Change', 27),
('35', '35 - Parental Rights Termin.', 28),
('36', '36 - Paternity', 29),
('37', '37 - Domestic Abuse', 30),
('38', '38 - Support', 31),
('39', '39 - Other Family', 32),
('41', '41 - Delinquent', 33),
('42', '42 - Neglected/Abused/Depend.', 34),
('43', '43 - Emancipation', 35),
('44', '44 - Minor Guardianship/Conservatorship', 36),
('49', '49 - Other Juvenile', 37),
('51', '51 - Medicaid', 38),
('52', '52 - Medicare', 39),
('53', '53 - Government Children''s Health Insurance Program', 40),
('54', '54 - Home and Community Based Care', 41),
('55', '55 - Private Health Insurance', 42),
('56', '56 - Long Term Health Care Facilities', 43),
('57', '57 - State and Local Health', 44),
('59', '59 - Other Health', 45),
('61', '61 - Fed. Subsidized Housing', 46),
('62', '62 - Homeownership/Real Prop. (Not Foreclosure)', 47),
('63', '63 - Private Landlord/Tenant', 48),
('64', '64 - Public Housing', 49),
('65', '65 - Mobile Homes', 50),
('66', '66 - Housing Discrimination', 51),
('67', '67 - Mortgage Foreclosure (Not Predatory Lending Practices)', 52),
('68', '68 - Mortgage Predatory Lending/Practices', 53),
('69', '69 - Other Housing', 54),
('71', '71 - TANF', 55),
('72', '72 - Social Security (Not SSDI)', 56),
('73', '73 - Food Stamps / Commodities', 57),
('74', '74 - SSDI', 58),
('75', '75 - SSI', 59),
('76', '76 - Unemployment Compensation', 60),
('77', '77 - Veterans Benefits', 61),
('78', '78 - State and Local Income Maintenance', 62),
('79', '79 - Other Income Maintanence', 63),
('81', '81 - Immigration / Natural.', 64),
('82', '82 - Mental Health', 65),
('84', '84 - Physically Disabled Rghts', 66),
('85', '85 - Civil Rights', 67),
('86', '86 - Human Trafficking', 68),
('89', '89 - Other Individual Rights', 69),
('91', '91 - Legal Assistance to Non-Profit Organization or Group (Including Inc./Dis.)', 70),
('92', '92 - Indian / Tribal Law', 71),
('93', '93 - Licenses (Drivers, Occupational, and Others)', 72),
('94', '94 - Torts', 73),
('95', '95 - Wills and Estates', 74),
('96', '96 - Advance Directives/Powers of Attorney', 75),
('97', '97 - Municipal Legal Needs', 76),
('99', '99 - Other Miscellaneous', 77);

-- --------------------------------------------------------

--
-- Table structure for table `menu_problem_2007`
--

CREATE TABLE `menu_problem_2007` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_problem_2007`
--

INSERT INTO `menu_problem_2007` (`value`, `label`, `menu_order`) VALUES
('01', '01 - Bankruptcy/Debtor Relief', 0),
('02', '02 - Collection (Repo/Def/Garnish)', 1),
('03', '03 - Contracts/Warranties', 2),
('04', '04 - Credit Access', 3),
('05', '05 - Energy (Other than Public Utils)', 4),
('06', '06 - Loans/Installment Purch.', 5),
('07', '07 - Public Utilities', 6),
('08', '08 - Unfair Sales Practices', 7),
('09', '09 - Other Consumer/Finance.', 8),
('11', '11 - Education', 9),
('21', '21 - Job Discrimination', 10),
('22', '22 - Wage Claims', 11),
('29', '29 - Other Employment', 12),
('30', '30 - Adoption', 13),
('31', '31 - Custody/Visitation', 14),
('32', '32 - Divorce/Separ./Annul.', 15),
('33', '33 - Guardianship / Conserv.', 16),
('34', '34 - Name Change', 17),
('35', '35 - Parental Rights Termin.', 18),
('36', '36 - Paternity', 19),
('37', '37 - Spouse Abuse', 20),
('38', '38 - Support', 21),
('39', '39 - Other Family', 22),
('41', '41 - Delinquent', 23),
('42', '42 - Neglected/Abused/Depend.', 24),
('49', '49 - Other Juvenile', 25),
('51', '51 - Medicaid', 26),
('52', '52 - Medicare', 27),
('59', '59 - Other Health', 28),
('61', '61 - Fed. Subsidized Housing', 29),
('62', '62 - Homeownership/Real Prop.', 30),
('63', '63 - Landlord/Tenant not Pub.H', 31),
('64', '64 - Other Public Housing', 32),
('69', '69 - Other Housing', 33),
('71', '71 - AFDC / Other Welfare', 34),
('72', '72 - Black Lung', 35),
('73', '73 - Food Stamps / Commodities', 36),
('74', '74 - Social Security', 37),
('75', '75 - SSI', 38),
('76', '76 - Unemployment Compensation', 39),
('77', '77 - Veterans Benefits', 40),
('78', '78 - Worker''s Compensation', 41),
('79', '79 - Other Income Maintanence', 42),
('81', '81 - Immigration / Natural.', 43),
('82', '82 - Mental Health', 44),
('83', '83 - Prisoner''s Rights', 45),
('84', '84 - Physically Disabled Rghts', 46),
('89', '89 - Other Individual Rights', 47),
('91', '91 - Incorporation / Diss.', 48),
('92', '92 - Indian / Tribal Law', 49),
('93', '93 - Licenses (Auto and Other)', 50),
('94', '94 - Torts', 51),
('95', '95 - Wills and Estates', 52),
('99', '99 - Other Miscellaneous', 53);

-- --------------------------------------------------------

--
-- Table structure for table `menu_problem_2008`
--

CREATE TABLE `menu_problem_2008` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_problem_2008`
--

INSERT INTO `menu_problem_2008` (`value`, `label`, `menu_order`) VALUES
('01', '01 - Bankruptcy/Debtor Relief', 0),
('02', '02 - Collection (Repo/Def/Garnish)', 1),
('03', '03 - Contracts/Warranties', 2),
('04', '04 - Collection Practices/Creditor Harassment', 3),
('05', '05 - Predatory Lending Practices (Not Mortgages)', 4),
('06', '06 - Loans/Installment Purch.', 5),
('07', '07 - Public Utilities', 6),
('08', '08 - Unfair and Deceptive Sales Practices', 7),
('09', '09 - Other Consumer/Finance.', 8),
('11', '11 - Reserved', 9),
('12', '12 - Discipline (Including Expulsion and Suspension)', 10),
('13', '13 - Special Education/Learning Disabilities', 11),
('14', '14 - Access to Education (Including Bilingual, Residency, Testing)', 12),
('15', '15 - Vocational Education', 13),
('16', '16 - Student Financial Aid', 14),
('19', '19 - Other Education', 15),
('21', '21 - Employment Discrimination', 16),
('22', '22 - Wage Claims and other FLSA (Fair Labor Standards Act) Issues', 17),
('23', '23 - EITC (Earned Income Tax Credit)', 18),
('24', '24 - Taxes (Not EITC)', 19),
('25', '25 - Employee Rights', 20),
('26', '26 - Agricultural Worker Issues (Not Wage Claims/FLSA Issues)', 21),
('29', '29 - Other Employment', 22),
('30', '30 - Adoption', 23),
('31', '31 - Custody/Visitation', 24),
('32', '32 - Divorce/Separ./Annul.', 25),
('33', '33 - Adult Guardianship/Conservatorship', 26),
('34', '34 - Name Change', 27),
('35', '35 - Parental Rights Termin.', 28),
('36', '36 - Paternity', 29),
('37', '37 - Domestic Abuse', 30),
('38', '38 - Support', 31),
('39', '39 - Other Family', 32),
('41', '41 - Delinquent', 33),
('42', '42 - Neglected/Abused/Depend.', 34),
('43', '43 - Emancipation', 35),
('44', '44 - Minor Guardianship/Conservatorship', 36),
('49', '49 - Other Juvenile', 37),
('51', '51 - Medicaid', 38),
('52', '52 - Medicare', 39),
('53', '53 - Government Children''s Health Insurance Program', 40),
('54', '54 - Home and Community Based Care', 41),
('55', '55 - Private Health Insurance', 42),
('56', '56 - Long Term Health Care Facilities', 43),
('57', '57 - State and Local Health', 44),
('59', '59 - Other Health', 45),
('61', '61 - Fed. Subsidized Housing', 46),
('62', '62 - Homeownership/Real Prop. (Not Foreclosure)', 47),
('63', '63 - Private Landlord/Tenant', 48),
('64', '64 - Public Housing', 49),
('65', '65 - Mobile Homes', 50),
('66', '66 - Housing Discrimination', 51),
('67', '67 - Mortgage Foreclosure (Not Predatory Lending Practices)', 52),
('68', '68 - Mortgage Predatory Lending/Practices', 53),
('69', '69 - Other Housing', 54),
('71', '71 - TANF', 55),
('72', '72 - Social Security (Not SSDI)', 56),
('73', '73 - Food Stamps / Commodities', 57),
('74', '74 - SSDI', 58),
('75', '75 - SSI', 59),
('76', '76 - Unemployment Compensation', 60),
('77', '77 - Veterans Benefits', 61),
('78', '78 - State and Local Income Maintenance', 62),
('79', '79 - Other Income Maintanence', 63),
('81', '81 - Immigration / Natural.', 64),
('82', '82 - Mental Health', 65),
('84', '84 - Physically Disabled Rghts', 66),
('85', '85 - Civil Rights', 67),
('86', '86 - Human Trafficking', 68),
('89', '89 - Other Individual Rights', 69),
('91', '91 - Legal Assistance to Non-Profit Organization or Group (Including Inc./Dis.)', 70),
('92', '92 - Indian / Tribal Law', 71),
('93', '93 - Licenses (Drivers, Occupational, and Others)', 72),
('94', '94 - Torts', 73),
('95', '95 - Wills and Estates', 74),
('96', '96 - Advance Directives/Powers of Attorney', 75),
('97', '97 - Municipal Legal Needs', 76),
('99', '99 - Other Miscellaneous', 77);

--
-- Table structure for table `menu_referred_by`
--

CREATE TABLE `menu_referred_by` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_referred_by`
--

LOCK TABLES `menu_referred_by` WRITE;
INSERT INTO `menu_referred_by` VALUES ('Z','Farm Advocate',15),('Y','Adult Farm Mgmt.',14),('U','Unknown',13),('0','Other',12),('T','Telephone Book',11),('S','Social Agency',10),('Q','GA > SSI via DHS',9),('P','Prior Use',8),('L','Other LS Program',7),('G','Outreach',6),('F','Friend',5),('E','Family',4),('D','Community Organization',3),('C','Court',2),('B','Private Bar',1),('A','Advertisement',0);
UNLOCK TABLES;

--
-- Table structure for table `menu_reject_code`
--

CREATE TABLE `menu_reject_code` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_reject_code`
--

LOCK TABLES `menu_reject_code` WRITE;
INSERT INTO `menu_reject_code` VALUES ('10','Other',9),('9','Excessive Assets',8),('8','Likelihood of Success',7),('7','Conflict of Interest',6),('6','Non-critical Legal Need',5),('5','LSC Exclusion',4),('4','Affordable Altern. Avail.',3),('3','Fee Generating',2),('2','Out of Service Area',1),('1','Over Income',0);
UNLOCK TABLES;

--
-- Table structure for table `menu_relation_codes`
--

CREATE TABLE `menu_relation_codes` (
  `value` tinyint(4) NOT NULL default '0',
  `label` char(30) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0'
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_relation_codes`
--

LOCK TABLES `menu_relation_codes` WRITE;
INSERT INTO `menu_relation_codes` VALUES (1,'Client',0),(2,'Opposing Party',1),(3,'Opposing Counsel',2),(7,'Adverse Household',3),(6,'Non Adv. Household',4),(5,'Judge',5),(50,'Referral Agency',6),(99,'Other',7);
UNLOCK TABLES;

--
-- Table structure for table `menu_report_format`
--

CREATE TABLE `menu_report_format` (
  `value` char(4) NOT NULL default '',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_report_format`
--

LOCK TABLES `menu_report_format` WRITE;
INSERT INTO `menu_report_format` VALUES ('html','Normal',0),('pdf','PDF',1),('csv','Spreadsheet',2);
UNLOCK TABLES;

--
-- Table structure for table `menu_residence`
--

CREATE TABLE `menu_residence` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_residence`
--

LOCK TABLES `menu_residence` WRITE;
INSERT INTO `menu_residence` VALUES ('A','Apartment',0),('B','Rented Home',1),('C','Condominium',2),('H','House',3),('I','Institutionalized',4),('J','Jail',5),('N','Nursing Home',6),('O','Assisted Living',7),('P','Prison',8),('T','Mobile Home',9),('X','Relatives',10),('Y','Shelter',11),('Z','Homeless',12);
UNLOCK TABLES;

--
-- Table structure for table `menu_sp_problem`
--

CREATE TABLE `menu_sp_problem` (
  `value` char(3) NOT NULL default '0',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_sp_problem`
--

LOCK TABLES `menu_sp_problem` WRITE;
INSERT INTO `menu_sp_problem` VALUES ('010','010 - Chapter 7 Bankruptcy',0),('011','011 - Chapter 13 Wage Bank.',1),('012','012 - Chapter 12 Bank. Farm',2),('015','015 - Farm Repossession Moratorium',3),('020','020 - Garnishment/Attachment',4),('021','021 - Repossession/Deficiency',5),('022','022 - Other Collection Practice',6),('023','023 - Liens - Mechanics, etc.',7),('024','024 - Farm Chattel Repossession',8),('025','025 - Farm Chattel Release',9),('026','026 - Farm Chattel Other Art. 9',10),('027','027 - Farm Foreclosure Non Home',11),('030','030 - Sales Contracts',12),('031','031 - Service Contracts',13),('032','032 - Inadequate Repairs',14),('033','033 - Defective Goods',15),('034','034 - Insurance Claims',16),('035','035 - Insurance Questions/Analysis',17),('036','036 - Cemetery Lots',18),('037','037 - Farm Lease - Chattel',19),('038','038 - Farm Lease - Realty',20),('040','040 - Credit Access',21),('041','041 - Farm Loan App FmHA',22),('042','042 - Farm Loan App Private Lender',23),('050','050 - Energy Other than Utilities.',24),('060','060 - Truth-in-Lending',25),('062','062 - Loans, Non-collection',26),('063','063 - Farm Loan - Negotiated w/ FmHA',27),('064','064 - Farm Loan - Negotiated w Priva',28),('065','065 - Farm Loan - Non-collection',29),('070','070 - Utility Shut-off',30),('071','071 - Other Utility',31),('080','080 - Unfair Sales Practices',32),('090','090 - Financial Problems Generally',33),('091','091 - Other Consumer',34),('092','092 - Farm Financial - Other',35),('110','110 - Sch. Disc.-Suspension',36),('111','111 - Sch. Disc.-Expulsion',37),('112','112 - Sch. Disc.-Other',38),('113','113 - Special Ed. - Elig/Assess',39),('114','114 - Special Ed. - Services',40),('115','115 - Special Ed. - Placement',41),('116','116 - Special Ed. - Discipline',42),('117','117 - Special Ed. - Other',43),('118','118 - Early Interv/Childhd Educ',44),('119','119 - Sec. 504 Sch. Accom',45),('120','120 - Homeless Student',46),('121','121 - LEP Student',47),('122','122 - Extracurricular Activity',48),('123','123 - Other Education Programs',49),('124','124 - Low Student Achievement',50),('125','125 - Grad. Requirements',51),('126','126 - Sch. Enrollment/Placement',52),('127','127 - Sch. Dist. Transfer',53),('128','128 - Truancy',54),('129','129 - Sch. Bus Transportation',55),('130','130 - Discrimination/Bias',56),('131','131 - Harassment/Maltreatment',57),('132','132 - Mental Health.Social Serv',58),('133','133 - Vocational Ed.',59),('134','134 - Student Loans',60),('135','135 - Other Education',61),('210','210 - Job Discrimination',62),('220','220 - Wage Claims',63),('221','221 - AWPA',64),('230','230 - Migrant & SAWPA Claims',65),('240','240 - Fair Labor Standards Act',66),('250','250 - Farm Labor Contract Regis',67),('260','260 - Pesticide Claims',68),('270','270 - H-2 & H-2a Workers',69),('280','280 - Wagner-Peyser Act',70),('290','290 - Employment Termination',71),('291','291 - CETA, WIN Other Training',72),('292','292 - Employment Conditions',73),('293','293 - Employment Contracts',74),('294','294 - Other Employment',75),('300','300 - Adoption',76),('310','310 - Visitation',77),('311','311 - Custody',78),('312','312 - Custody with Abuse',79),('313','313 - Visitation w/ Safety Iss.',80),('314','314 - Teenage Client Safety',81),('320','320 - Divorce/Separation',82),('330','330 - Guardian/Conservator',83),('340','340 - Name Change',84),('350','350 - Par. Rgts.Term. Prv.',85),('360','360 - Paternity',86),('370','370 - Family/HH Abuse',87),('371','371 - OFP threats/old evid.',88),('372','372 - OFP Custody',89),('373','373 - OFP Screening Problem',90),('374','374 - OFP Language/Cultural',91),('375','375 - OFP Interstate/Foreign',92),('376','376 - OFP for Minor',93),('377','377 - Abuse - Mediation',94),('378','378 - Abuse - Victim\'s Rights',95),('379','379 - Abuse - Other',96),('380','380 - Child Support',97),('383','383 - Rem/Red Unfair Csupport',98),('390','390 - Other Family',99),('410','410 - Delinquent',100),('420','420 - Dependency/Neglect',101),('490','490 - Status Offense',102),('491','491 - Other Juvenile',103),('510','510 - Medical Assistance',104),('520','520 - Medicare',105),('530','530 - Hill-Burton',106),('531','531 - GAMC',107),('532','532 - Other Health',108),('591','591 - Minnesota Care',109),('620','620 - Default, Delinquency',110),('621','621 - HUD Assignment',111),('622','622 - Contract for Deed Cancel',112),('623','623 - Mortgage Foreclosure',113),('625','625 - Purchase/Sale Real Prop.',114),('626','626 - Real Property Liens',115),('627','627 - Rehab Prog for Homeowners',116),('628','628 - Homestead Transfers',117),('629','629 - Other Real Property',118),('630','630 - Tenant Remedies Actions',119),('631','631 - Rent W/H & UD (Fritz)',120),('632','632 - Other Maint/Repair Prob',121),('633','633 - Other Private UD',122),('634','634 - Lockout/Distraint',123),('635','635 - Utility shut-off by LL',124),('636','636 - Action for Rent by LL',125),('637','637 - Security Deposits',126),('638','638 - Other $ Claim by Tenant',127),('639','639 - Other Private LL/Tenant',127),('640','640 - Public Housing Admissions',127),('641','641 - Public Hsng Evict - No UD',127),('642','642 - Public Hsng UD',127),('649','649 - Public Hsing - Other',127),('650','650 - Sec 8 Admission/Cert',127),('651','651 - Sec 8 Evictions - No UD',127),('652','652 - Sec 8 UD',127),('653','653 - Sec 8 Term of Certificate',127),('659','659 - Other Section 8',127),('660','660 - Sec 221/236 Admissions',127),('661','661 - Sec 221/236 Evict - No UD',127),('662','662 - Sec 221/236 Subsidized',127),('681','681 - Farm Moratorium - Homeste',127),('682','682 - Farm Cont Cancel - Home',127),('683','683 - Farm Foreclosure - Home',127),('684','684 - Farm Loan - FmHA - Home',127),('685','685 - Farm Loan/ Private/  Home',127),('690','690 - Discrimination',127),('691','691 - Displacement',127),('697','697 - Expungement - Criminal',127),('699','699 - Miscellaneous Other',127),('710','710 - MFIP Appl/Eligibility',127),('711','711 - MFIP Financial',127),('712','712 - MFIP Social Svcs IV-D',127),('713','713 - GA Eligibility',127),('714','714 - GA Financial',127),('715','715 - GA - Service',127),('716','716 - MSA',127),('717','717 - Other Soc Svcs - WIN',127),('718','718 - Other Welfare - Child Wel',127),('719','719 - EA and EGA',127),('720','720 - Mental Health',127),('721','721 - Child Care Disputes',127),('722','722 - Employment Sanction',127),('723','723 - Paternity Sanction',127),('724','724 - Full Family Sanction',127),('725','725 - Five Year Limit Terminati',127),('726','726 - Expungement - Criminal',127),('730','730 - Food Stamps - Eligibility',127),('731','731 - Food Stamps - Financial',127),('732','732 - Other Food Stamps',127),('740','740 - OASDI - Overpay/Financial',127),('741','741 - OASDI Disability Issues',127),('742','742 - OASDI - SSA Other',127),('750','750 - SSI - Overpayments/Financ',127),('751','751 - SSI Disability',127),('752','752 - SSI - Other',127),('753','753 - Ramsey County SSI Contrac',127),('760','760 - Unemployment Compens.',127),('770','770 - Veteran\'s Benefits',127),('780','780 - Worker\'s Compensation',127),('790','790 - Other Government Benefits',127),('810','810 - Immigration/Nat.',127),('811','811 - Citizenship',127),('820','820 - Commitment Generally',127),('821','821 - Restoration to Capacity',127),('822','822 - Challenge to Orig Commit',127),('823','823 - Condition of Confinement',127),('824','824 - Change in Commitment',127),('825','825 - Other Mental Health',127),('830','830 - Prisoner\'s Rights',127),('840','840 - Physically Disabled Rgts.',127),('841','841 - Other Disabled Person Rts',127),('890','890 - Other Individual Rights',127),('910','910 - Incorporation/Dissolution',127),('920','920 - Indian Tribal Law',127),('930','930 - Licenses (Auto & Other)',127),('940','940 - Torts',127),('941','941 - Negligence - Plaintiff',127),('942','942 - Negligence - Defendant',127),('943','943 - Intentional Torts',127),('950','950 - Wills',127),('951','951 - Estate Plan/Inheritance',127),('952','952 - Cert. of Survivorship',127),('953','953 - Other Estate / Probate',127),('960','960 - Tax Issues',127),('990','990 - Other Miscellaneous',127);
UNLOCK TABLES;

--
-- Table structure for table `menu_undup`
--

CREATE TABLE `menu_undup` (
  `value` tinyint(4) NOT NULL default '0',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

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
-- Dumping data for table `menu_undup`
--

LOCK TABLES `menu_undup` WRITE;
INSERT INTO `menu_undup` VALUES (1,'Unduplicated Service',0),(0,'Duplicated Service',1);
UNLOCK TABLES;

--
-- Table structure for table `menu_yes_no`
--

CREATE TABLE `menu_yes_no` (
  `value` tinyint(4) NOT NULL default '0',
  `label` char(65) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

--
-- Dumping data for table `menu_yes_no`
--

LOCK TABLES `menu_yes_no` WRITE;
INSERT INTO `menu_yes_no` VALUES (1,'Yes',0),(0,'No',1);
UNLOCK TABLES;





INSERT INTO `case_tabs` VALUES (1, 'Notes', 'case-act.php', 1, 1, 0, 1, '2009-07-21 17:34:51', '2009-12-29 23:08:37');
INSERT INTO `case_tabs` VALUES (2, 'Conflicts', 'case-conflict.php', 1, 2, 0, 1, '2009-07-21 17:39:16', '2009-11-23 15:11:04');
INSERT INTO `case_tabs` VALUES (3, 'Eligibility', 'case-elig.php', 1, 3, 0, 1, '2009-07-21 17:40:06', '2009-11-23 15:11:04');
INSERT INTO `case_tabs` VALUES (4, 'Info', 'case-info.php', 1, 4, 0, 1, '2009-07-21 17:40:25', '2009-12-30 00:19:58');
INSERT INTO `case_tabs` VALUES (5, 'Pro Bono', 'case-pb.php', 1, 5, 0, 1, '2009-12-30 11:43:36', '2009-11-23 15:11:29');
INSERT INTO `case_tabs` VALUES (6, 'Documents', 'case-docs.php', 1, 6, 0, 1, '2009-07-21 18:00:45', '2009-12-29 22:52:27');
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
-- 
-- Dumping data for table `doc_storage`
-- 
INSERT INTO `doc_storage` (`doc_id`, `doc_name`, `doc_data`, `doc_text`, `doc_size`, `mime_type`, `doc_type`, `description`, `created`, `case_id`, `user_id`, `report_name`, `folder`, `folder_ptr`) VALUES
(1, 'Debt Collection', '', NULL, 0, 'text/plain', 'F', NULL, '2007-10-10', NULL, 999999, NULL, 1, NULL),
(2, 'Envelopes', '', NULL, 0, 'text/plain', 'F', NULL, '2007-10-10', NULL, 999999, NULL, 1, NULL),
(3, 'PDF', '', NULL, 0, 'text/plain', 'F', NULL, '2007-10-10', NULL, 999999, NULL, 1, NULL),
(4, 'Reject', '', NULL, 0, 'text/plain', 'F', NULL, '2007-10-10', NULL, 999999, NULL, 1, NULL),
(5, 'debt_collectors.rtf', 0x78daed5c5c7b6fdbc696ffdf80bfc3204071ed42d18a929f6d70b38ee3b401f242e3dd5c22bb5c5c1443722832a138cc0c65450d7c3ffbfece9921f596ddd471b2c02ab03424e771e6bce6bc98cfa1a9d32094a5cdf92bae8641ffb01f8ee3204c549af6425bdb2c4da238f3cd42b7cd2c6f9b51dea3fe852c87416f3068daa9a2abcf61aacbba8e0a347a616af44896611a67d25855e346653ef63f873f86952cb555a2d7c7bfa3dea077d83bc05f1fad83ebcb7ca4ac78a526e2371afef335e60ac2d44e726bb7cf1561ae039ed3fd3bb83e33b92c7ebededdc11c836578faab731ce25f809141ef1873f571757cfd763a8a74c1601caceca93f3871b38825b0c5f9851b12ac0ce91d6c1a32356ecc0aa8c151b061cc2f46a90f7e870707abe3fa1bc65d8efd5a872b638e8f378cd9fb5545464df6ddc0a3d5819b70b177666494c77ee0f1cac093a30d039fc8a2cee3667b5c27abdb1b6c5af13f7355971237955bf5b0b7cc4233d2319734043b5c5ce1b519c17c474fa6c3c172cf19995c5c4f4f1cea7bb0dab7bfd09709c2fb3c3c5c5ce9db92c4f55d20c4e1d16af7c59d2da0fff078a57b8b7ed7bd413a753e59057bb038f702a23126d68536d05c303f874625bd70081494bd302ac6aab77aab7f78f8f3eecedc6ddc681facb9eda6a0aba549d6dc5eeabb618a0d0bba2982fec9fc4d5c5c6ebbed66a6ab35532cddeef96db7b7374cb2bc6470daf70fd0e007a77da294ada785b29952f5e7f06321c2025adae06f925c27715d54d284d256b2a832498d723c0a5329c7b50e65f27e6c6b930fb31a035c305d415f792dab9e5c30edfb0761abe9676a3e8c87264ff84659cd3d73175c22b4a5fa54f7c42b6d46a47e3f63afb6bf5c30d707a5aaf266e8f4b8063caa5057aa08b6c31a7d39b491b42ad165af053c5332c9cba1e87bd8077f17f6fe2d603fb95bd807c4163f86b10df04c26495ee7570abdac1ae5599e24aa144f552ac7452dde4823874656997886d39bc761d7b50d027c193d49c2daa4b5fd3d4feaecc95c301715e62b82de896f9a59332d9ae769ddb6a2b665a8154795ac036aa4ae61635514139a1dabf4707da54c0d2584566412d3fc16fe37f2bfc6ff26c3a26d35f732ff7b25b0933b15889e5c2793e7355c22139a8b646a9fb90b4f9b205844bf130f7129a34279460b0e3db0fd93936578abac1a8695b69f62fa9e46a18c6cf630384547b426c7a75c302df9949a9a96c24d607b547faa3fcdb5a7bdbfb26b86a1d9787067e2151c0a55422674a504318fb2b6d9fdd15d922a98a7d6df83f86806b151f5d8b0516a83e3f0e3fb19b8b678d83fa09f1164aa87fd7c23ddbb0cfcb178a293a9b844db817d127e8cef08cbd825e9ae01dc88e24e803d99012bdcc1169cde2153dcdd21119c62f33358076cfbfc181a0b3516015e6a04c7c1f121b884da87bd5ed03f0edcfd5e6f703c38eebb8bc3e05c30ceca090f1faa5219596b235ee6b1d156a7b5f85d9b4404bd6eaf7bd00f4e095c277999eacf619dd785128f1e9d0330ecff9fffc4136020c360d228b802bfbac9d4489a0f968c33a3649d8fc2a9e9038670a403e88629a424c38d70949707a7e865d4d54d9dc8508596b6b92efb18a112dcb6015aa586521faaa63d01f036e80f4edd251b9170addc6e633d82e33515674f5e5c5ccc3d9fd893fe298dc7026570747074ea703bb6ca544657567c0ee997ac4ef12c37b67e85d635dfaba7951af4c81ec23ee32ba8d7478fda2e8ca276e40b79d3c0a607c6d17edb91674e6b6d1ee83b2cae779ed7d3cd43e8e962ffb778ba05387ebc38e2bff22ad6c99631bec3e2a837992e89815c2265368ddcdd79f468aedbd2be1cff6dd9da1c83b6a3c02fb04864b17958d36369353d2eb7e2919f2f8e394bae74bc15994d0f8c03a94388cbb0e81f12b7a365828303d7aa61e8b856442d41da484fe21aa6495a97d1fb50aa3249740c56fe54c8bad6535586ea5365335397b88983c114b68ac3a48492286d9444b80b3d16ab541ba8507c8f6c261315428cffa49992212d97976864dc31a0637e78e5da74b40fd135470f5c5cf0137f4530d3984c4ffa3c801ad8db7bc023cb24bccad5e4435e2607dcb2b12ca0077b613564f30946a46fa65ad7a1ad8a693d2961ced246db76568fa0716c854d14655643f5625b24a7451dc9a20cf1871b5824c410ac10e36ac21768981ad65a5146e60376ae58171aacd528479c8014e6b12aae133e67a0f5eca7b24f0dfcc236adec9f01f4f287128c495a5e7dea85c07f9929a3781cdd23ad3ee81fb9799cbd1b17a16572090efd9478545c5cc1bdc029129b11dda8a5a9e91a90abb23e06c6ab32c371408aa7841d2545d7a9a466709f0783ba5f347a8056a2e26d6359ffac1d7c805671fba5f717471fdebc743336127bd79ba639fa2b406c9be81894a6a96e47876d339ddc1548a77f03a010860a04a9907979e78ec8979831643bd8397384800208b7f9717b1177b6079a4ece5949802d7216bb07b1b19ec82698eff7c30fffed8ea1fff9e187af04db463c514c2c574542fc9116f0b36dbdda573c3dbbbc1061f8efe2c14b7c44d211537c1ee0d68fe2e5c56fbf5c5c3c7bfddbcbb34b417c86598c2d6896756e65a97162e9747985a72a568401d1ef75f0d70baeafaf6f20edecf91c1ee35c22071b038fd75b36bc3acc7b6d5bc77d7d6e59b31dd8505c30aa436d3add152e045dfc99573366b96f9e79aaf0f5d274ffeda5edaec767013bf30fb2541630da3806a273136d9f0b391213036b099aa8d65c22d545a15c27625c5c095d8aa91ec321a8aa5c22878103731d1eec101ba7aefc28cd4b59c614ca05abc16f18d9eed2eca1f938d6354c3601837c2aac36f8c632196d4ca7a2ce9448f234cd631caeb9b234afc8e49582d71c933986f338e98a5ff54461820ec00508f0a3c544614d05e3b02ea65c22d1a2d475334e8f8799200bca946a6a85bc9279415e8d805c2225a801ebd060d75c302351807d92d79918698863ac4b3b1e41360a3911f07d1215d1cda2800140db6f77b984c4df958814e4e14ab55d841dc7808237645c3084510e03f9a8d2a69665dd11b0a4681bf4c8021d7146784dc905e3889b2e015b3a2e134b903acb8be1077ba669573c434f42df488f144d973538924541f3c6b224c4e49660baca13c5b8e5cdd2307204cdc891d502a1b8c2136c434fdcdc32d9dd69e1c8545175445528d8e384a65ac6b5909839bf82acb4d8ee6e90938da18e3b171b76d83abcd5197f306394c005780a36fd84529202fe2cb6a7411c305a9108707699dbac2b2eae5429f2d4b1f8ac978e6a3a8a257537b5783f86798de9851c4ad6e5e8de21cc1ab2c7950381698b255c2799acc58376082be607c2021e4543a66b601d2959eeee30ed6bf981c80cfc0a4a62d1cc5db17749e346720a9ab1d34e3dab3151853433892ff9c7196d18d434c4e98a351b56940caed093b2e59baee009656135b38e677be6951670ec9faed3713da69d658c38c693472d7e0cf14877ffdbb180d33ca988720882df86f632087b405aeb155847a42a5106882179a74d8330356d9a90939add1d207b4efce5104a8994144947ab5fb21c2c5c225c22a8b58cf2c0a0c2247344027e3dddba42bc75c8922b134ee7a76b658b86cfb42d5192945187f45c5c9ed25a6a34a3e3047ccb1a108b47ad7c92e274449d1026f05c30aa291f820312ea182fc832eb05c758ef5abedfdd61c4119361c1d231620aeecf484702ba4248de49cb45fb5872f98069d47901f41002e07d7e80c281f69f5374f3ea48461a7c8c191755f4bc3606581d62b662ecf023ac1c413b01a81a47c60c33445408166f78891fbae28d536760d8c4ab4470d9983704a55c307649c74541f24502cdd3b8b5dc5c224bbaee0c82e3e59f394d16e8534ace9c4c24f824e503451634c76c3fed79e19412c13c5c2246773425320118286fe368691726b61e05eaa745588287e1bf1ca330c0d8f6922e8b4873e4c5029e887f460a8499f51f1b4352efd986d1c2871621d26195d850f2f92147745c5c0b25633a4c4bec0f9758a29d8db6eb84b09279b284bd3e20760ad6a1b85413516810cf63401779c2070d66d3e9c2845c3063447c0939730b8364959cb2be5ae0039c9a140edd73a426cb025adb6056471b7760bb5509cab11d4b5c22ffc7718e85331065c6e53f2f423f5c30f4a45b815c279bb90d80916cad142e2b08b73ba8c7651ee7d070fe04c111433063e911f1975e39715c5c100b8b5b80307fce2c21efe0a178477c23a7f35c5cc3627dde5834e73c2b87c0ac621e7cabcc558ef367effcfcfc2dc92dfd3ada928a742b91c60775d93a844d285bccc22f2d5ba531077497342fcf946820b635cb8058a8d35812f9525a36f7e6258e0d424c3dedb48432cc44cc5be875a90b053b0648dc3b084ef70f07c1c37ebf7fdc75ab58b70bc7582e044e444b8d628c92033864a5ccfa3e52b11c5b7fe636cfe84003a57ca785bd780d21ed07b71af109459ea10160b72af06b61bbf7ed1b3c996d027bce19c9ce76f49ad91b7f30df346d6a8e9adefa733621e99d4e63c8cfcc634f1f6684123a980e1456dd6421c8f2833b1c81081e09fb54c1e292ac1bc144bfeacaab4de2ed8458d2cfc56c60c7343b798e33d3960e50166ca2c4ec5c5c2d150ee7c4390b45252aa549c1e36c6d949597e7651bd4f211b4489456d38f9cefcb7aa1018c72f22b2671eb870c733207c79625012be0cc76463a2032b94e88cb5252f253d8f058fb5d8b4f6f9b25d00c464f55c2d8a793ada113a9e8b8614e32d868da148ae99ae219cb9181f5f183e8e608c203c2c2d6f041f4a501048e1dac82d0eff54ee6fdd54dae67465951e65deb483184f1a4f0ebd98b95494b093282f85c5c60c3a33d38176cd2d6478144174e0b903624ee020959852e3b6f178d65d2f234945c27680e2605719ae9f2924c9744c763567ff8a3145a5c221e9c731c44fc62e0fe491af1c6e8582580a5fb5c3002e3c493c80c356abd9745f0564d3777e68357bcebed3c0f78c55652b50ec064a9755c275e9c5b3e86012add803c26acccdbc303c076e869be8438cd1cc7ba0b38a073938d2c1e04df12acccdb6d97f24ef292727bc7ce2cceb662daf9c601bf35211c77b6dd6768efac31dba14e5ec8c97d7bbf2b9277f1eafca7107688d8cc955f0f372bd03024cf644e71ac886c8fd6f17963c86fa063fb2ca61a5c227208eefb18e5b40ed671595c2297b7a3e410a5c23875377f51d34593ca8b7041f17b9f560a82595e696b2ae9a8b73e95b414e9e7e290f8ebf0cc9707ff29b5b88cc2dfe918bdd4e2a94613a7e4796bba9e41affddafada501bb398f00a9b5024e3166cb21851f0e8babb72942fc78caf62b99f60f6c6f516d9b94944ff6d865eca91c27db6fdbfc1dedf5509d167573ab98d702d9b7d77d9b735d6e0db772f9fbc7e21829301ecbf543c706f1f50eec88aa03fb3f8f87d0680b1de7adbdd61b186e1526f904bdb58d5f3e2f97835edb3260166fb2b8c7b3be9177bcf9e9ebf39db5c27b8e442dcced9f2d20a2e50721e4313c76b02fad6054ec7654a0b51c84046634b567ba4605c22e53098a2e97280a97b9b1ddd175558bfb24b4da180aa2aa68f5792741bb14b9873791c8c6f3a426496faea126edb8416924bb8606e30539f236a42c31cdadcb02e9cb0b33593c01425bf70c35c5c8e96e8a65c278e8e143ba7feaab05494966f5a6ad9df6bfaf6d62408a8a6ed13470b3b64254befef53c02f114d5919156a5a9fff8a391125f415398e7a6d043775b918ce29d52ec33554f552ccbee3046a9e18ec30fbb44deeb261eba0c96d13d0f1916b5e0cb6ee950b5bac4162137ea68ef30b5350c0c765988bbaf318dbc8e5d1bdf139d0e1d89ca31424df8d2c8fd463f11759de52dc95d1b1c2d0e470b9e01419298c2e1f1405b654a1aaccc7e6f272ce7f9ac869772d102b8ce68c1f9f34e118ad157bd1b8f6f11a51e4a3dc29abfd9fd6db0a74207ff17143831b7b611d780fdfc1cde648a56715c34e72c35e82dfcaf12c0f74b618f906909e03aedd9d06b292d4b9862f5ff35b5b1c29a428d3dc06b0252c82c353f94e4d2a56490305e7e30523386eec391b97982d5c5c0c49941c7ddf73b997428137e05b73fe8e83862ea55c27497deddf7b05c99225f55d54377fb52370bd59e2738ecf39b59dbaf2854811219d24bb545c5ceb883c66f1bcc13aff8e8cbcfbf524d6694fca247824374904129706a3243e4db908d951891a494e043502626b5d8988d5a5975997b96295329f6831eae39832306cd085ff381d9c73a4eddce503629f6f7ac1b936a0e01fa70798e825657a2c45cdda538ec3b752403dd53ad6d594138bd0d83e15485d9a0ca06c63fbddfb45eaff29019e3bf6e9c5d7e068b9c30b0ec09ee5897891979c66794561cd0951f37596eb59f5928f1407a71daa34eb7e3b7b7a5de0c2a5ba6e623d623c289bc7dfabc688fe9ab7b5bb43b2e8658331502b9f7a59b29066d5059233a9ceba65f15e344621963e4c4fd9c74e1bcf569f1c969a4c5fb368366d6b63c6655bb9e2ce7082830a4874395b9f43f9ed95d74d6d6211638daa5c5c8582dbc24c17edeed05c222bcec64a8dc26b5f87d3aa074c192b4eb0f3646d5581afb8614769be52c3e59e8d33383ab4148638ed4429b419440cb29f3c6157ce69a685ee336b83b3ac5404a1e772adde2159adb4487d5e730e300f55269dd1c3be1740a4741bf9581d3782b0042ac10f2e5c5cf6cb57e6795fa54c5a9a36b95c5cd65c3031c83b6af3d2c421b791f0e81e7de6bf26e53cc7aa5bfceaf5e5da2c17948210ebfdce15b13bbb155c303ee75ab3f308b16f2b24c1d6ddcd7ebbd824ece239d5a9d99a8bc96ccb86cb923e4bcf6e14f08d1b637d3275753635d7858c555338704e650e9be303cfc9f96eed0a580531ac6d973bc624b675997dfd12e144ae2dbb7342e4589f7443a5adcd234ce34bfa9cd84ce8d532d2318b4572f45a8f32f582db5c5c76c5366cafcb54fcbf55cec56d2d977be46ce675f8508fbf5f2b7ca309f7bbf23ab08680645c5ccfb6a1f48cd4e5d8150436f65c27f3e12c49e2ace9c4c8b46e4baa99f99c26da7c7cb78bfb3561429384d7ee607245802d5c5cd021544ad79437b9119e60549e40cb73a9e08d669dafbbc071ebaa5577771a49e760cd4872591ca188d4011765955a0cc770ccca5a79937db98c4ef0cbb15c5cfd40b5cd0e66576136af11b0a22eae944392cffd77e70f952d9ed352a66f4d96e3f6af83dd2ac9f1ed59183b5f2edb38bbbcf849883f367c1675dae5eb2d5ddbce7f6cffdcaed7fd257cbf1d20ebe25a7b73998e338e5c2237ef4a58412f0ef3a1e65f06dedf5264d11e3cdfed7f92b24288df2e6ec35ddfe3a9b0868a5e9baf211e57829df9ecc12b7eed6c5fdc869283850ce977f45fc67c5e631a3f3fbf80ba10e717676f2fc4f9eb972fffe3d5f3f3b3cbe7af5fbdfd7e5de66d79dfcfab056f723139a9cd4f62a52ecabd5e80f35c229aba5c22fddca5b0f2d1081c5c22e1654f7dc9bde432f405bbc8bd82a4e62afed91b9d69088a69393740b8a2b236a940a1ae85d9f85584265edf7175de5458d82631089e313bf32a773766af898048311ffd0ae7b0e652dfe584c74c61bae86bfb12183638f3e7977c72763c7217b5df3aa17f958b8a023f3883e1b9cf6361344fe56b789b92772e32e22f9ee2d295d625e3d825857150130aaf1a8374d387073f1725e5e2660e7a3d371bf928aed8f876533933b1a0b70ba65c5cf27ebb6104743e725e49d11429df6aec65836c9f625254ce0a9603456e18be30cf2d3e37e4be6ef9d973819efdcd92b775bbb784f56e4065c9d99fdd58b56dc41af89f837c9a5e0af2efe6342fe2c13ae6e058e9df77b1eeada1a913286f63cb69a30788a85b29b8205ddf262bf555ab2ca1ba9a9ae926b815b920e2a47163e49ae8d5b6a2127ab58eca4ae8a0765103185af41f9af12b7e6ba30c5c5cf51dd763c9fa945ea5c34ecc542472c4a185aaa012e3a65c22945e29e8ae3feedfd27b7f466daaa1dd2a725f686cdf20b1ee9dafb2b15c5cfc4bdafbb797c82d11bfebff05ff43477f, NULL, 22078, 'application/rtf', 'F', 'Sample Debt Collectors letter', '2007-10-10', NULL, 999999, NULL, 0, 1),
(6, 'envelope.rtf', 0x78daed564d6fdc3610bdfb5710287c095a80a4b45ff0c96893536a0475811ecaa2a0a4e14a09452943ae77b786fe7b87d47ed9591b30e2430d5407f171486ade1b0e87ba57188c50daf94655605c22a4c66ab7145c5c4e2eee95e95c5c088525c095c1aed54e991ebf4a65ca5aa387c0d94dd3162bcf7e8b83eca65bb08f5703cd174fcdffbd69c1b31b588f4bd264f992c999327edd78ffcde46b6cb4bd1a06e25d76b6435c227ea5102aae9608e0b82aec0a783209391f8d114433b55771a10f5b0bbe0608840585c796b5d2c6cb5c5cc5b0c8c944d98064ab8a07030604cf32653bb21e8cc9e41d6c8260bf80d12b1b465c27529586dfab77aadef63538995a0bba1a5140ddd811b67ac307a57daf6d5feb031f915c5cf3f39c4e070da4e1444ba883796456680f55e7c4c851d2ee611b231829929646cee75c5c61434b1ab7c31445438697d1dfb3ce9e8b64f6209a47d6d9e378ee58cb9175c6c0dd81ed7a60baaa10bc1ff9e7ff218ef991234258a14b14dfa9d24f23cb47bb9a3fb7abf9f95d3de37bb64f39f649a35ea2ee6bf6818ef3c1f7ec24bbf953d9cdcf65f731878e2913bfda38d3c5b3d7b6e002bb0d1affc0265c30d2a9bd0374d37cc28721169aa08b99e48947bfac7c495c27953a09f2b15979100b62e308f77ee3c8baa64664d3799c51139e2c72ae5a8d4b1b3bb369c248983e9d70209c4d475c5cecece9e36e43d5e2f44026ab78e079e74fca7cef4f4ce65c270ec59cf383c7435c27ba14797ef4993a7ba782fddc515c226060622c533bf9aea304a49012d43da89e5e585c277909ae47d5c9f341e741e44161b47828434529f0c5750e5e3f7a26b8e2737c7bdadb205c22421f4acaaa089d46a5c155555752ee1c87f47141840e6d797141d2b052bdd58d3b814ce9c2af670bf245a0fe492c887065b00d9bb01191fc5dbf547de7b73293b449f5d8dbc4ea14c369ec36c657f0c4d66eeb0eff99c859368d1ded4aeacb087bbd0431c4645c27dfb1d8bdac583c571abfda57ad25ecfe891a43ae0ace2e2fff44289bbea113f7d7e5e590e2cafe8fe87745d4acacfd7b779b3c0aeac583d0eed5bef4b2791545fc0945fcb1a2f71bddf616d847586acb6e01ef9a92feaa3e6147b7427b2e65de862e2133f66be47b1be8572ebc5d21b72bba25d90fe2ed2ab876db750d083fb2eb6b3689cf4ecbf02f8608720f, NULL, 3171, 'application/rtf', 'F', 'Sample Envelope form', '2007-10-10', NULL, 999999, NULL, 0, 2),
(7, 'cc375.xfdf', 0x78da8d58516fdc360c7ecfaf200ec85b76bebbe492b648526405baf56528baf56118864096685b892d79929ce6faeb47c97767396921010192a3f851fc488ae4e5fafd73d7c2131a2bb5ba59ac97ab05a0e25a4855df2cbefef5f197378bf7b75c27d7cf95a8805495bd5934cef5ef8a42d92513bac425d75de1cf8b85d778677bc6f166d11bb4689e7041e84a622bece10f50ac23856dc9842025eb359e583be0ede9e93fd5d0b6f7fb837f4f4faf8bf1e4e4ba08d89736b8fffdda809766a0eb397ab34a011eb46bd044887502f1238a5c5c0fc6451ce1a56c43c2b349caa5dbcd25d631e7f9014cb2efb24f33e6cca2d2336f84e68fe8eed5d09568722dac5c2713eb5516621321ce5388464b8ef11d5980e88a4d16e07c02e4b97431012eb25c30db09b0cd025c5c4e80cb2cc0d504b84a01a489737fbe724d0aa107e576f3e2a56cde8ff28c62f19519dfb95ee721e26a49451a9f7b665c5cf48c2f776813984a1a64a68b0a862510bf6b1515247d5aa601318b54faa5b2ce0cdc4597fcba834ab62d7562900a5c5c232d54da7467b0d3033083c0eca33f242130e8a9876bc55ae88d76c81df573d046a0816f8de40d386c5b4b5610a8c5f45a09540e9476e034080d1c8d63e335aab6e10a92faf36f8c141bd99135a0e637ea2f33e94421f8541d1da77b64d7a190d4c6403055a31959d9460f648388054f1f0651e3c84f01251ac64ccf78713a2ac9a4b5030af8261d99f04e4b37c5a6a164fb4f4c4d1a448d9e8f67338f492eb3a8797c552d75ed233b83ff0d68dd78211cbc1e9d3e035639f2ddebd2dcec5ba493636a83839473a2e382a3c1b7f026c6f874837510c62ab1e2badf81ae824e8f4e8e29572f737cb4498541daf4e30d78eef31b72895fbc4a69c3bc3f2d3d29114a96f2406273242826f75e92f2ce29240da6c2689d91fa7c70f8cfbdc363f9f7944b4741a5d2d8e63a1d35e23b2abebdd47b546afd484e5201017b62b265651baaa2c1b60fec42ec029f9fb0082408519395bddecf9ea295b542b1046284a3e1cfab4d2e8768367c38948e74d859b823678c1eea063ec1607de179e75c229696aefc48bd047ce5fbb3506de50e1c2bcba0af0119bd266fcf3ff44e3f1dcc747ab0385308feb7440c7883fc9142f8bc77e418985c30ca2516cdb0dfb4bf49e1f33ec155f0851e55d82a530643bf88f7864d0e206ed3a9a1eb3dab8c4425a2b99b9e3721fbd1e8e509fd3e63353e2151df6895b1e8fa50cea7784b1468dfac73c044966a21f23e352bfbd74bb934d61db672bfb3765288166349cb268d847df32a3a5fa67677379e254dc411f9027735a610c8ec6c07585f25112df38f2f82b024248c0e16ad8d999032829479101e41781e24aafaadc8834461de621ea48a20551e242acf6d9d076926c8dfc9077c98e9d1354d1ee42182c83cc86304794841e66f2d7a087fd04102ecc79160b3ddb958af8acd6a95fa3e44db64bcd77f08733074a31f5c308be9fb3f3406abe3bf10d66f37cbf5e59be5dbe57951d3e82dfcd0a52fa4b6e0fcfc6abbec45b528bc01ffef85db93ff01c71d97b2, NULL, 4269, 'application/vnd.adobe.xfdf', 'F', 'PDF form letter', '2007-10-10', NULL, 999999, NULL, 0, 3),
(8, 'reject.rtf', 0x78daed5b5b6fdb3a127ecfaf9887164d0e924092efed534e92a60692b488bd5b14ab45414b94c586a61c924aec2db2bf7d6748f996343d482f8873d60fb546bc0e673e0ebfa19aafb1b659183365449cf28c447c48a686611035b6bec659a1ac1d48148238d3c588a9381bebab28ce929c69c36d5c30e76234280d5c5c50259c171d387d738bedc3385342bad6c152ebc313e88b1137ae4df4576d6e5185a49085461ddec49aa7413cd49cab201ec89207ae288cdabe90042ac6e71bea68ec547293736e510ee3240bbfc67fc4f9749c7315b9a7e42cf592d54c482f8ed824b845bbc8248f19592433513d269b448d462cadc6f27470af32e3aebac00a5afb721fa3f8c48670c433564aeb758b9e529f01333c2d54e8358b207ed5ca58fb420c730b1f98f61ad69e5043110fe65a462b5ad68f8aa41c71559911bb885614c45a2080f0df25e763458ac74646f55c307f4768f220befaf2c4b65e5d456375158df92ae8f719ada3b9ba8e26ae23acd79f9d3b5aabcb682d96f1ccfcd15e5d487b0d82cc5c5cc11ce7156a085570eeaca36e2daf5b18aca372cd4ab9701d956b54ca45eba85c5cbd52aeb68ecad52ae5eaeba85c5c5429d75847e5c24ab9a60bccf62a89eda45ec3886daf348aed663d580f861536e11d4ecc2b6615b6d65ee116bc2d0a3b57b81d1b1646c1fa70d6b00d7d7cc0a048a7958e9df5d1b15d29d9813e1b480e879845e1a16c2aea1f2c348daf9235a0d8643bb7b5824ae1777e87397dff881313b9b0fe2be777f852083138c4b48f258835320f4d28545650da375c225c22033dcbf4472db01e33c66bae55b31e06b7b794ae5a36407ee6541c0f53936092882f4e0cfca3343cec3450be3113cc0f89b98d8739c98d36ca23a68792deead58b5e7eb1cb2f83d98b1b574d304d5dcee75c5c69f8a849895a7e73ce4e73312535ca5de898fad0e0e5c1ac745c22e7929eb7cc03349597211e339dc663c98482b50c950fea538de63acd40b345cb81dbad3873d1c9dba492918d7b896c52497a26799b78f9ae4d5a7f139bcc901952bcc19d62ab03d29547bf069b61d88836e0dc80f387c119cdc1192dc0597b1438a3767b81cef9cb069d1b74fe343a6b7374d616e8acff2a2eb141e7069d3f83cefa1c9df5053a1bbf83e96ed0b941e763d1d998a3b3411feeb07acc75eee1e7e41b0f4b07c5050e17205c5c20d049865c2736c514f552158affd2142eb36af0857e0de696362449735c2793a8988e1957695a246836ac3236c1fcddc95507129596c9d6aa4b9ff2eed37fa0b8fb71623e85899aabc3ba0237104903f8baece32c048831bb86defb7ff4df1d5f9cc359f7fcfcb8f7be7f5c3017c75c27ddf7e707a7707a7c82bfbde38b7f760f8f7bb71e0f6b6e10c2f69ec3809db48206fed65a61b464a5e8ae95a2b995a26f5829ac4570be0f7fea82a5376c0aff850339a02d70cad92e9c9d03349a41d0aa8c73b7f7762368ed40add5da8bdab5103bf70b29f7de6ace21dc6b07c15e14d5f682a81d60d55b36596d1f3d0f8b7ff9498bff2d1689b17e759154e01789d27d581d585b68c5a7e6b5db851f9866920f9934af1f40d209d35338db877742a7883ba6d8100f9c3d389ed87dc0fd4da3f4798af54a7175c946e35965d87960c8231c52c211821bad391faaee863a635a28065c27fb705c22a444d7cceb6b0f8c762c2557f0910b85db63386f1eb9e18ef840c05ba10cb7f9bc2a783ef8f62e8f9af5cea33dbf6e6b948216e33fdfef91f83b167d171cfdc2e3fce5cb7f25527065fffdf2e5ff85f7ef1a62660596a64848ccc20c0f354c849d62ab5d92919b588e2f24ff478c179dbf3d04b6ca4a293fdf9bebc1e67c8206fe6ce9c3c65fb53ee258885d344fc4983cfad93059a282a250a4afd3fff95006ef620cf075f274d86cd1a3dd760e6fa2c38930d7a8ae11349af468b5a8aed90842ea1d51d89cb43af5a6e3d3cd363e3ab54ef8e3bce3535102da160d2ba740ec943ea0a46073be4440a0c83291707c40af28b14e2b38a303c01496c1051fa23398c49678b2408feb6b6c6c76a1ab927dd8ee9d5d9cf676202b34b8a307722ec7fb5c30fd5c5c98d9c0a481b8e606328e391f93bbe030084ca530d6e29ae4ac54ee5bad2db0a8b816291611c1590c4a55830223bf2c6e40a8a418f911b8c441717998399842199c9b569d16a00abb056c3c268c515f1c114f23950826b139976228e81b16a95e941a4cb532a73c154b9c8854c2853030e56844875c271a891afbde42e2be826189da4aa1c828941e0ca430395a795c5c6a53326569f26ae520d9cdfe730b59bf11cfcfedd87bba9dffd823a27b7ef8feec188e4fbb5c27dd3fbba7ddfe5c2738ed9e75fbbd8798a12e8c996dabed01c75dc1c1b209ee5ada6405850548795a26149bb1d0555f5c2259c390b1b381f40f3beaa3b7239a1ec3044b92a2c488317501695c5c9486bf32cbc18e1924bf5892511390185531ba0cb9f30ebf466f5435e41ec3f925c52f173c6f04464e06a9b82e74c231c675ab8638e8d26cd8097d480119a3e24a39dd6898c508bbaef70873599c5b3d145c5c711e5c5cdf88d6c75c27091f7bec50c4f5c31ab8d9ca0ba72dc65e2b467466c0389f1a9160b464039a9a54bcc156095318d2171ad292107ccbe7ce862afc305538206461feb538d74ec5485873bb7ea987b3daea7f1d7e8a9dfe580bbfc34d6c2c1a09f8554906debe46b2eb781711b2dcedb39150a58151a1ed1073731f7c29d7313baf015ed483dd2008f66fd7391d7c4e2ef1d7268e3852b8415b3b2fe4854c41583ef2e71c862e59e2d9b7bfd90bbfd4f0f1abac7356583c0dae792e12c909e2e10ac41fecf7de1d799aa3dbb8cb2676ab045c300b308140d94e31cf60d778021ad8c623145d48a761f7e2c0efaa84997c074f4fcb2495ab82761d1ea73953afe1458db4d8335823f91b3a0c5f345d49c646424e377ce79117b3f7e8a9671f3e4b03ccfdd077d61ff4d33981a1aa6fa66c9e9b200130392557c88ebc0fd880f85c3005d3942bec33cbd6cc3c69ad7260575a65a76ce8ba3a727549c32120fc13c7f19872f403d3408446eac032d4825fa35e982d7ef77ee353c5916eaa3470363dc309abbb5b6477f324784cffc19174ba9f4edf1438c8d4d123348943f2f2208e8e53563f2bb8e019d77a91b063d3d9c7824eb4570f1b116c5bfa8c4059f68e5b3ef547c5b1cf5c274eb92f7ca013c8a7c344c36697cd68772981fe0a6fe835c58e62257f3e9c2d736b4945edfe6c8ce12afc909a3bd320736478c221d55c303434e98034903bffe6ccd15b6f09f4bfe3a09e95e2e6753070d4d9103bf6190a73e949750740c3cbc2f0a52e153d1e09435c5cd69b38c52d4ae9fbf75d893cd6916a9c8b14c4ee8444d48e6368a14906457129899ca35a19addefd49a1f1ccdbd27508da6a84735afac88b61c6ce293479d4793a2b2538309a1baec9c74ef3ab12431c31e7ef6bd8c320875695d3dd9566eb13a4bef3d5f191c7075dd0f42ccb3282f5fd4b2b774abc256b9ff621dc04eb1fb633cc2e5f6fff07866c5229, NULL, 15362, 'application/rtf', 'F', 'Rejection Letter sample', '2007-10-10', NULL, 999999, NULL, 0, 4),
(9, 'Client', NULL, NULL, 0, 'application/octet-stream', 'F', NULL, '2008-12-04', NULL, 999999, NULL, 1, NULL),
(10, 'Client Letter.rtf', 0x78dacd544d6f1331103d777f852fb9a016793fb3694f0828aad4429554e28051e4f5ce36165e3bf147d3a8ca7fc7b349aa5c222aca05958bdfd833f3fc663cbb0fccfa2e655c5c3b392c62799b6665c684118647d7a498ec6c179ab8cd4b9a3cb0ce68ef1bc53aca3a6b7aae595c2716dc3af094dcc81edc67584ff1fc7a767573b68d19c2286363ca19b3d06665c96e2d8046a351015c220e5152772682975e012178c2835f184b3e71bbc1ed9b48d42fb9de90d9d5f472b6ddb29edb5b35cee860d883d1e4341b0c9f5794dd4958afd32c2b76e65c22cdab7a67fe90ba4d13d642e779139313b6e4b6657e2598bf2f300af7072fb392b29548122cbc619dcb6ac2444709dbe7fd1eacd84a731f2c57c92f912fded0d01df5e5bbafe4cbf9f9c5fb8fb3887f9f1ed5e5d58e6234fa66d61aec5c5cf31ebe8f4609fab25c27526ce44a693aa67f2e5c304561d1f4b1e8e491e37e4c4b64298a5c224296566384ba9e44c8ab3443b5798ebe929615c2788cbeaaa42966c7c7419814e8ababaa7e494ad4513cd1b1577132a1ff5085923b2d75faeccbc63e8b602d683f6fb9c74ea3343c55120ff7ed7f76583a7928d335297d863ed27441a9396f5b0bce3de179e5aa5f675c3086cb8fa6707ac482c2e6e8d03760635b4ee266694da3a03f3ea0877b3fef41076c5b50da6818c6e6e803708bd916845c5c0e8fe4b80a9e7b69748c3d1d8286e5a2231b13c882df01c1ffcf2a80c328774c960ab803d21aa28d5c270b7032125c30f18688f89fe4c2931edefe3753ca9299d4022ca8cdf1fe131e66d404ed40c5a2f71ff6f65c27bd715c3073, '{\\rtf1\\ansi\\ansicpg1252\\cocoartf949\\cocoasubrtf350\n{\\fonttbl\\f0\\froman\\fcharset0 TimesNewRomanPSMT;}\n{\\colortbl;\\red255\\green255\\blue255;}\n{\\info\n{\\title  }\n{\\author Gary}\n{\\*\\company SMRLS}}\\margl720\\margr720\\margb302\\margt360\\vieww12240\\viewh13680\\viewkind1\n\\deftab720\n\\pard\\tqc\\tx4680\\pardeftab720\\ri0\\qc\n\\f0\\b\\fs28 \\cf0 \\\n\\pard\\pardeftab720\\ri0\\ql\\qnatural\n\\cf0 \\\n\\pard\\tqc\\tx4680\\pardeftab720\\ri0\\qc\n\\b0 \\cf0 LAW OFFICES OF\\\n\\pard\\tqc\\tx4680\\pardeftab720\\ri0\\qc\n\\b\\fs36 \\cf0 %%[owner_name]%%\n\\fs32 \\\n\\pard\\tqr\\tx10170\\pardeftab720\\ri0\\ql\\qnatural\n\\b0\\fs20 \\cf0 \\\n\\pard\\tx705\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\ri0\\ql\\qnatural\n\\fs24 \\cf0 \\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri810\\ql\\qnatural\n\\cf0 \\\n%%[current_date]%%\\\n%%[client_name]%%\\\n\\pard\\pardeftab720\\fi720\\ri0\\sb100\\ql\\qnatural\n\\cf0 %%[full_address]%%\\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri810\\ql\\qnatural\n\\cf0 \\\n\\pard\\tx705\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\ri0\\ql\\qnatural\n\\cf0\n\\ul %%[number]%%-%%[problem,problem,text_menu]%%\\ulnone \\\nDear %%[recipient_salutation]%%:\\\nIf you have any questions, please do not hesitate to contact me.\\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri810\\ql\\qnatural\n\\cf0 \\\nSincerely,\\\n%%[counsel]%% \\', 1562, 'application/rtf', 'F', 'Client Correspondence Letter Template', '2008-12-04', NULL, 999999, NULL, 0, 9),
(11, 'Letterhead Client Letter.rtf', 0x78dacd544b6f1331103e777f852f915c30b5c8de5736e911248444116a7ac328f27a671b0baf9df8d136aaf2dfebd9a455804af482cac5f3fc66be1dcffa9ebbd0332e8c57e321d7d72caf722eadb45c228566e56caffbd826b3a86876cf7b6b426835ef29ef9d1d84e1bd5c5c09e7215072a506f05fe1f612fddf161757e7bb8490565b9720e7dc41975715bf765c30069556474872cc52a6b74904153410821e11c3ca3af249b82d9aef52a1612dcc962c2e2ebf2c763b3e0877ad5959d251734f5acb1abad7c2a8dd28b8bd65795eeed5152bea66affe54a66319efa00fa29de634e36be13a1e369287bb12b3d07e8c72a7cec6261b9965388096f73e6f08973d25fc807d1ea0f9c688109dd0d92fd92febe48b9cfc067309c6289bd2bf37cc784b91287daa913dd5b99bd20a2b95659944ceea298aa6992551d42c47724581b18a56358ae91463754519a2d35051cc4a8c3575ddbc844ee2521e713930399bd17fc844ab039fba78f63a2693ef323a07262c3b11e0c76482dcd0ab153a8d180ece3f6fb957c7dfea5b469f69914af551eba5e83a07de1fd57aed4f7fbd5518099c5c5cc2fc84474d3e080f739c9389430b2e4d889c9137c95e3bdb6a184e1f6580bbb01cc0c494f236218d3530aed2c947100e2b38906a3dde9b173a0611943529793e268dc7e79e6c6d242b710304df944d048f59fe94ac352426a4b3c4d84056e0552a5c3024585c22d3db5c27642003bcff7f3697670b652438d0dbd3c3bf3deead8dc683c629ee7dbb07e3e5edd8, '{\\rtf1\\ansi\\ansicpg1252\\cocoartf949\\cocoasubrtf350\n{\\fonttbl\\f0\\froman\\fcharset0 TimesNewRomanPSMT;}\n{\\colortbl;\\red255\\green255\\blue255;}\n{\\info\n{\\title  }\n{\\author Gary}\n{\\*\\company SMRLS}}\\margl1440\\margr1440\\margb1800\\margt1800\\vieww12240\\viewh13680\\viewkind1\n\\deftab720\n\\pard\\tqc\\tx4680\\pardeftab720\\ri-1440\\qc\n\\f0\\b\\fs28 \\cf0 \\\n\\pard\\pardeftab720\\ri-1440\\ql\\qnatural\n\\cf0 \\\n\\pard\\tqc\\tx4680\\pardeftab720\\ri-1440\\qc\n\\fs32 \\cf0 \\\n\\pard\\tqr\\tx10170\\pardeftab720\\ri-1440\\ql\\qnatural\n\\b0\\fs20 \\cf0 \\\n\\pard\\tx705\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\ri-1440\\ql\\qnatural\n\\fs24 \\cf0 \\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri-630\\ql\\qnatural\n\\cf0 \\\n%%[current_date]%%\\\n%%[client_name]%%\\\n\\pard\\pardeftab720\\fi720\\ri-1440\\sb100\\ql\\qnatural\n\\cf0 %%[full_address]%%\\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri-630\\ql\\qnatural\n\\cf0 \\\n\\pard\\tx705\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\ri-1440\\ql\\qnatural\n\\cf0\n\\ul Case: %%[number]%% - (%%[problem,problem,text_menu]%%)\\ulnone \\\nDear %%[recipient_salutation]%%:\\\nIf you have any questions, please do not hesitate to contact me.\\\n\\pard\\tx-90\\tx1444\\tx2167\\tx2889\\tx3612\\tx4334\\tx5056\\tx5779\\tx6501\\tx7224\\tx7946\\tx8668\\pardeftab720\\li720\\ri-630\\ql\\qnatural\n\\cf0 \\\nSincerely,\\\n%%[counsel]%% \\', 1519, 'application/rtf', 'F', 'Client Correspondence Letterhead Template', '2008-12-05', NULL, 999999, NULL, 0, 9),
(12, 'Citizenship Attestation Form.rtf', 0x78dabd554d6fdb46103d4bbf626e6d5c304325f5e1daf1c108da18c925391845118080b15c5c0ec58d49aebcbb946c07f9ef79b3a46429fe2a0ab43c7057d4eccc7bf36666bf652e9469a65a6fe24baf96e97431cdb4d556e1afd3f969bff75d8e9fb34532fe9695b60d21afb332c94abf31de67a5ae94f31c12fac0f59a83d1eaec3b2cb5adad83e959e6b8982e16d9d231b7b2c9eb8eb1c22a6b945bd6e97c9ec49ddbedf2f424e97721eed686379b74969cf4dbea241d3e5e9bb648c6d94ab95c220bb78be304ef349dc6e5f84496e9741e1771136e67b368323b8d26f379345924d104a765394ea3c9f1ef30b9a9b39b5685cea93ac6306ef8351ef72998ce29d36542d97f8741fc7219541e01e94738f20101dfae908b7e099b24bb66d79a76998cff30c1dc73eb2bb3a27721b00f2a18dbd285750d8ebf74f47fa3f56c9e5fe1f685fde8931d01e7f8eaea8a08afd1289dd01b5c221abd734c77b62345ba4f01d99242c5f4576b0217748944b0a7fc8e72e34245d6d110d6dcc7149d67e3119ef79e3a2f07b4e90a55a8d652c1545b4fef91cb022b1ccab28a1eb4690cb7c192dd73a7a3bb0177fa3321a99f67390aa7c86b0a5ea38f65cf09dc5a1bc0ed90ccc0f4882ab5eed9e7683b5a3ad58ad58a5da35aa023c7de14b29172e8fc40f5d2c02b453f2f523d5c228fcf8c2804333921ff1269dbd89d6b7e08c7bdffd91e8308108367c3181094fd723afbf419ef3921735c2252699c0f1436966e3ab847fe107555b3f2db63945ba8867a09be57d6f89deddb1d1f8d91856f763f84a25a412e671a76d844ed1c2fbb36280902194bb5c67b38cbd13c5a2118b2839c08e3dda1b7d9834aa3991296dbe2c31073060401c0db866dcbb4a92c012aa49b5c5c4eb68a0d028c24cfa49597745c223ca97ad9a19c404cdeaf2b7346f65c304cbe0f46f20a0a5c223b12863895a98ba7f1c08fdb411aea9f6b9c2ee00b91bb96509e519c7f814aefa3eada214947d816d05560aa250bc6690ab18bf8a5071b711f0285c1cf48bdad033b7b44b9fa6aa11e31d00934f8bb131e117b4fe355e87707d00b81fe61db5d6ab5aa45de12d5f26c73450ad2adb1171d7f652d20d543d9166adb5c2223f8eebd6a2901a8a5b6eeb4517b1d051e801c7b507ce21abe970395920202e3523e9def419f0bf0bf793b148bc684d017e6e399a8a41c1c97dd92f98c7a609f1d79d3eafeb8560d3f7d746ff03ccc1de5efeaae19185ea0646278a4575af1f1201dc608c21b7cde0180401e1a49c9ad45bf5eeb5c273d1c8e5c27e54d6dec7e3216072a1eccc88d095565eb02c3974a671b44c544182e4deba440716508f1a55d634837433b3d4ac576a61e40711c602faec044bcc5cd7e8882fb31834d8d10b9418c676af35c5c2ebe6cfc912ac80a5005eb5a6e8650a9d00f518b09658589545c220bd45ffd1b91172d772dc983b5b60ef51326d9f88b1d5c5cf47d2d534f72e20cdcf8e1af7895f1a011bca04c61e6017cf0a3fca48775f5d233bafa5c274f36fe13b07fbb905a8ecd8189be8cb72a3e1ab4421fe9fb0fc111a2b9, '{\\rtf1\\ansi\\ansicpg1252\\cocoartf949\\cocoasubrtf350\n{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;}\n{\\colortbl;\\red255\\green255\\blue255;}\n\\margl1440\\margr1440\\margb1800\\margt1800\\vieww13080\\viewh8100\\viewkind0\n\\pard\\tx560\\tx1120\\tx1680\\tx2240\\tx2800\\tx3360\\tx3920\\tx4480\\tx5040\\tx5600\\tx6160\\tx6720\\ql\\qnatural\\pardirnatural\n\\f0\\fs24 \\cf0 \\\n\\pard\\tx560\\tx1120\\tx1680\\tx2240\\tx2800\\tx3360\\tx3920\\tx4480\\tx5040\\tx5600\\tx6160\\tx6720\\pardeftab720\\qc\\pardirnatural\n\\b \\cf0 \\expnd0\\expndtw0\\kerning0\nCitizenship Attestation Form\n\\b0 \\expnd0\\expndtw0\\kerning0\n\\pard\\tx560\\tx1120\\tx1680\\tx2240\\tx2800\\tx3360\\tx3920\\tx4480\\tx5040\\tx5600\\tx6160\\tx6720\\pardeftab720\\ql\\qnatural\\pardirnatural\n\\cf0 \\expnd0\\expndtw0\\kerning0\n___  ___\n1. )\nAre you a citizen of the United States by birth or naturalization?\\\nEs usted ciudadano de los Estados Unidos por nacimiento o naturalizacion?\\kerning1\\expnd0\\expndtw0 \\\n\\expnd0\\expndtw0\\kerning0\n2. )\nIf you are not a United States citizen, have you been granted permanent resident status?\\\nSi no es ciudadano de los Estados Unidos, se le ha dado estado  como residente permanente?\\\n3. )\nIf you have answered \\''93NO\\''94 to the first two questions, please answer both parts of this question:\\\nSi contesto \\''93NO\\''94 a las primeras dos preguntas, por favor conteste las dos partes de esta pregunta:\\\n3a. )\nAre you married to someone who is a U.S. citizen?\\\nEsta casado con alguien quien es ciudadano de los Estados Unidos; o\\\n3b. )\nAre you the parent of a child who is a U.S. citizen; or\\\nEs usted el padre de un nino que es ciudadano de los Estados Unidos; o\\\n3c. )\nAre you unmarried, under the age of 21 and the child of a U.S. citizen; and\\\nEs usted soltero, bajo la edad de 21 y el nino de un ciudadano de los Estados Unidos; y\\\n3d. )\nHave you applied for permanent resident status and not been rejected as of this date?\\\nHa applicado para residencia permanente y no le han rechazado hasta la fecha?\\\n4. )\nWere you admitted to the United States as a refugee; \\\nOr since you came to the United States have you ben granted asylum?\\\nFue admitido a los Estados Unidos como refugiado; \\\nO desde que vino usted a los Estados Unidos se le ha dado asilio?\\\n5. )\nHave you been granted withholding from deportation order by the government of the United States?\\\nSe le ha dado retention de orden de deportation de parte del gobierno de los Estados Unidos?\\\nI hereby declare that the foregoing statement(s) as marked are correct.\\\nYo declaro que las anteriores declaraciones como marcadas son correctas.\\\n_____________________________\n_____________________________________\\\nDate/Fecha\nSignature/Firma\\', 2765, 'application/rtf', 'F', NULL, '2008-12-05', NULL, 999999, NULL, 0, 9),
(13, 'Authorization of Representation.rtf', 0x78daad544d73da30103de35fb1176e34630cb4a139b9036999e12383c9a5555c2723db6b5bad2d39b20c2599fcf7ae6c127a68289d8961cca295debedd7dab47a64dd2675c5c56a2794565daf7461e8b54a438b9c6c3716b5775487f0723d779648992c684394b5c5c96543b51552c8932ae2b342ef85af07cb1b962849a685570f98773230aac96b85bdbf59b80b63d115c5ca472a509ef8a698cbdd188a51a515a23cc6ba45fdac50aaed3bc3f1cba8da51b6b2b70b7f3467db735b3fe60fcbe357f0a19bb0e8b31313cfce09159721d37afe725a6c53bef92dd478e63130929156f082c4a5c5c087851e608734c790ebe8899d3f70643587021213044ce305c27a88541e893a10a0a8d1a7b701b80dd38620eab73608e7fbbf9b25acfbefa9bd96a09ab6b584f6fd6d360badcb42bfe72424bf3a91f4cad77b6bc5ead17adcb61a10b845c229544426a3eafa690b37bc94dad79ee34fc3b9b4c54405fa320426d44b207937103b31edc9dfbf420e35b84546c5142b1075e965a6da920044aec20f01737f329cca79ffd39f8b349c3d83a35961a2b94060a04aa58c18d415dd17ace0dc6768bc9101295e76a5c2764faf13fd273acacc2b64b776ffac0d90c6c636c7ce6bc2d035b84b7473cb7ac87a43a7f6b6dab46d213af4da6b47868bb28a430825a0a4a43a4645c5c4706b8dc5b3ba1799051e3c9906bea728f5c5ccd29151a3b479cb6957b5049732456515d90642a9018615571bd5c2781e8a39608e1205c27ab1d1e2a92e6415817cd7c743e598d13479bc01a73e415b6929c1d6937b14a3aa3648fb8a55c5c8a076e44fb0f5202d5d2d22095db98666f095bd98b188f5c5ce8c4162b4bfdf562ed84c9882de55034016c549bb7cde3305c306d121a0fb58a0ff9f4e85894d7b1dd5966cad0e55b8a369cc510d24ed64bbddae44fdd6e4d5b5c27fe663a69ebf35c22f89837e5ffc72de0b9ad717198d293d1b473ce64d29d29d2467ad8b1cf33a2f9351e8fe93d188f2f4fc133a7dbfd16e582f2bf93bcc0efdd6ea7636f06385c22b9a7707e3ce330e7e93760ca6241, '{\\rtf1\\ansi\\ansicpg1252\\cocoartf949\\cocoasubrtf350\n{\\fonttbl\\f0\\fswiss\\fcharset0 ArialMT;\\f1\\froman\\fcharset0 TimesNewRomanPSMT;}\n{\\colortbl;\\red255\\green255\\blue255;}\n\\margl1440\\margr1440\\vieww25100\\viewh13960\\viewkind0\n\\deftab720\n\\pard\\pardeftab720\\ri-28\\qc\n\\f0\\b\\fs24 \\cf0 Sample Legal Aid\\\n1234 Main Street\\\nSuite 1\\\nSomewhere, US 12345\\\n\\ul \\\nAUTHORIZATION OF REPRESENTATION AND RELEASE OF INFORMATION\n\\b0 \\ulnone \\\n\\pard\\pardeftab720\\ri-28\\ql\\qnatural\n\\cf0\nThis is to certify that I, _________________________________________, have given my approval to\n\\b SAMPLE LEGAL AID\n\\b0  to represent me in matters related to the following:\\\n\\pard\\pardeftab720\\ri-28\\ql\\qnatural\n\\f1\\b \\cf0 ______________________________________________________________________________ \\\n\\pard\\pardeftab720\\ri-28\\ql\\qnatural\n\\b0 \\cf0 \\\n______________________________________________________________________________\\\n______________________________________________________________________________\\\n\\pard\\pardeftab720\\ri-28\\ql\\qnatural\n\\f0 \\cf0\n\\b SAMPLE LEGAL AID\n\\b0 is authorized to initiate or conduct any conference or hearing, and to obtain a copy of any documents necessary for representing me in the above matters. \\\nBy this\n\\b Release\n\\b0  I authorize any person, organization, or governmental entity to provide representatives of\n\\b SAMPLE LEGAL AID\n\\b0 with information pertaining to the above referenced matter, including photocopies of pertinent documents. \\\n\\pard\\pardeftab720\\ri-28\\qc\n\\cf0 DATED this ________ day of ______________________________,20______.\\\n\\pard\\pardeftab720\\ri-28\\qr\n\\cf0 _______________________________\\\nSignature\n\\pard\\tx999\\tx3998\\pardeftab720\\ri-28\\qr\n\\cf0 \\\n%%[client_name]%%\n\\f1 \\\n\\pard\\tx0\\tx3998\\pardeftab720\\ri-28\\qj\n\\cf0 \\', 1793, 'application/rtf', 'F', 'Authorization of Representation and Release of Information Form', '2008-12-05', NULL, 999999, NULL, 0, 9);
INSERT INTO `groups` VALUES ('system', NULL, 1, NULL, 1, 1, 1, 1, NULL);
INSERT INTO `groups` VALUES ('default', NULL, 1, NULL, 1, 0, 0, 0, NULL);
INSERT INTO `rss_feeds` VALUES (1, 'Pika Software Blog', 'http://pikasoftware.blogspot.com/feeds/posts/default?alt=atom', '', 2, 0, 3, '2009-12-30 10:39:08', '2009-04-10 11:00:00');
INSERT INTO `rss_feeds` VALUES (2, 'LSNTAP', 'http://lsntap.org/rss.xml', '', 1, 0, 3, '2009-12-30 10:39:21', '2009-04-16 11:36:06');
INSERT INTO `rss_feeds` VALUES (3, 'Legal Services Corp - LSC Updates', 'http://lsc.gov/lscfeed.xml', '', 1, 0, 3, '2011-09-08 14:27:51', '2011-09-08 14:27:21');
DELETE FROM counters;

INSERT INTO counters VALUES ('users',0);
INSERT INTO counters VALUES ('pb_attorneys',0);
INSERT INTO counters VALUES ('motd',0);
INSERT INTO counters VALUES ('contacts',0);
INSERT INTO counters VALUES ('case_number',0);
INSERT INTO counters VALUES ('conflict',0);
INSERT INTO counters VALUES ('compens',0);
INSERT INTO counters VALUES ('charges',0);
INSERT INTO counters VALUES ('cases',0);
INSERT INTO counters VALUES ('case_charges',0);
INSERT INTO counters VALUES ('aliases',0);
INSERT INTO counters VALUES ('activities',0);
INSERT INTO counters VALUES ('doc_storage',13);
INSERT INTO counters VALUES ('flags',12);
INSERT INTO counters VALUES ('transfer_options',0);
INSERT INTO counters VALUES ('case_tabs',6);
INSERT INTO counters VALUES ('rss_feeds',2);



