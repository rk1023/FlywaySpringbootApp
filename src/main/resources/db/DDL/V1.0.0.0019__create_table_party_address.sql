DROP TABLE IF EXISTS  mdm.party_address CASCADE ;

CREATE TABLE mdm.party_address (
	party_address_id varchar(50) NOT NULL,
	rel_type_cd varchar(50) NULL,
	party_id varchar(50) NOT NULL,
	org_id varchar(50) NULL,
	contact_id varchar(50) NULL,
	address_id varchar(50) NOT NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT party_address_pkey PRIMARY KEY (party_address_id),
	CONSTRAINT party_address_address_id_fkey FOREIGN KEY (address_id) REFERENCES mdm.address(address_id),
	CONSTRAINT party_address_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES mdm.contact(contact_id),
	CONSTRAINT party_address_org_id_fkey FOREIGN KEY (org_id) REFERENCES mdm.organisation(org_id),
	CONSTRAINT party_address_party_id_fkey FOREIGN KEY (party_id) REFERENCES mdm.party(party_id)
);