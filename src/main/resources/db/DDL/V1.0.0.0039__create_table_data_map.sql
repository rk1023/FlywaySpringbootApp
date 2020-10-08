DROP TABLE IF EXISTS  mdm.data_map;

CREATE TABLE mdm.data_map (
	map_id serial NOT NULL,
	org_id varchar(50) NOT NULL DEFAULT '0'::character varying,
	type_cd varchar(50) NOT NULL,
	input_val_01 varchar(100) NOT NULL,
	input_val_02 varchar(100) NULL,
	input_val_03 varchar(100) NULL,
	input_val_04 varchar(100) NULL,
	input_val_05 varchar(100) NULL,
	target_val_01 varchar(100) NOT NULL,
	target_val_02 varchar(100) NULL,
	target_val_03 varchar(100) NULL,
	status_cd varchar(50) NOT NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT data_map_pkey PRIMARY KEY (map_id)
);