DROP TABLE IF EXISTS  mdm.app_rule_type CASCADE ;

CREATE TABLE mdm.app_rule_type (
app_rule_type_id serial NOT NULL,
"name" varchar(100) NOT NULL,
active_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
desc_txt varchar(250) NULL,
created_by varchar(50) NOT NULL,
created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_by varchar(50) NOT NULL,
updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT app_rule_type_pkey PRIMARY KEY (app_rule_type_id)
);