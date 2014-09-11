#!/bin/sh

SQL_DIR=~/Sites/danio/app/sql/install/
MYSQL_USER=root
MYSQL_PASS=root
DB_NAME=danio
MYSQLDUMP_PATH=/usr/local/mysql/bin/mysqldump
cd $SQL_DIR

# --compatible=mysql40 --password=$MYSQL_PASS 
$MYSQLDUMP_PATH -d -u $MYSQL_USER --add-drop-table=FALSE \
	-Q -e --add-locks \
	--disable-keys=FALSE $DB_NAME \
	activities aliases cases conflict contacts counters \
	documents groups motd pb_attorneys settings transfer_options \
	users zip_codes \
	> structure.sql

# --compatible=mysql40  --password=$MYSQL_PASS
$MYSQLDUMP_PATH -u $MYSQL_USER --add-drop-table=FALSE \
	-Q -e --add-locks \
	--disable-keys=FALSE $DB_NAME \
	menu_act_type menu_annotate_activities menu_annotate_cases \
	menu_annotate_contacts menu_asset_type menu_attorney_status \
	menu_case_status menu_case_tabs menu_case_tabs2 \
	menu_category menu_citizen menu_close_code menu_disposition \
	menu_dom_viol menu_ethnicity menu_funding menu_gender \
	menu_income_freq menu_income_type menu_intake_type menu_just_income \
	menu_language menu_lit_status menu_lsc_other_services \
	menu_main_benefit menu_marital menu_office menu_outcome menu_poverty \
	menu_problem menu_referred_by menu_reject_code menu_relation_codes \
	menu_report_format menu_residence menu_sp_problem menu_undup \
	menu_yes_no \
	> menus.sql

