DROP TABLE IF EXISTS apx.event_rel CASCADE;

CREATE TABLE apx.event_rel(
	event_rel_id 		VARCHAR(50) NOT NULL ,
	event_id 			VARCHAR(50) ,
	rel_event_id 		VARCHAR(50) ,
	rel_type_cd 		VARCHAR(50) NOT NULL,
	status_cd           VARCHAR(50) NOT NULL,
	root_event_id 		VARCHAR(50) ,
	rel_event_ceated_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
	root_event_ceated_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
	created_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	UNIQUE(event_rel_id,created_at)
)partition by range(created_at);