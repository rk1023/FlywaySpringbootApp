DROP TABLE IF EXISTS  mdm.app_rule_attrib CASCADE ;

CREATE TABLE mdm.app_rule_attrib (
	app_rule_attrb_id serial NOT NULL,
	app_rule_id int4 NOT NULL,
	"sequence" int2 NULL,
	attrib varchar(100) NOT NULL,
	type_cd varchar(50) NULL,
	attrib_val varchar(1500) NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	desc_txt varchar(250) NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT app_rule_attrib_pkey PRIMARY KEY (app_rule_attrb_id),
	CONSTRAINT app_rule_attrib_app_rule_id_fkey FOREIGN KEY (app_rule_id) REFERENCES mdm.app_rule(app_rule_id)
);