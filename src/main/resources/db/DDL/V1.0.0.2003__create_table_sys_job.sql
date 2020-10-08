DROP TABLE IF EXISTS scheduler.sys_job CASCADE ;

CREATE TABLE scheduler.sys_job (
	job_id bigserial NOT NULL,
	job_exec_name varchar(100) NOT NULL,
	job_template_id int4 NOT NULL,
	job_run_dt timestamp NOT NULL,
	par_job_id BIGINT NULL,
	start_dt timestamp NOT NULL,
	end_dt timestamp NULL,
	status_cd varchar(50) NOT NULL,
	psp_id varchar(50) NULL,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT sys_job_job_exec_name_key UNIQUE (job_exec_name),
	CONSTRAINT sys_job_pkey PRIMARY KEY (job_id),
	CONSTRAINT sys_job_job_template_id_fkey FOREIGN KEY (job_template_id) REFERENCES scheduler.sys_job_template(job_template_id),
	CONSTRAINT sys_job_par_job_id_fkey FOREIGN KEY (par_job_id) REFERENCES scheduler.sys_job(job_id)
);