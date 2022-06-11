insert into analysis.tmp_rfm_recency
  select user_id, NTILE(5) 
OVER(order by max(case when status = 4 then date(order_ts) end)) as ntile 
from (select * from analysis.users usr
Left outer join analysis.orders ord on usr.id = ord.user_id)t
 where user_id is not null
group by user_id