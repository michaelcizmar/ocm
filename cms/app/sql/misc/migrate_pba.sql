ALTER TABLE `users` CHANGE `user_id` `user_id` INT( 11 ) DEFAULT '0' NOT NULL
 AUTO_INCREMENT;
 
INSERT INTO users
(username,
enabled,
group_id,
first_name,
last_name,
middle_name,
extra_name,
description,
email,
attorney,
firm,
phone_notes,
address,
address2,
city,
state,
zip,
county,
languages,
practice_areas,
notes,
last_case)

SELECT 
CONCAT(last_name, pba_id) AS username,
'1' AS enabled,
'default' AS group_id,
first_name,
last_name,
middle_name,
extra_name,
'Volunteer Attorney' AS description,
email,
'2' AS attorney,
firm,
phone_notes,
address,
address2,
city,
state,
zip,
county,
languages,
practice_areas,
notes,
last_case
FROM private.pb_attorneys;

ALTER TABLE `users` CHANGE `user_id` `user_id` INT( 11 ) NOT NULL;
