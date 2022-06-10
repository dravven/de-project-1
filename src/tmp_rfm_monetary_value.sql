insert into analysis.tmp_rfm_monetary_value
  select user_id, NTILE(5) 
OVER(order by sum(payment))  as ntile 
from (select * from analysis.users usr
full join analysis.orders ord on usr.id = ord.user_id and status = 4)t
 where user_id is not null
group by user_id