DROP TABLE IF EXISTS  mdm.aire_round_robin;

CREATE TABLE mdm.aire_round_robin (
	rrbn_id varchar(50) NOT NULL,
	party_id varchar(50) NOT NULL,
	method_cd varchar(50) NOT NULL,
	counter_type_cd varchar(50) NOT NULL,
	counter_val int4 NOT NULL,
	psp varchar(100) NOT NULL,
	rrbn_val varchar(100) NULL,
	cascade_psp_01 varchar(100) NULL,
	cascade_psp_02 varchar(100) NULL,
	cascade_psp_03 varchar(100) NULL,
	cascade_psp_04 varchar(100) NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT aire_round_robin_pkey PRIMARY KEY (rrbn_id),
	CONSTRAINT aire_round_robin_party_id_fkey FOREIGN KEY (party_id) REFERENCES mdm.party(party_id)
);