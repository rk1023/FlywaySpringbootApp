DROP TABLE IF EXISTS  mdm.state_model CASCADE ;

CREATE TABLE mdm.state_model (
	state_model_id serial NOT NULL,
	"name" varchar(100) NOT NULL,
	status_cd varchar(50) NOT NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT state_model_pkey PRIMARY KEY (state_model_id)
);