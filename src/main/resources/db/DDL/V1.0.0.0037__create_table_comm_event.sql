DROP TABLE IF EXISTS  mdm.comm_event CASCADE;

CREATE TABLE mdm.comm_event (
	comm_event_id bigserial NOT NULL,
	comm_template_id int4 NOT NULL,
	email_subject varchar(250) NULL,
	message text NULL,
	message_content_type varchar(250),
	to_list varchar(500) NOT NULL,
	cc_list varchar(500) NULL,
	bcc_list varchar(500) NULL,
	status_cd varchar(50) NOT NULL,
	source_name varchar(100) NULL,
	retries_num int2 NOT NULL DEFAULT 0,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comm_event_pkey PRIMARY KEY (comm_event_id)
);