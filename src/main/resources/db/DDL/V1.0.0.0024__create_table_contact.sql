DROP TABLE IF EXISTS  mdm.contact CASCADE;

CREATE TABLE mdm.contact (
	contact_id varchar(50) NOT NULL,
	title varchar(50) NULL,
	first_name varchar(100) NULL,
	last_name varchar(100) NULL,
	middle_name varchar(100) NULL,
	birth_dt date NULL,
	emp_flg bpchar(1) NOT NULL,
	type_cd varchar(50) NULL,
	party_name varchar(100) NOT NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT contact_pkey PRIMARY KEY (contact_id),
	CONSTRAINT contact_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES mdm.party(party_id)
);