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
  created timestamp NULL DEFAULT NULL,
  last_changed_user_id int DEFAULT NULL,
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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

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
  `created` created TIMESTAMP NULL DEFAULT NULL,
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
  `veteran_household` tinyint(4) default NULL,
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
) ENGINE = INNODB;


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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` char(16) NOT NULL default 'COUNTERNAME',
  `count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE = INNODB;


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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_act_type` (
  `value` char(1) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_annotate_activities` (
  `value` char(32) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_annotate_cases` (
  `value` char(32) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_annotate_contacts` (
  `value` char(32) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`),
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_asset_type` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_attorney_status` (
  `value` char(1) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_case_status` (
  `value` char(1) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_category` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_citizen` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_close_code` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_close_code_2007` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_close_code_2008` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_comparison` (
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_comparison_sql` (
  `value` varchar(25) NOT NULL DEFAULT '0',
  `label` varchar(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_disposition` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_doc_type` (
  `value` char(1) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_dom_viol` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_ethnicity` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_funding` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_gender` (
  `value` char(1) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_income_freq` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_income_type` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_intake_type` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_just_income` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_language` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_lit_status` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_lsc_income_change` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_lsc_other_services` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_main_benefit` (
  `value` char(4) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` smallint(6) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_marital` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_office` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_outcome` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_poverty` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_problem` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_problem_2007` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_problem_2008` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_referred_by` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_reject_code` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_relation_codes` (
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `label` char(30) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_report_format` (
  `value` char(4) NOT NULL DEFAULT '',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_order`),
  KEY `label` (`label`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_residence` (
  `value` char(3) NOT NULL DEFAULT '',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_sp_problem` (
  `value` char(3) NOT NULL DEFAULT '0',
  `label` char(80) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_transfer_mode` (
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_undup` (
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_yes_no` (
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `label` char(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

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
) ENGINE = INNODB;


-- 
-- Table structure for table `settings`
-- 

CREATE TABLE settings (
  `label` char(255) NOT NULL default '',
  `value` mediumtext NOT NULL default '',
  PRIMARY KEY  (`label`)
) ENGINE=InnoDB;

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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

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
) ENGINE = INNODB;

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

