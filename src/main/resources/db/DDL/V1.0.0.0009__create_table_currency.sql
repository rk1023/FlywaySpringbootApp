DROP TABLE IF EXISTS  mdm.currency CASCADE ;

CREATE TABLE mdm.currency (
	alpha3_cd bpchar(3) NOT NULL,
	alpha2_cd bpchar(2) NULL,
	curcy_numeric int4 NULL,
	multiplier int2 NULL,
	exponent int2 NULL,
	symbol varchar(20) NULL,
	html_cd varchar(50) NULL,
    currency_name varchar(100) not null,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT currency_pkey PRIMARY KEY (alpha3_cd)
);