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
INSERT INTO `menu_annotate_cases` VALUES ('dom_viol', 'Domestic Abuse', 30);
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





