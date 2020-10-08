DROP TABLE IF EXISTS  mdm.country CASCADE ;

CREATE TABLE mdm.country (
	alpha3_cd bpchar(3) NOT NULL,
	"name" varchar(100) NOT NULL,
	alpha2_cd bpchar(2) NULL,
	cntry_numeric int4 NULL, -- string CHAR(3)
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT country_pkey PRIMARY KEY (alpha3_cd)
);