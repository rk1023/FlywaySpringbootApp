create table apx.events_evt_type_p4
partition of apx.events
for values in ('CANCEL')
partition by range(created_at);