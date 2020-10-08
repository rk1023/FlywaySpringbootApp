DROP TABLE IF EXISTS  mdm.comm_template_loc CASCADE;

CREATE TABLE mdm.comm_template_loc (
	comm_temp_loc_id serial NOT NULL,
	comm_template_id int4 NOT NULL,
	seq_num int2 NOT NULL,
	file_type_cd varchar(50) NOT NULL,
	status_cd varchar(50) NOT NULL,
	template_location varchar(500) NOT NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comm_template_loc_pkey PRIMARY KEY (comm_temp_loc_id),
	CONSTRAINT comm_template_loc_comm_template_id_fkey FOREIGN KEY (comm_template_id) REFERENCES mdm.comm_template(comm_template_id)
);