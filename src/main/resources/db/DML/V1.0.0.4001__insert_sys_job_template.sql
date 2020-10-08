INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Repull Ingenico Recon File',	'Repull Recon File',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10007' LIMIT 1),	'0 12 5 * * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Batch Cancellation',	'Batch Cancellation',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10007' LIMIT 1),	'0 */15 * * * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Webhook',	'Webhook',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10001' LIMIT 1),	'0 */10 * * * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Process Ingenico Recon File',	'Process Recon File',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10007' LIMIT 1),	'0 11 7 * * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Pull Ingenico Recon File',	'Pull Recon File',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10007' LIMIT 1),	'0 0 0 25 * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO scheduler.sys_job_template(job_name, job_group_cd, party_id, cron_expression, desc_text, status_cd, created_by, created_at,  updated_by,updated_at)VALUES(	'Email',	'Email',	( SELECT party_id FROM mdm.party WHERE party_name='APXO10001' LIMIT 1),	'0 44 15 * * *?',	'  ',	'ACTIVE',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
COMMIT;