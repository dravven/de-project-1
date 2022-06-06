create view analysis.order as
select orders.*, orderstatuslog.status_id
from production.orders
join orderstatuslog on orders.order_ts = orderstatuslog.dttm;