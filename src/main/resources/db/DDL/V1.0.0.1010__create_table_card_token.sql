DROP TABLE IF EXISTS apx.card_token CASCADE;

create table apx.card_token (
	token_id 			VARCHAR(50) not null primary key,
	ulti_org_id 		VARCHAR(50) not null,
	merchant_ref 		VARCHAR (100),
	event_id 			VARCHAR(50),
	token 				VARCHAR (50), 
	logical_key 		TEXT, -- ult_org_id, card number, expiry month and year
	requested_org_id 	VARCHAR(50) not null, 
	token_encrypted_payload TEXT,
	token_encrypted_key TEXT,
	valid_token 		INTEGER not null default 1,
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	unique(token)
);