DROP TABLE IF EXISTS  mdm.org_product CASCADE;

CREATE TABLE mdm.org_product (
	org_product_id varchar(50) NOT NULL,
	org_id varchar(50) NOT NULL,
	product_id int4 NOT NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT org_product_pkey PRIMARY KEY (org_product_id),
	CONSTRAINT org_product_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id),
	CONSTRAINT org_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES mdm.product(product_id)
);