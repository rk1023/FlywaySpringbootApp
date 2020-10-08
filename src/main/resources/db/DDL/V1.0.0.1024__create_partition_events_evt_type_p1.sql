create table apx.events_evt_type_p1
partition of apx.events
for values in ('ORIG_TXN')
partition by range(created_at);