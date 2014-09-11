-- Add volunteer atty fields to users table.
ALTER TABLE users 
  ADD  firm varchar(64) default NULL,
  ADD  address varchar(64) default NULL,
  ADD  address2 varchar(64) default NULL,
  ADD  city varchar(24) default NULL,
  ADD  state varchar(24) default NULL,
  ADD  zip varchar(15) default NULL,
  ADD  county varchar(64) default NULL,
  ADD  phone_notes varchar(64) default NULL,
  ADD  languages varchar(64) default NULL,
  ADD  practice_areas varchar(64) default NULL,
  ADD  notes varchar(255) default NULL,
  ADD  last_case date default NULL;


-- Add new menu for users.attorney field.
CREATE TABLE menu_attorney_status (
  value char(1) NOT NULL default '',
  label char(65) NOT NULL default '',
  menu_order tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (menu_order),
  KEY label (label),
  KEY val (value)
) TYPE=MyISAM;

INSERT INTO menu_attorney_status VALUES ('0', 'N/A', 0);
INSERT INTO menu_attorney_status VALUES ('1', 'Staff', 1);
INSERT INTO menu_attorney_status VALUES ('2', 'Volunteer', 2);



-- Add table that store case transfer targets.
CREATE TABLE transfer_options (
  id int(11) NOT NULL default '0',
  label char(64) NOT NULL default 'NONAME',
  url char(128) NOT NULL default '',
  transfer_mode char(16) NOT NULL default 'pikatx01',
  PRIMARY KEY  (id)
) TYPE=MyISAM;
