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