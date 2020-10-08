DROP TABLE IF EXISTS  mdm.party_rel CASCADE ;

CREATE TABLE mdm.party_rel (
	party_rel_id varchar(50) NOT NULL,
	from_party_id varchar(50) NOT NULL,
	to_party_id varchar(50) NOT NULL,
	rel_type_cd varchar(50) NULL,
	merchant_code varchar(100) NULL,
	rel_name varchar(200) NULL,
	party_config jsonb NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT party_rel_pkey PRIMARY KEY (party_rel_id),
	CONSTRAINT party_rel_from_party_id_fkey FOREIGN KEY (from_party_id) REFERENCES mdm.party(party_id),
	CONSTRAINT party_rel_to_party_id_fkey FOREIGN KEY (to_party_id) REFERENCES mdm.party(party_id)
);