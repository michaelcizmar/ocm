ALTER TABLE aliases ADD COLUMN keywords TEXT;
ALTER TABLE aliases ADD FULLTEXT(keywords);
CREATE TABLE name_variants (
  first_name char(255) NOT NULL default '',
  root_name char(255) NOT NULL default '',
  PRIMARY KEY  (first_name)
) ENGINE=InnoDB;
