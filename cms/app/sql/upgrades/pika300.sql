-- New columns in the cases table.
ALTER TABLE `activities` ADD `act_end_time` TIME AFTER `act_time`;
ALTER TABLE `activities` ADD `act_type` CHAR(1) AFTER `completed`;

ALTER TABLE `cases` ADD `created` TIMESTAMP NOT NULL AFTER `last_changed` ,
ADD `doc_path` VARCHAR( 32 ) AFTER `created`;

ALTER TABLE `cases` ADD `just_income` VARCHAR( 3 ) AFTER `outcome`;

ALTER TABLE `cases` ADD `destroy_date` DATE AFTER `hours_okd` ,
ADD `source_db` VARCHAR( 16 ) AFTER `destroy_date`;

-- New documents table for document managment.
CREATE TABLE documents (
  doc_id int(11) NOT NULL default '0',
  filename varchar(64) NOT NULL default 'NONAME.txt',
  filepath varchar(32) default NULL,
  file_size mediumint(9) NOT NULL default '0',
  summary varchar(128) default NULL,
  creation_date date NOT NULL default '0000-00-00',
  file_type varchar(64) NOT NULL default 'text/plain',
  case_id int(11) default NULL,
  user_id int(11) NOT NULL default '0',
  keywords varchar(64) default NULL,
  doc_text text,
  orphaned tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (doc_id)
) TYPE=MyISAM;

-- New column in the users table.
ALTER TABLE `users` ADD `session_data` VARCHAR( 255 ) AFTER `group_id` ;

-- New menus.
#
# Table structure for table `menu_act_type`
#

CREATE TABLE menu_act_type (
  value char(1) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_act_type`
#

INSERT INTO menu_act_type VALUES ('N', 'Case Note', 0);
INSERT INTO menu_act_type VALUES ('L', 'LSC Other Matter', 1);
INSERT INTO menu_act_type VALUES ('T', 'Time Slip', 2);
INSERT INTO menu_act_type VALUES ('K', 'Tickler', 3);
# --------------------------------------------------------

#
# Table structure for table `menu_case_tabs`
#

CREATE TABLE menu_case_tabs (
  value char(8) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_case_tabs`
#

INSERT INTO menu_case_tabs VALUES ('act', 'Notes', 0);
INSERT INTO menu_case_tabs VALUES ('conflict', 'Conflict', 1);
INSERT INTO menu_case_tabs VALUES ('elig', 'Eligibility', 2);
INSERT INTO menu_case_tabs VALUES ('info', 'Case Info', 3);
INSERT INTO menu_case_tabs VALUES ('pb', 'Pro Bono', 4);
INSERT INTO menu_case_tabs VALUES ('lit', 'Litigation', 5);
INSERT INTO menu_case_tabs VALUES ('compen', 'Compen.', 6);
INSERT INTO menu_case_tabs VALUES ('docs', 'Documents', 7);
INSERT INTO menu_case_tabs VALUES ('vawa', 'VAWA', 8);
# --------------------------------------------------------

#
# Table structure for table `menu_gender`
#

CREATE TABLE menu_gender (
  value char(1) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_gender`
#

INSERT INTO menu_gender VALUES ('F', 'Female', 0);
INSERT INTO menu_gender VALUES ('M', 'Male', 1);
# --------------------------------------------------------

#
# Table structure for table `menu_income_freq`
#

CREATE TABLE menu_income_freq (
  value char(3) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_income_freq`
#

INSERT INTO menu_income_freq VALUES ('A', 'Annual', 0);
INSERT INTO menu_income_freq VALUES ('M', 'Monthly', 1);
INSERT INTO menu_income_freq VALUES ('B', 'Bi-Weekly', 2);
INSERT INTO menu_income_freq VALUES ('W', 'Weekly', 3);
# --------------------------------------------------------

#
# Table structure for table `menu_just_income`
#

CREATE TABLE menu_just_income (
  value char(3) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_just_income`
#

INSERT INTO menu_just_income VALUES ('A', 'Govmt. Benefits Program', 0);
INSERT INTO menu_just_income VALUES ('B', 'High medical expenses', 1);
INSERT INTO menu_just_income VALUES ('C', 'Lack of Affordable Altern.', 2);
INSERT INTO menu_just_income VALUES ('D', 'Title III', 3);
# --------------------------------------------------------

#
# Table structure for table `menu_undup`
#

CREATE TABLE menu_undup (
  value tinyint(4) NOT NULL default '0',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_undup`
#

INSERT INTO menu_undup VALUES (1, 'Unduplicated Service', 0);
INSERT INTO menu_undup VALUES (0, 'Duplicated Service', 1);
# --------------------------------------------------------

#
# Table structure for table `menu_yes_no`
#

CREATE TABLE menu_yes_no (
  value tinyint(4) NOT NULL default '0',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

#
# Dumping data for table `menu_yes_no`
#

INSERT INTO menu_yes_no VALUES (1, 'Yes', 0);
INSERT INTO menu_yes_no VALUES (0, 'No', 1);


