INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'DECLINED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS REQUIRED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS VERIFIED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS AUTHENTICATION PENDING',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS AUTHENTICATED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AUTHORISED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'CAPTURED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'SETTLED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'REFUNDED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'FAILED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'CAPTURED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'FAILED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'AWAITING RESPONSE',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'CANCELLED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'FAILED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'REFUNDED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'FAILED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'FAILED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION REQUIRED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION RECEIVED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION SENT',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHORISED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'SETTLED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'REFUNDED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state(state_model_id, avail_state, active_flg, created_by, created_at, updated_by, updated_at) VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'CANCELLED',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
commit;