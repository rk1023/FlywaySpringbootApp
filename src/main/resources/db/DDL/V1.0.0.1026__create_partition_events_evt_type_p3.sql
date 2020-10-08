create table apx.events_evt_type_p3
partition of apx.events
for values in ('REFUND')
partition by range(created_at) ;