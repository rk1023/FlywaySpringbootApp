DROP TABLE IF EXISTS apx.refund CASCADE;

CREATE TABLE apx.refund( 
	refund_id 			VARCHAR(50) NOT NULL,
	refund_txn_data 	JSONB NOT NULL,
	org_id 				VARCHAR(50) NOT NULL,
	account_id 			VARCHAR(100),
	party_rel_id 		VARCHAR(50) NOT NULL,
	routing_cd 			VARCHAR(50) NOT NULL,
	routing_type_cd 	VARCHAR(100) NOT NULL,
	psp_id 				VARCHAR(50) not null,
	curcy_cd 			CHAR(3) NOT NULL,
	amount 				DECIMAL,
	response_data       JSONB ,
	merchant_ref 		VARCHAR(255),
	psp_txn_ref 		VARCHAR(255),
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(refund_id,created_at)
)partition by range(created_at);