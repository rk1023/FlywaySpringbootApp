DROP TABLE IF EXISTS  mdm.organisation CASCADE;

CREATE TABLE mdm.organisation (
	org_id varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	short_name varchar(50) NULL,
	party_name varchar(100) NOT NULL,
	status_cd varchar(50) NOT NULL,
	type_cd varchar(50) NOT NULL,
	bu_id varchar(50) NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	cntry_cd bpchar(3) NULL,
	template_dtl text NULL,
	hosted_page_tc_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT organisation_party_name_ukey UNIQUE (party_name),
	CONSTRAINT organisation_pkey PRIMARY KEY (org_id),
	CONSTRAINT organisation_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.party(party_id)
);