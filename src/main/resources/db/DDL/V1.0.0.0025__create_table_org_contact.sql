DROP TABLE IF EXISTS  mdm.org_contact CASCADE;

CREATE TABLE mdm.org_contact (
	org_contact_id varchar(50) NOT NULL,
	org_id varchar(50) NOT NULL,
	contact_id varchar(50) NOT NULL,
	type_cd varchar(50) NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT org_contact_pkey PRIMARY KEY (org_contact_id),
	CONSTRAINT org_contact_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES mdm.contact(contact_id),
	CONSTRAINT org_contact_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id)
);