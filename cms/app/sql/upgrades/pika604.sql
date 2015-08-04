ALTER TABLE cases MODIFY veteran_household tinyint(4) default NULL;
ALTER TABLE counters MODIFY id char(32) NOT NULL DEFAULT 'COUNTERNAME';
ALTER TABLE menu_sp_problem MODIFY menu_order smallint NOT NULL DEFAULT '0';