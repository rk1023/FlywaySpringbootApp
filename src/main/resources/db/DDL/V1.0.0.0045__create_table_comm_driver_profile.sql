DROP TABLE IF EXISTS  mdm.comm_driver_profile CASCADE;

create TABLE mdm.comm_driver_profile
(
comm_driver_profile_id  serial NOT NULL,
comm_driver_id int NOT NULL,
attribute varchar(50) NOT NULL,
attribute_val varchar(250) NOT NULL,
created_by varchar(50) NOT NULL,
created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_by varchar(50) NOT NULL,
updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT comm_driver_profile_fkey FOREIGN KEY (comm_driver_id) REFERENCES mdm.comm_driver(comm_driver_id)
);