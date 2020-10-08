DROP TABLE IF EXISTS scheduler.error_dtl CASCADE ;

CREATE TABLE scheduler.error_dtl (
	error_dtl_id bigserial NOT NULL,
	parent_id BIGINT NOT NULL,
	parent_type varchar(50) NOT NULL,
	error_code varchar(50) NULL,
	error_message text NULL,
	type_cd varchar(50) NULL,
	severity int2 NOT NULL,
	param_01 varchar(100) NULL,
	param_02 varchar(100) NULL,
	param_03 varchar(100) NULL,
	param_04 varchar(100) NULL,
	param_05 varchar(100) NULL,
	error_data jsonb NULL,
	created_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	updated_by varchar(50) NOT NULL DEFAULT 'SYSTEM'::character varying,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT error_dtl_pkey PRIMARY KEY (error_dtl_id)
);