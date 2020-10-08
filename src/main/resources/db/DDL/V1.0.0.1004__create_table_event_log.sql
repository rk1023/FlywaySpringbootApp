DROP TABLE IF EXISTS apx.event_log CASCADE;

CREATE UNLOGGED TABLE apx.event_log (
	event_log_id 		VARCHAR(50) NOT null,
	event_id 			VARCHAR(50) NOT NULL,
	seq_num 			SMALLINT not null,
	event_state 		VARCHAR(50) not null,
	status_outcome 		VARCHAR(50) not null,
	status_cd 			VARCHAR(50),
	ext_status_cd	 	VARCHAR(50),
	start_dttm 			TIMESTAMP(6) with time zone,
	end_dttm 			TIMESTAMP(6) with time zone,
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(event_log_id,created_at)
)partition by range(created_at);