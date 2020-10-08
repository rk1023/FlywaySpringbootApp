DROP TABLE IF EXISTS scheduler.sys_job_template CASCADE ;

CREATE TABLE scheduler.sys_job_template (
	job_template_id serial NOT NULL,
	job_name varchar(100) NOT NULL,
	job_group_cd varchar(50) NULL,
	party_id varchar(50) NULL,
	cron_expression varchar(500) NULL,
	desc_text varchar(250) NULL,
	status_cd varchar(50) NOT NULL,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT sys_job_template_job_name_key UNIQUE (job_name),
	CONSTRAINT sys_job_template_pkey PRIMARY KEY (job_template_id)
);