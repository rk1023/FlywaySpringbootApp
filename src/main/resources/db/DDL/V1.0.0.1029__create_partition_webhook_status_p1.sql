create table apx.webhook_status_p1
partition of apx.webhook
for values in ('IN_PROGRESS')
partition by range(created_at) ;