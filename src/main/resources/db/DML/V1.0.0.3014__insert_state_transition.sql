INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'RECEIVED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'DECLINED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'3DS REQUIRED',	'IF three_ds.three_ds_required == "Y"',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'AUTHORISED',	'IF three_ds.three_ds_required == "N"',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS REQUIRED',	'3DS VERIFIED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS VERIFIED',	'3DS AUTHENTICATION PENDING',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS AUTHENTICATION PENDING',	'3DS AUTHENTICATED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS AUTHENTICATION PENDING',	'AUTHORISED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'3DS AUTHENTICATED',	'AUTHORISED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'AUTHORISED',	'CAPTURED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'CAPTURED',	'SETTLED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'SETTLED',	'REFUNDED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'FAILED',	'AUTHORISED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Original Transaction Status' LIMIT 1),	'FAILED',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'RECEIVED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'CAPTURED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Capture Transaction Status' LIMIT 1),	'FAILED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'RECEIVED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'AWAITING RESPONSE',	'CANCELLED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'AWAITING RESPONSE',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Cancel Transactin Status' LIMIT 1),	'FAILED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'RECEIVED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'REFUNDED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='Refund Transaction Status' LIMIT 1),	'FAILED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'RECEIVED',	'AWAITING RESPONSE',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'FAILED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'AUTHENTICATION REQUIRED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION REQUIRED',	'AUTHENTICATION RECEIVED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION RECEIVED',	'AUTHENTICATION SENT',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHENTICATION SENT',	'AUTHORISED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AWAITING RESPONSE',	'AUTHORISED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHORISED',	'SETTLED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'SETTLED',	'REFUNDED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
INSERT INTO mdm.state_transition(state_model_id, from_state, to_state, condition, active_flg, created_by, created_at, updated_by, updated_at)VALUES(	(SELECT state_model_id FROM mdm.state_model WHERE name='CUP Original Transaction Status' LIMIT 1),	'AUTHORISED',	'CANCELLED',	'  ',	'Y',	'APEXX',CURRENT_DATE,'APEXX',CURRENT_DATE);
commit;