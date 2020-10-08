DROP TABLE IF EXISTS  mdm.language CASCADE ;

CREATE TABLE mdm."language" (
	alpha3_cd bpchar(3) NOT NULL,
	alpha2_cd bpchar(2) NULL,
	name varchar(100) NOT NULL,
	base_locale varchar(10) NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT language_pkey PRIMARY KEY (alpha3_cd)
);