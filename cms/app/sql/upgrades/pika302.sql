-- MySQL dump 9.10
--
-- Host: localhost    Database: gila
-- ------------------------------------------------------
-- Server version	4.0.17-standard

--
-- Table structure for table `menu_report_format`
--

CREATE TABLE menu_report_format (
  value char(4) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (menu_order),
  KEY label (label),
  KEY val (value)
) TYPE=MyISAM;

--
-- Dumping data for table `menu_report_format`
--

INSERT INTO menu_report_format VALUES ('html','Normal',0);
INSERT INTO menu_report_format VALUES ('pdf','PDF',1);
INSERT INTO menu_report_format VALUES ('csv','Spreadsheet',2);

--
-- Table structure for table `menu_annotate_cases`
--

CREATE TABLE menu_annotate_cases (
  value char(32) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (menu_order),
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

--
-- Dumping data for table `menu_annotate_cases`
--

INSERT INTO menu_annotate_cases VALUES ('number','Case Number',0);

--
-- Table structure for table `menu_annotate_contacts`
--

CREATE TABLE menu_annotate_contacts (
  value char(32) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (menu_order),
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

--
-- Dumping data for table `menu_annotate_contacts`
--


--
-- Table structure for table `menu_annotate_activities`
--

CREATE TABLE menu_annotate_activities (
  value char(32) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (menu_order),
  KEY label (label),
  KEY val (value),
  KEY menu_order (menu_order)
) TYPE=MyISAM;

--
-- Dumping data for table `menu_annotate_activities`
--


