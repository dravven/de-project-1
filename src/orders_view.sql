create view analysis.order as
select orders.*, t.status_id
from production.orders
join 
(Select *,
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY dttm DESC) AS rn
From analysis.orderstatuslog)t on orders.order_id = t.order_id