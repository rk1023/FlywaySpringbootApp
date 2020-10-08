DROP TYPE IF EXISTS apx.capture_info cascade;

CREATE TYPE apx.capture_info AS (
	event_id varchar(50), --capture_id
	txn_id varchar(50),  -- txn_id, from txn table ,
	event_type varchar(50), -- 
	status_cd varchar(50),
	txn_status_cd varchar(50),
	processing_state varchar(50),
	created_at timestamptz(3), -- capture_ created at 
	currency bpchar(3),    -- capture table 
	capture_amt numeric,
	txn_capture_amt numeric,
	txn_capture_count int2,
	org_id varchar(50),
	account_id varchar(100),
	psp_id varchar(100),
	routing_cd varchar(1000),
	routing_type_cd varchar(100),
	merchant_ref varchar(255),
	psp_ref varchar(255),
	txn_amt numeric, --  from txn table ,
	refund_cnt int2, -- refund 
	refund_amt numeric, -- refund amt against capure id
	cancel_amt numeric, --- capture cancel amount 
	refund_cancel_amt numeric, -- refund cancel 
	txn_created_at timestamptz(3), -- txn created at 
	txn_cancel_amt numeric  -- cancel against txn_id 
	);
