DROP TABLE IF EXISTS  mdm.message_rel CASCADE;

CREATE TABLE mdm.message_rel (
	message_rel_id serial NOT NULL,
	message_id int4 NOT NULL,
	rel_type_cd varchar(50) NULL,
	rel_message_id int4 NOT NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT message_rel_message_id_rel_type_cd_ukey UNIQUE (message_id, rel_type_cd,active_flg),
	CONSTRAINT message_rel_pkey PRIMARY KEY (message_rel_id),
	CONSTRAINT message_rel_message_id_fkey FOREIGN KEY (message_id) REFERENCES mdm.message(message_id),
	CONSTRAINT message_rel_rel_message_id_fkey FOREIGN KEY (rel_message_id) REFERENCES mdm.message(message_id)
);