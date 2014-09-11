ALTER TABLE `doc_storage` CHANGE `doc_data` `doc_data` longblob;

DROP TABLE settings;
CREATE TABLE settings (
  `label` char(255) NOT NULL default '',
  `value` text(255) NOT NULL default '',
  PRIMARY KEY  (`label`)
) ENGINE=InnoDB;

