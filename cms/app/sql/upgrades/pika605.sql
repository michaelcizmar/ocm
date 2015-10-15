INSERT INTO `settings` VALUES ('autofill_time_funding','1');
START TRANSACTION;
ALTER TABLE user_sessions CHANGE created old_created TIMESTAMP,
	CHANGE last_updated old_last_updated TIMESTAMP;
ALTER TABLE user_sessions ADD created INT, ADD last_updated INT;
UPDATE user_sessions SET created = UNIX_TIMESTAMP(old_created),
	last_updated = UNIX_TIMESTAMP(old_last_updated);
ALTER TABLE user_sessions DROP old_created, DROP old_last_updated;
COMMIT;

--
-- Table structure for table outcome_goals
--

CREATE TABLE outcome_goals (
  outcome_goal_id INT NOT NULL default '0',
  goal CHAR(128),
  problem CHAR(2),
  active TINYINT,
  outcome_goal_order INT,
  PRIMARY KEY  (outcome_goal_id),
  KEY problem (problem)
) ENGINE = INNODB;

--
-- Table structure for table outcome_goals
--

CREATE TABLE outcomes (
  outcome_id INT NOT NULL default '0',
  case_id INT,
  outcome_goal_id INT,
  result TINYINT,
  PRIMARY KEY  (outcome_id),
  KEY case_id (case_id)
) ENGINE = INNODB;

ALTER TABLE cases
ADD COLUMN outcome_notes TEXT default NULL AFTER outcome,
ADD COLUMN outcome_income_before MEDIUMINT default NULL AFTER outcome,
ADD COLUMN outcome_income_after MEDIUMINT default NULL AFTER outcome_income_before,
ADD COLUMN outcome_assets_before MEDIUMINT default NULL AFTER outcome_income_after,
ADD COLUMN outcome_assets_after MEDIUMINT default NULL AFTER outcome_assets_before,
ADD COLUMN outcome_debt_before MEDIUMINT default NULL AFTER outcome_assets_after,
ADD COLUMN outcome_debt_after MEDIUMINT default NULL AFTER outcome_debt_before;
