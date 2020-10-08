DROP TABLE IF EXISTS  mdm.comm_driver CASCADE ;

create TABLE mdm.comm_driver
(
comm_driver_id  serial NOT NULL ,
driver_name varchar(50),
default_sw char(1),
channel_type_cd varchar(50),
inbound_sw char(1),
outbound_sw char(1),
created_by varchar(50) NOT NULL,
created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_by varchar(50) NOT NULL,
updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT comm_driver_pkey PRIMARY KEY (comm_driver_id)
);