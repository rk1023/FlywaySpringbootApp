DROP TABLE IF EXISTS apx.txn CASCADE;

CREATE TABLE apx.txn( 
	txn_id 				VARCHAR(50) NOT NULL,
	txn_type_cd 		VARCHAR(50) NOT NULL,
	three_ds_version 	NUMERIC,
	org_id 				VARCHAR(50) NOT NULL,
	account_id 			VARCHAR(100),
	party_rel_id 		VARCHAR(50) NOT NULL,
	psp_id 				VARCHAR(50) not null,
	routing_cd 			VARCHAR(50) NOT NULL,
	routing_type_cd 	VARCHAR(100) NOT NULL,
	curcy_cd 			CHAR(3) NOT NULL,
	amount 				DECIMAL,
	dynamic_descriptor 	VARCHAR(255),
	user_agent 			TEXT,
	merchant_ref 		VARCHAR(255),
	psp_txn_ref 		VARCHAR(255),
	txn_data 			JSONB not NULL,
	cancel_attempt_count SMALLINT DEFAULT 0,
	response_data 		JSONB,
	risk_system 		VARCHAR(50),
	risk_response_data 	JSONB,
	risk_score 			SMALLINT,
	risk_ref_num 		VARCHAR(100),
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(txn_id,created_at)
)partition by range(created_at);