create table apx.webhook_status_p2
partition of apx.webhook
for values in ('SUCCESS')
partition by range(created_at) ;