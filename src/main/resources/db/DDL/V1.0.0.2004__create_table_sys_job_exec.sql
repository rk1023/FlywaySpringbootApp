DROP TABLE IF EXISTS scheduler.sys_job_exec CASCADE  ;

CREATE TABLE scheduler.sys_job_exec (
	job_exec_id bigserial NOT NULL,
	job_id BIGINT NOT NULL,
	par_job_id BIGINT NULL,
	work_unit varchar(200) NULL,
	sub_work_unit varchar(100) NULL,
	total_cnt int4 NULL,
	success_cnt int4 NULL,
	error_cnt int4 NULL,
	exec_dt timestamptz NULL,
	addtnl_info_01 varchar(500) NULL,
	addtnl_info_02 varchar(500) NULL,
	addtnl_info_03 varchar(500) NULL,
	addtnl_info_04 varchar(500) NULL,
	addtnl_info_05 varchar(500) NULL,
	start_dt timestamp NOT NULL,
	end_dt timestamp NULL,
	status_cd varchar(50) NOT NULL,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT sys_job_exec_pkey PRIMARY KEY (job_exec_id),
	CONSTRAINT sys_job_exec_job_id_fkey FOREIGN KEY (job_id) REFERENCES scheduler.sys_job(job_id),
	CONSTRAINT sys_job_exec_par_job_id_fkey FOREIGN KEY (par_job_id) REFERENCES scheduler.sys_job(job_id)
);