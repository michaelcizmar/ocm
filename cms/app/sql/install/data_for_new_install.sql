INSERT INTO `settings` VALUES ('act_interval','0'),('admin_email','admin@legalaidprogram'),('autonumber_on_new_case','1'),('cookie_prefix','Pika CMS at Legal Services Program'),('enable_benchmark','0'),('enable_compression','1'),('enable_system','1'),('force_https','1'),('owner_name','Legal Services Program'),('password_expire','0'),('pass_min_length','8'),('pass_min_strength','3'),('session_timeout','28800'),('time_zone','America/New_York'),('time_zone_offset','0');

INSERT INTO `case_tabs` VALUES (1, 'Notes', 'case-act.php', 1, 1, 0, 1, '2009-07-21 17:34:51', '2009-12-29 23:08:37');
INSERT INTO `case_tabs` VALUES (2, 'Conflicts', 'case-conflict.php', 1, 2, 0, 1, '2009-07-21 17:39:16', '2009-11-23 15:11:04');
INSERT INTO `case_tabs` VALUES (3, 'Eligibility', 'case-elig.php', 1, 3, 0, 1, '2009-07-21 17:40:06', '2009-11-23 15:11:04');
INSERT INTO `case_tabs` VALUES (4, 'Info', 'case-info.php', 1, 4, 0, 1, '2009-07-21 17:40:25', '2009-12-30 00:19:58');
INSERT INTO `case_tabs` VALUES (5, 'Pro Bono', 'case-pb.php', 1, 5, 0, 1, '2009-12-30 11:43:36', '2009-11-23 15:11:29');
INSERT INTO `case_tabs` VALUES (6, 'Documents', 'case-docs.php', 1, 6, 0, 1, '2009-07-21 18:00:45', '2009-12-29 22:52:27');
INSERT INTO `case_tabs` VALUES (7, 'Compensation', 'case-compen.php', 1, 7, 0, 1, '2009-07-21 18:00:45', '2009-12-29 22:52:27');
INSERT INTO `case_tabs` VALUES (8, 'LITC', 'case-litc.php', 1, 8, 0, 1, '2009-07-21 18:00:45', '2009-12-29 22:52:27');

DELETE FROM counters;

INSERT INTO counters VALUES ('users',1);
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
INSERT INTO counters VALUES ('case_tabs',8);
INSERT INTO counters VALUES ('rss_feeds',2);

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

INSERT INTO `groups` VALUES ('system', NULL, 1, NULL, 1, 1, 1, 1, NULL);
INSERT INTO `groups` VALUES ('default', NULL, 1, NULL, 1, 0, 0, 0, NULL);

INSERT INTO `rss_feeds` VALUES (1, 'Pika Software Blog', 'http://pikasoftware.blogspot.com/feeds/posts/default?alt=atom', '', 2, 0, 3, '2009-12-30 10:39:08', '2009-04-10 11:00:00');
INSERT INTO `rss_feeds` VALUES (2, 'LSNTAP', 'http://lsntap.org/rss.xml', '', 1, 0, 3, '2009-12-30 10:39:21', '2009-04-16 11:36:06');
INSERT INTO `rss_feeds` VALUES (3, 'Legal Services Corp - LSC Updates', 'http://lsc.gov/lscfeed.xml', '', 1, 0, 3, '2011-09-08 14:27:51', '2011-09-08 14:27:21');

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (1, 'pikasupport', '', 1, 'system', 'Default', NULL, 'Account', NULL, NULL, 'support@legalservices.org', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
