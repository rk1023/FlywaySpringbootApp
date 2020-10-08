DROP TABLE IF EXISTS  mdm.comm_event_data CASCADE;

CREATE TABLE mdm.comm_event_data (
	comm_event_data_id bigserial NOT NULL,
	comm_event_id bigserial NOT NULL,
	attribute_name varchar(50) NULL,
	attribute_val varchar(500) NULL,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comm_event_data_comm_event_id_attribute_name_key UNIQUE (comm_event_id, attribute_name),
	CONSTRAINT comm_event_data_pkey PRIMARY KEY (comm_event_data_id),
	CONSTRAINT comm_event_data_comm_event_id_fkey FOREIGN KEY (comm_event_id) REFERENCES mdm.comm_event(comm_event_id)
);