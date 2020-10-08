DROP TABLE IF EXISTS  mdm.address CASCADE ;

CREATE TABLE mdm.address (
	address_id varchar(50) NOT NULL,
	addr_line1 varchar(100) NOT NULL,
	addr_line2 varchar(100) NULL,
	addr_line3 varchar(100) NULL,
	city varchar(100)  NULL,
	county varchar(100) NULL,
	postcode varchar(20) NULL,
	cntry_cd bpchar(3)  NULL,
	type_cd varchar(50) NOT NULL,
	addr_key varchar(500) NOT NULL,
	latitude numeric NULL,
	longitude numeric NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	state varchar(50) NULL,
	CONSTRAINT address_addr_key_ukey UNIQUE (addr_key),
	CONSTRAINT address_pkey PRIMARY KEY (address_id)
);