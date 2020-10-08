DROP TABLE IF EXISTS  mdm.state_transition CASCADE ;

CREATE TABLE mdm.state_transition (
	state_transition_id serial NOT NULL,
	state_model_id int4 NOT NULL,
	from_state varchar(50) NOT NULL,
	to_state varchar(50) NOT NULL,
	"condition" text NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT state_transition_pkey PRIMARY KEY (state_transition_id),
	CONSTRAINT state_transition_state_model_id_fkey FOREIGN KEY (state_model_id) REFERENCES mdm.state_model(state_model_id)
);