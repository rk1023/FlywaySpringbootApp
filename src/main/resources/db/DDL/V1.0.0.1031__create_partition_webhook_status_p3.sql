create table apx.webhook_status_p3
partition of apx.webhook
for values in ('FAILED')
partition by range(created_at) ;