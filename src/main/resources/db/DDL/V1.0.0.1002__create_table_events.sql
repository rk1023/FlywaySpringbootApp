DROP TABLE IF EXISTS apx.events  CASCADE;

CREATE TABLE apx.events ( 
	event_id 			VARCHAR(50) NOT NULL,
	event_type 			VARCHAR(50) NOT NULL,
	status_cd 			VARCHAR(50) NOT NULL,
	psp_status_cd 		VARCHAR(50),
	processing_state 	VARCHAR(50), 
	sys_job_id 			INTEGER,
	recon_job_id 		INTEGER,
	scheduler_stg_id    INTEGER,
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    unique(event_id,event_type,created_at)	
)partition by list(event_type);