DROP TABLE IF EXISTS  mdm.message_translation CASCADE;

CREATE TABLE mdm.message_translation (
	message_transl_id serial NOT NULL,
	message_id int4 NOT NULL,
	desc_txt varchar(500) NOT NULL,
	lang_cd bpchar(3) NOT NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT message_translation_pkey PRIMARY KEY (message_transl_id),
	CONSTRAINT message_translation_lang_cd_fkey FOREIGN KEY (lang_cd) REFERENCES mdm.language(alpha3_cd),
	CONSTRAINT message_translation_message_id_fkey FOREIGN KEY (message_id) REFERENCES mdm.message(message_id)
);