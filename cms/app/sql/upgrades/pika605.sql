INSERT INTO `settings` VALUES ('autofill_time_funding','1');
START TRANSACTION;
ALTER TABLE user_sessions CHANGE created old_created TIMESTAMP,
	CHANGE last_updated old_last_updated TIMESTAMP;
ALTER TABLE user_sessions ADD created INT, ADD last_updated INT;
UPDATE user_sessions SET created = UNIX_TIMESTAMP(old_created),
	last_updated = UNIX_TIMESTAMP(old_last_updated);
ALTER TABLE user_sessions DROP old_created, DROP old_last_updated;
COMMIT;
