DROP TABLE IF EXISTS  mdm.state CASCADE ;

CREATE TABLE mdm.state (
	state_id serial NOT NULL,
	state_model_id int4 NOT NULL,
	avail_state varchar(50) NOT NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT state_pkey PRIMARY KEY (state_id),
	CONSTRAINT state_state_model_id_fkey FOREIGN KEY (state_model_id) REFERENCES mdm.state_model(state_model_id)
);