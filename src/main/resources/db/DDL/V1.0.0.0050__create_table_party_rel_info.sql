DROP TABLE IF EXISTS  mdm.party_rel_info CASCADE ;

CREATE TABLE mdm.party_rel_info (
	party_rel_info_id varchar(50) NOT NULL,
	party_rel_id varchar(50) NOT NULL,
	type_cd varchar(50) NOT NULL,
	info_val jsonb NULL,
	merchant_code varchar(100),
	priority int ,
    start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT party_rel_info_pkey PRIMARY KEY (party_rel_info_id),
	CONSTRAINT party_rel_info_fkey FOREIGN KEY (party_rel_id) REFERENCES mdm.party_rel(party_rel_id)
);