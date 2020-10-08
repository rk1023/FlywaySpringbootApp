INSERT INTO mdm.aire_rule(aire_rule_id,party_id, rule_type_cd, rule_name, rr_method_cd,  currency_cd, amount, issuer_cntry_cd, merchant_cntry_cd, consumer_cntry_cd, card_brand, channel_cd, merchant_website, bin_card_type, bin_scheme_name, bin_cntry_cd, bin_issuer_name, three_ds_version, num_cond_01, num_cond_02, num_cond_03, num_cond_04, num_cond_05, char_cond_06, char_cond_07, char_cond_08, char_cond_09, char_cond_10, char_cond_11, char_cond_12, psp_01, psp_02, psp_03, psp_04, priority , status_cd, start_dt, end_dt, created_by, created_at, updated_by, updated_at) VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20002' LIMIT 1),	'AIRE',	'RULE0001',	null,	'=(GBP)',	'>200',	null,	null,	'=(INDIA)',	'=(LOCAL BRAND)',	null,	null,	null,	'=(BIN_SCHEME)',	null,	'=(JPMORGAN)',	null,	null,	'=(NUM_COND2)',	null,	null,	null,	null,	'=(CHAR_COND7)',	null,	null,	null,	null,	'=(CHAR_COND12)',	'APXO10014',	'APXO10007',	'APXO10013',	null,	3,	'DRAFT',	'01-01-2020',	'01-01-2099',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_rule(aire_rule_id,party_id, rule_type_cd, rule_name, rr_method_cd,  currency_cd, amount, issuer_cntry_cd, merchant_cntry_cd, consumer_cntry_cd, card_brand, channel_cd, merchant_website, bin_card_type, bin_scheme_name, bin_cntry_cd, bin_issuer_name, three_ds_version, num_cond_01, num_cond_02, num_cond_03, num_cond_04, num_cond_05, char_cond_06, char_cond_07, char_cond_08, char_cond_09, char_cond_10, char_cond_11, char_cond_12, psp_01, psp_02, psp_03, psp_04, priority , status_cd, start_dt, end_dt, created_by, created_at, updated_by, updated_at) VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20003' LIMIT 1),	'AIRE',	'RULE0002',	'VOLUME_BASED',	'=(RUB)',	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	'!=(JPMORGAN)',	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	2,	'DRAFT',	'01-01-2020',	'01-01-2099',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.aire_rule(aire_rule_id,party_id, rule_type_cd, rule_name, rr_method_cd,  currency_cd, amount, issuer_cntry_cd, merchant_cntry_cd, consumer_cntry_cd, card_brand, channel_cd, merchant_website, bin_card_type, bin_scheme_name, bin_cntry_cd, bin_issuer_name, three_ds_version, num_cond_01, num_cond_02, num_cond_03, num_cond_04, num_cond_05, char_cond_06, char_cond_07, char_cond_08, char_cond_09, char_cond_10, char_cond_11, char_cond_12, psp_01, psp_02, psp_03, psp_04, priority , status_cd, start_dt, end_dt, created_by, created_at, updated_by, updated_at) VALUES(	replace(uuid_generate_v4()::text,'-','A'),	(SELECT party_id FROM mdm.party WHERE party_name='APXO20004' LIMIT 1),	'DEFAULT',	'RULE0003',	null,	'=(GBP)',	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	null,	'APXO10007',	'APXO10014',	'APXO10013',	null,	1,	'DRAFT',	'01-01-2020',	'01-01-2099',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
commit;