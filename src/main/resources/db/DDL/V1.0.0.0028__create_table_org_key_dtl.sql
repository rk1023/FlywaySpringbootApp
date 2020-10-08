DROP TABLE IF EXISTS  mdm.org_key_dtl CASCADE;

CREATE TABLE mdm.org_key_dtl (
	org_key_id varchar(50) NOT NULL,
	org_id varchar(50) NULL,
	key_type_cd varchar(50) NOT NULL,
	"key" varchar(1000) NOT NULL,
	private_key_handle varchar(100) NOT NULL,
	start_dttm timestamp NOT NULL,
	end_dttm timestamp NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT org_key_dtl_pkey PRIMARY KEY (org_key_id),
	CONSTRAINT org_key_dtl_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id)
);