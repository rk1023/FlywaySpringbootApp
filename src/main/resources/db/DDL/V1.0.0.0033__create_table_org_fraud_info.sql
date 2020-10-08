DROP TABLE IF EXISTS  mdm.org_fraud_info CASCADE;

CREATE TABLE mdm.org_fraud_info (
	fraud_info_id varchar(50) NOT NULL,
	org_id varchar(50) NOT NULL,
	category_cd varchar(50) NOT NULL,   
	type_cd varchar(50) NOT NULL,   
	value_type_cd varchar(50) NOT NULL, 
	start_value varchar(250) NOT NULL,
	end_value varchar(250) NULL,
	curcy_cd bpchar(3) NULL,
	start_dttm timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	end_dttm timestamp NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT org_fraud_info_pkey PRIMARY KEY (fraud_info_id),
	CONSTRAINT org_fraud_info_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id)
);