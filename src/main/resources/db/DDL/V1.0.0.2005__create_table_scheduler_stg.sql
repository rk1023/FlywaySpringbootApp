DROP TABLE IF EXISTS scheduler.scheduler_stg CASCADE  ;

CREATE TABLE scheduler.scheduler_stg (
	scheduler_stg_id bigserial NOT NULL,
	job_exec_id BIGINT NOT NULL,
	rel_job_exec_id BIGINT NULL,
	party_id varchar(50) NULL,
	payment_reference varchar(100) NULL,
	processed_data jsonb NULL,
	cust_field_01 varchar(100) NULL,
	cust_field_02 varchar(100) NULL,
	cust_field_03 varchar(100) NULL,
	cust_field_04 varchar(100) NULL,
	cust_field_05 varchar(100) NULL,
	psp_txn_ref varchar(255) NULL,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	file_linenum BIGINT NULL,
	CONSTRAINT scheduler_stg_scheduler_stg_id_created_at_key UNIQUE (scheduler_stg_id, created_at)
)PARTITION BY RANGE (created_at);