DROP TABLE IF EXISTS  mdm.party CASCADE ;

CREATE TABLE mdm.party (
	party_id varchar(50) NOT NULL,
	type_cd varchar(50) NOT NULL,
	party_name varchar(100) NOT NULL,
	ultimate_party_id varchar(50) NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT party_party_name_key UNIQUE (party_name),
	CONSTRAINT party_pkey PRIMARY KEY (party_id)
);