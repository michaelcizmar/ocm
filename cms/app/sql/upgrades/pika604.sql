ALTER TABLE cases MODIFY veteran_household tinyint(4) default NULL;
ALTER TABLE activities ADD last_changed_user_id int(11) DEFAULT NULL AFTER created;
ALTER TABLE counters MODIFY id char(32) NOT NULL DEFAULT 'COUNTERNAME';
ALTER TABLE menu_sp_problem MODIFY menu_order smallint NOT NULL DEFAULT '0';
ALTER TABLE users ADD last_addr varchar(50) DEFAULT NULL AFTER session_data,
ADD last_active varchar(11) DEFAULT NULL AFTER last_addr;