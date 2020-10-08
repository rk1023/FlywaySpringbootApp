DROP TABLE IF EXISTS  mdm.aire_rule CASCADE;

CREATE TABLE mdm.aire_rule (
	aire_rule_id varchar(50) NOT NULL,
	rule_type_cd varchar(50) NOT NULL,
	route_type_cd varchar(50)  NULL,
	rule_name varchar(100) NOT NULL,
	rr_method_cd varchar(100) NULL,
	party_id varchar(50) NOT NULL,
	currency_cd varchar(500) NULL,
	amount varchar(500) NULL,
	issuer_cntry_cd varchar(500) NULL,
	merchant_cntry_cd varchar(500) NULL,
	consumer_cntry_cd varchar(500) NULL,
	card_brand varchar(500) NULL,
	channel_cd varchar(500) NULL,
	merchant_website varchar(500) NULL,
	bin_card_type varchar(500) NULL,
	bin_scheme_name varchar(500) NULL,
	bin_cntry_cd varchar(500) NULL,
	bin_issuer_name varchar(500) NULL,
	three_ds_version varchar(500) NULL,
	num_cond_01 varchar(500) NULL,
	num_cond_02 varchar(500) NULL,
	num_cond_03 varchar(500) NULL,
	num_cond_04 varchar(500) NULL,
	num_cond_05 varchar(500) NULL,
	char_cond_06 varchar(500) NULL,
	char_cond_07 varchar(500) NULL,
	char_cond_08 varchar(500) NULL,
	char_cond_09 varchar(500) NULL,
	char_cond_10 varchar(500) NULL,
	char_cond_11 varchar(500) NULL,
	char_cond_12 varchar(500) NULL,
	status_cd varchar(50) NOT NULL,
	psp_01 varchar(100) ,
	psp_02 varchar(100) ,
	psp_03 varchar(100) ,
	psp_04 varchar(100) ,
	priority int4 NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT aire_rule_party_id_rule_type_cd_start_dt_priority_key UNIQUE (party_id, rule_type_cd, start_dt, priority),
	CONSTRAINT aire_rule_pkey PRIMARY KEY (aire_rule_id),
	CONSTRAINT aire_rule_rule_name_party_id_key UNIQUE (rule_name, party_id),
	CONSTRAINT aire_rule_party_id_fkey FOREIGN KEY (party_id) REFERENCES mdm.party(party_id)
);