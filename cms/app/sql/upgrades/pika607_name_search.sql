ALTER TABLE contacts DROP COLUMN mp_first, DROP COLUMN mp_last;
ALTER TABLE aliases ADD COLUMN keywords TEXT;
ALTER TABLE aliases ADD FULLTEXT(first_name, middle_name, last_name, extra_name, keywords, ssn);
CREATE TABLE name_variants (
  first_name char(255) NOT NULL default '',
  root_name char(255) NOT NULL default '',
  PRIMARY KEY  (first_name)
) ENGINE=InnoDB;
