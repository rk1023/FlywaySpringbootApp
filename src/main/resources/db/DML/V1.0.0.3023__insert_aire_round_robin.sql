INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20002' LIMIT 1),	'DAY_BASED',	'DAYS',	'0',	'0,2,4,6',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20002' LIMIT 1),	'DAY_BASED',	'DAYS',	'0',	'1,3,5',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20003' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20003' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20004' LIMIT 1),	'VOLUME_BASED',	'ABSOLUTE',	'5000',	'3000',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20004' LIMIT 1),	'VOLUME_BASED',	'ABSOLUTE',	'5000',	'2000',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20005' LIMIT 1),	'TIME_RANGE_BASED',	'TIME_RANGE',	'0',	'0,10',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20005' LIMIT 1),	'TIME_RANGE_BASED',	'TIME_RANGE',	'0',	'10,23',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20006' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20006' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20007' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20007' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30001' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30001' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30002' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30002' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30003' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'60',	'APXO10007',	'APXO10014',	null,	null,	null,	'01-01-2020',	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_round_robin(rrbn_id, party_id, method_cd, counter_type_cd, counter_val, rrbn_val,psp, cascade_psp_01, cascade_psp_02, cascade_psp_03, cascade_psp_04, start_dt, end_dt, created_by, created_at, updated_by, updated_at)VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO30003' LIMIT 1),	'VOLUME_BASED',	'PERCENTAGE',	'5000',	'40',	'APXO10014',	'APXO10007',	null,	null,	null,	CURRENT_DATE,	null,	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
COMMIT;