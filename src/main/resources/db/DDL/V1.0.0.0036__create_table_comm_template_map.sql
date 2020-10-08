DROP TABLE IF EXISTS  mdm.comm_template_map CASCADE;

CREATE TABLE mdm.comm_template_map (
	comm_template_map_id serial NOT NULL,
	comm_template_id int4 NOT NULL,
	field_name varchar(250) NOT NULL,
	field_source varchar(250) NOT NULL,
	field_type_cd varchar(50) NOT NULL,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comm_template_map_pkey PRIMARY KEY (comm_template_map_id),
	CONSTRAINT comm_template_map_comm_template_id_fkey FOREIGN KEY (comm_template_id) REFERENCES mdm.comm_template(comm_template_id)
);