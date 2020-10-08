DROP TABLE IF EXISTS  mdm.party_extrnl_ref CASCADE ;

CREATE TABLE mdm.party_extrnl_ref (
	extrnl_ref_id varchar(50) NOT NULL,
	party_id varchar(50) NOT NULL,
	extrnl_type_cd varchar(50) NOT NULL,
	extrnl_id varchar(100) NOT NULL,
	extrnl_name varchar(500) NULL,
	udf_value01	varchar(100),	
    udf_value02 varchar(100),
    udf_value03 varchar(100),
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT party_extrnl_ref_extrnl_type_cd_extrnl_id_key UNIQUE (extrnl_type_cd, extrnl_id),
	CONSTRAINT party_extrnl_ref_pkey PRIMARY KEY (extrnl_ref_id),
	CONSTRAINT party_extrnl_ref_party_id_fkey FOREIGN KEY (party_id) REFERENCES mdm.party(party_id)
);