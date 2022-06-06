insert into analysis.tmp_rfm_recency
  select user_id, NTILE(5) 
OVER(order by max(date(order_ts))) as ntile 
from (select * from users
full join orders on  users.id = orders.user_id and status = 4)t
 where user_id is not null
group by user_id