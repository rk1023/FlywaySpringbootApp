DROP TABLE IF EXISTS  mdm.country_currency CASCADE ;

CREATE TABLE mdm.country_currency (
	cntry_curcy_id serial NOT NULL,
	cntry_alpha3_cd bpchar(3) NOT NULL,
	curcy_alpha3_cd bpchar(3) NOT NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT country_currency_cntry_alpha3_cd_curcy_alpha3_cd_start_dt_key UNIQUE (cntry_alpha3_cd, curcy_alpha3_cd, start_dt),
	CONSTRAINT country_currency_pkey PRIMARY KEY (cntry_curcy_id),
	CONSTRAINT country_currency_cntry_alpha3_cd_fkey FOREIGN KEY (cntry_alpha3_cd) REFERENCES mdm.country(alpha3_cd),
	CONSTRAINT country_currency_curcy_alpha3_cd_fkey FOREIGN KEY (curcy_alpha3_cd) REFERENCES mdm.currency(alpha3_cd)
);