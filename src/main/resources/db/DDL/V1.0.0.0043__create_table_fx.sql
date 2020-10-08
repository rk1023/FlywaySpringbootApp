DROP TABLE IF EXISTS  mdm.fx CASCADE ;

CREATE TABLE mdm.fx
(
fx_id varchar(50) PRIMARY KEY,
basr_curcy_cd char(3) NOT NULL,
target_curcy_cd char(3) NOT NULL,
fx_party_id varchar(50) REFERENCES mdm.party(party_id) NOT NULL,
source_cd varchar(50) NOT NULL,
fx_rate_date date NOT NULL,
buy_rate_div decimal ,
sell_rate_div decimal,
buy_rate_mul decimal,
sell_rate_mul decimal,
created_by varchar(50),
created_at TIMESTAMP(0) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP 
);