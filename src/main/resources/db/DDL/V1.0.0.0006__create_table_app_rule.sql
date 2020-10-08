DROP TABLE IF EXISTS  mdm.app_rule CASCADE ;

CREATE TABLE mdm.app_rule (
	app_rule_id serial NOT NULL,
	app_rule_type_id int4 NOT NULL,
	rule_name varchar(100) NOT NULL,
	active_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	rule_type varchar(50) NOT NULL,
	party_id varchar(50) NULL,
	desc_txt varchar(250) NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT app_rule_pkey PRIMARY KEY (app_rule_id),
	CONSTRAINT app_rule_app_rule_type_id_fkey FOREIGN KEY (app_rule_type_id) REFERENCES mdm.app_rule_type(app_rule_type_id)
);