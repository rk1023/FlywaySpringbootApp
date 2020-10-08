DROP TABLE IF exists apx.chargeback CASCADE;

create table apx.chargeback (
	chargeback_id 		VARCHAR(50) not null,
	txn_id 				VARCHAR(50) not null,
	merchant_ref 		VARCHAR(100),
	arn 				VARCHAR(100),
	orig_txn_dt 		TIMESTAMP(3) WITH TIME ZONE NOT NULL,
	terminal_id 		VARCHAR(100),
	case_id 			VARCHAR(100),
	reference_number 	VARCHAR(100),
	service_fee 		INTEGER,
	curcy_cd 			CHAR(3), -- updated from currency to curcy_cd
	net_amount 			INTEGER,
	gross_amount 		INTEGER,
	job_id 				INTEGER not null,
	created_dt 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	unique(chargeback_id,created_dt)
)partition by range(created_dt);