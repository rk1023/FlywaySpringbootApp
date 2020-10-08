DROP TABLE IF EXISTS  mdm.lookup CASCADE ;

CREATE TABLE mdm.lookup (
	lookup_id serial NOT NULL,
	lookup varchar(50) NOT NULL,
	desc_txt varchar(250) NULL,
	active_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT lookup_lookup_key UNIQUE (lookup),
	CONSTRAINT lookup_pkey PRIMARY KEY (lookup_id)
);