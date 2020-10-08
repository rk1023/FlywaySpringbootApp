DROP TABLE IF EXISTS  mdm.org_currency CASCADE;

create TABLE mdm.org_currency
(
    org_curcy_id varchar(50),
    type_cd varchar(50) NOT NULL,
    org_id varchar(50) NOT NULL,
    curcy_cd char(3) NOT NULL,
	txn_curcy_flag  char(1) default 'N',
  	start_dt date NOT NULL,
	end_dt date ,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT org_currency_pkey PRIMARY KEY (org_curcy_id),
	CONSTRAINT org_currency_org_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id),
	CONSTRAINT org_currency_curcy_fkey FOREIGN KEY (curcy_cd) REFERENCES mdm.currency(alpha3_cd)
);