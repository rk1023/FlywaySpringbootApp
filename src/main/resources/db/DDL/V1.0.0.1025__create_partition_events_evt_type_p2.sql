create table apx.events_evt_type_p2
partition of apx.events
for values in ('CAPTURE')
partition by range(created_at) ;