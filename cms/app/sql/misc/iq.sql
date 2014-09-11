#
# Table structure for table `q_completed`
#

CREATE TABLE q_completed (
  completed_id int(10) unsigned NOT NULL auto_increment,
  questionnaire_id int(10) unsigned default NULL,
  case_id int(10) unsigned default NULL,
  user_id int(10) unsigned default NULL,
  completed_time timestamp(14) NOT NULL,
  PRIMARY KEY  (completed_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `q_questionnaires`
#

CREATE TABLE q_questionnaires (
  questionnaire_id int(10) unsigned NOT NULL auto_increment,
  title varchar(255) default NULL,
  problem char(3) default NULL,
  special_problem char(3) default NULL,
  revision tinyint(4) NOT NULL default '1',
  active tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (questionnaire_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `q_questions`
#

CREATE TABLE q_questions (
  question_id int(10) unsigned NOT NULL auto_increment,
  questionnaire_id int(10) unsigned NOT NULL default '0',
  question_text text,
  question_order int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (question_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `q_responses`
#

CREATE TABLE q_responses (
  response_id int(10) unsigned NOT NULL auto_increment,
  completed_id int(10) unsigned NOT NULL default '0',
  question_id int(10) unsigned NOT NULL default '0',
  response_text text NOT NULL,
  PRIMARY KEY  (response_id),
  KEY response_id (response_id)
) TYPE=MyISAM;
