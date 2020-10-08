create table apx.events_evt_type_p5
partition of apx.events
for values in ('CREDIT_TXN')
partition by range(created_at) ;