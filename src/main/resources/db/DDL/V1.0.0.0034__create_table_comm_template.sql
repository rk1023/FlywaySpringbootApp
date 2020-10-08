DROP TABLE IF EXISTS  mdm.comm_template CASCADE;

CREATE TABLE mdm.comm_template (
	comm_template_id serial NOT NULL,
	"name" varchar(100) NOT NULL,
	party_id varchar(50) NOT NULL,
	name_key varchar(200) NOT NULL, --name|party_name|channel_type_cd|language_cd|status_cd , 
	channel_type_cd varchar(50) NOT NULL,--
	email_subject varchar(250) NULL,
	message_body text NULL, -- it will be html file ? or just simple text , it should be simple text.
	language_cd bpchar(3) NOT NULL,
	locale varchar(10),
	status_cd varchar(50) NOT NULL,
	start_dt date NOT NULL,
	end_dt date NULL,
	created_by varchar(50) NOT NULL,
	created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(50) NOT NULL,
	updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comm_template_name_key_key UNIQUE (name_key),
	CONSTRAINT comm_template_pkey PRIMARY KEY (comm_template_id),
	CONSTRAINT comm_template_party_id_fkey FOREIGN KEY (party_id) REFERENCES mdm.party(party_id)
);