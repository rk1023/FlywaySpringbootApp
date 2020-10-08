DROP TABLE IF EXISTS apx.txn_dtl CASCADE;

CREATE TABLE apx.txn_dtl( 
	txn_dtl_id 			VARCHAR(50) NOT NULL  ,
	txn_id 				VARCHAR(50) NOT NULL,
	txn_fee 			DECIMAL,
	created_by 			VARCHAR(50) NOT NULL,
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by 			VARCHAR(50) NOT NULL,
	updated_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	unique(txn_dtl_id,created_at)
)partition by range(created_at);