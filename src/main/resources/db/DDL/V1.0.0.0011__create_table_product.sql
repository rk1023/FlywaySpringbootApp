DROP TABLE IF EXISTS  mdm.product CASCADE ;

CREATE TABLE mdm.product (
	product_id serial NOT NULL,
	"name" varchar(100) NOT NULL,
	short_name varchar(50) NOT NULL,
	desc_text varchar(250) NULL,
	type_cd varchar(50) NOT NULL,
	status_cd varchar(50) NOT NULL,
	invoice_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	category_cd varchar(50) NOT NULL,
	sub_category_cd varchar(50) NULL,
	internal_prod_cd varchar(50) NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT product_internal_prod_cd_ukey UNIQUE (internal_prod_cd),
	CONSTRAINT product_pkey PRIMARY KEY (product_id),
	CONSTRAINT product_short_name_ukey UNIQUE (short_name)
);