INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='TOKENISER' LIMIT 1),	'TOKENISER',	'APPLICATION_KEY',	'APPLICATION_KEY',	( SELECT party_id FROM mdm.party WHERE party_name='AO0001' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_PROCESS' LIMIT 1),	'CHRON_JOB_PROCESS',	'INGENICO_PROCESS_JOB',	'INGENICO_PROCESS_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0002' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_PROCESS' LIMIT 1),	'CHRON_JOB_PROCESS',	'DANELYS_PROCESS_JOB',	'DANELYS_PROCESS_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0003' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_PROCESS' LIMIT 1),	'CHRON_JOB_PROCESS',	'INGENICO_STATUS',	'INGENICO_STATUS',	( SELECT party_id FROM mdm.party WHERE party_name='AO0004' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_PULL' LIMIT 1),	'CHRON_JOB_PULL',	'INGENICO_PULL_JOB',	'INGENICO_PULL_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0006' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_PULL' LIMIT 1),	'CHRON_JOB_PULL',	'DANELYS_PULL_JOB',	'DANELYS_PULL_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0007' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_REPULL' LIMIT 1),	'CHRON_JOB_REPULL',	'INGENICO_REPULL_JOB',	'INGENICO_REPULL_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0008' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CHRON_JOB_REPULL' LIMIT 1),	'CHRON_JOB_REPULL',	'DANELYS_REPULL_JOB',	'DANELYS_REPULL_JOB',	( SELECT party_id FROM mdm.party WHERE party_name='AO0009' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='SFTP' LIMIT 1),	'SFTP',	'INGENICO',	'INGENICO',	( SELECT party_id FROM mdm.party WHERE party_name='AO0010' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='SFTP' LIMIT 1),	'SFTP',	'DANELYS',	'DANELYS',	( SELECT party_id FROM mdm.party WHERE party_name='AO0011' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='EMAIL_CONFIG' LIMIT 1),	'EMAIL_CONFIG',	'EMAIL_CONFIG',	'EMAIL_CONFIG',	( SELECT party_id FROM mdm.party WHERE party_name='AO0012' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='CANCEL_JOB' LIMIT 1),	'CANCEL_JOB',	'CANCEL_JOB_CONFIG',	'CANCEL_JOB_CONFIG',	( SELECT party_id FROM mdm.party WHERE party_name='AO0013' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='IRE' LIMIT 1),	'IRE',	'IRE_CONFIG',	'IRE_CONFIG',	( SELECT party_id FROM mdm.party WHERE party_name='AO0014' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='IRE' LIMIT 1),	'IRE',	'ROUND_ROBIN',	'ROUND_ROBIN',	( SELECT party_id FROM mdm.party WHERE party_name='AO0015' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.app_rule(app_rule_type_id,rule_type, rule_name,desc_txt,party_id, active_flg,   created_by, created_at, updated_by, updated_at)VALUES(	(SELECT app_rule_type_id FROM mdm.app_rule_type WHERE name='FRAUD_ENGINE' LIMIT 1),	'FRAUD_ENGINE',	'SCORING',	'SCORING',	( SELECT party_id FROM mdm.party WHERE party_name='AO0016' LIMIT 1) ,	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
commit;