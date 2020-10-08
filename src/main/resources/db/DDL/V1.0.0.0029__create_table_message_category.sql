DROP TABLE IF EXISTS  mdm.message_category CASCADE;

CREATE TABLE mdm.message_category (
	message_category_id serial NOT NULL,
	"name" varchar(100) NOT NULL,
	message_cat_code varchar(50) NOT NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	org_id varchar(50) NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT message_category_name_ukey UNIQUE (name),
	CONSTRAINT message_category_pkey PRIMARY KEY (message_category_id),
	CONSTRAINT message_category_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id)
);