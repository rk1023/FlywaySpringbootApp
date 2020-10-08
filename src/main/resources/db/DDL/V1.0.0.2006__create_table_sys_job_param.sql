DROP TABLE IF EXISTS scheduler.sys_job_param CASCADE ;

CREATE TABLE scheduler.sys_job_param (
	sys_job_param_id serial NOT NULL,
	job_template_id int4 NOT NULL,
	job_id BIGINT NULL,
	param_type_cd varchar(50) NOT NULL,
	param_name varchar(100) NOT NULL,
	param_value varchar(500) NULL,
	optional_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	internal_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT sys_job_param_pkey PRIMARY KEY (sys_job_param_id),
	CONSTRAINT sys_job_param_job_id_fkey FOREIGN KEY (job_id) REFERENCES scheduler.sys_job(job_id),
	CONSTRAINT sys_job_param_job_template_id_fkey FOREIGN KEY (job_template_id) REFERENCES scheduler.sys_job_template(job_template_id)
);