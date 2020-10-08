DROP TABLE IF EXISTS  mdm.lookup_val CASCADE ;

CREATE TABLE mdm.lookup_val (
	lookup_val_id serial NOT NULL,
	lookup varchar(50) NOT NULL,
	lookup_val varchar(50) NOT NULL,
	display_name varchar(50) NOT NULL,
	desc_txt varchar(250) NULL,
	active_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	seq_num int2 NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT lookup_val_lookup_lookup_val_key UNIQUE (lookup, lookup_val),
	CONSTRAINT lookup_val_pkey PRIMARY KEY (lookup_val_id),
	CONSTRAINT lookup_val_lookup_fkey FOREIGN KEY (lookup) REFERENCES mdm.lookup(lookup)
);