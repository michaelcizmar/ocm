ALTER TABLE `cases` ADD `lsc_income_change` TINYINT AFTER `outcome` ;

CREATE TABLE `menu_lsc_income_change` (
  `value` char(3) NOT NULL default '',
  `label` char(80) NOT NULL default '',
  `menu_order` tinyint(4) NOT NULL default '0',
  KEY `label` (`label`),
  KEY `menu_order` (`menu_order`),
  KEY `val` (`value`)
) ENGINE=MyISAM;


INSERT INTO `menu_lsc_income_change` VALUES ('0', 'Not Likely to Change', 0);
INSERT INTO `menu_lsc_income_change` VALUES ('1', 'Likely to Increase', 1);
INSERT INTO `menu_lsc_income_change` VALUES ('2', 'Likely to Decrease', 2);

CREATE TABLE IF NOT EXISTS `menu_comparison_sql` (
  `value` varchar(25) NOT NULL DEFAULT '0',
  `label` varchar(65) NOT NULL DEFAULT '',
  `menu_order` tinyint(4) NOT NULL DEFAULT '0',
  KEY `label` (`label`),
  KEY `val` (`value`),
  KEY `menu_order` (`menu_order`)
) ENGINE=MyISAM;

INSERT INTO `menu_comparison_sql` (`value`, `label`, `menu_order`) VALUES
('=', '=', 0),
('LIKE', '= (wildcard match)', 1),
('!=', 'NOT =', 2),
('>', '&gt;', 3),
('<', '&lt;', 4),
('between', 'between', 5),
('is blank', 'is blank', 6),
('is not blank', 'is not blank', 7);