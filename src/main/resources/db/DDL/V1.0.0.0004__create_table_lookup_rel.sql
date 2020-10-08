DROP TABLE IF EXISTS  mdm.lookup_rel CASCADE ;

CREATE TABLE mdm.lookup_rel (
lookup_rel_id serial NOT NULL,
parent_lookup varchar(50) NOT NULL,
child_lookup varchar(50) NOT NULL,
parent_lookup_val varchar(50) NOT NULL,
child_lookup_val varchar(50) NOT NULL,
active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
created_by varchar(50) NULL,
created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_by varchar(50) NULL,
updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT lookup_rel_parent_lookup_child_lookup_parent_lookup_val_chi_key UNIQUE (parent_lookup, child_lookup, parent_lookup_val, child_lookup_val),
CONSTRAINT lookup_rel_pkey PRIMARY KEY (lookup_rel_id),
CONSTRAINT lookup_rel_child_lookup_fkey FOREIGN KEY (child_lookup) REFERENCES mdm.lookup(lookup),
CONSTRAINT lookup_rel_parent_lookup_fkey FOREIGN KEY (parent_lookup) REFERENCES mdm.lookup(lookup)
);