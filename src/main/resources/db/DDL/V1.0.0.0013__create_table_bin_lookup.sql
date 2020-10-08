DROP TABLE IF EXISTS  mdm.bin_lookup CASCADE ;

CREATE TABLE mdm.bin_lookup (
	bin_lookup_id serial NOT NULL,
	brand_name varchar(100) NULL,
	bin_number int4 NOT NULL,
	scheme_name varchar(100) NULL,
	bin_type varchar(50) NULL,
	issuer_name varchar(100) NULL,
	issuer_country varchar(100) NULL,
	issuer_cntry_2 bpchar(2) NULL,
	issuer_cntry_3 bpchar(3) NULL,
	issuer_cntry_num int4 NULL,
	issuer_name_cle varchar(100) NULL,
	CONSTRAINT bin_lookup_pkey PRIMARY KEY (bin_lookup_id)
);