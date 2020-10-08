DROP TABLE IF EXISTS apx.webhook CASCADE;

CREATE TABLE apx.webhook( 
	webhook_id 			VARCHAR(50) NOT NULL,
	event_id			VARCHAR(50) NOT NULL,
	event_type_cd       VARCHAR(50) NOT NULL,
    txn_id              VARCHAR(50),
	org_id 				VARCHAR(50) NOT NULL,
	extrnl_id 			VARCHAR(100),  
	webhook_url  		VARCHAR(255) NOT NULL, --
	url_method 			VARCHAR(50) , 
	webhook_data 		JSONB, 
	response_data 		JSONB, 
	status_cd 			VARCHAR(50) NOT NULL, 
	retry_count 		INTEGER,
	max_retry_count 	INTEGER,-- 
	merchant_ref 		VARCHAR(255), 
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	next_time 			TIMESTAMP(3),
	unique(webhook_id,status_cd,created_at)
)partition by list(status_cd);