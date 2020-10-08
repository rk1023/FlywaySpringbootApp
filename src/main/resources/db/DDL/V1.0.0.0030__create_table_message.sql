DROP TABLE IF EXISTS  mdm.message CASCADE;

CREATE TABLE mdm.message (
	message_id serial NOT NULL,
	message_category_id int4 NOT NULL,
	message_code varchar(50) NOT NULL,
	cascade_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT message_pkey PRIMARY KEY (message_id),
	CONSTRAINT message_message_category_id_fkey FOREIGN KEY (message_category_id) REFERENCES mdm.message_category(message_category_id)
);