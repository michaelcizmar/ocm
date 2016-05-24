ALTER TABLE cases 
CHANGE outcome_income_before outcome_income_after_service MEDIUMINT default NULL,
CHANGE outcome_income_after outcome_income_no_service MEDIUMINT default NULL,
CHANGE outcome_assets_before outcome_assets_after_service MEDIUMINT default NULL,
CHANGE outcome_assets_after outcome_assets_no_service MEDIUMINT default NULL,
CHANGE outcome_debt_before outcome_debt_after_service MEDIUMINT default NULL,
CHANGE outcome_debt_after outcome_debt_no_service MEDIUMINT default NULL;

ALTER TABLE cases 
ADD COLUMN ca_outcome_amount_obtained MEDIUMINT default NULL AFTER outcome_debt_no_service,
ADD COLUMN ca_outcome_monthly_obtained MEDIUMINT default NULL AFTER ca_outcome_amount_obtained,
ADD COLUMN ca_outcome_amount_reduced MEDIUMINT default NULL AFTER ca_outcome_monthly_obtained,
ADD COLUMN ca_outcome_monthly_reduced MEDIUMINT default NULL AFTER ca_outcome_amount_reduced;

INSERT INTO `settings` VALUES ('ca_iolta_outcomes', '0');

#pt-online-schema-change --dry-run --alter "CHANGE outcome_income_before outcome_income_after_service MEDIUMINT default NULL, \
#CHANGE outcome_income_after outcome_income_no_service MEDIUMINT default NULL, \
#CHANGE outcome_assets_before outcome_assets_after_service MEDIUMINT default NULL, \
#CHANGE outcome_assets_after outcome_assets_no_service MEDIUMINT default NULL, \
#CHANGE outcome_debt_before outcome_debt_after_service MEDIUMINT default NULL, \
#CHANGE outcome_debt_after outcome_debt_no_service MEDIUMINT default NULL" D=wtls,t=cases
 
