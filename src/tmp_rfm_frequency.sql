insert into analysis.tmp_rfm_frequency
  select user_id, NTILE(5) 
OVER(order by count(case when status = 4 then 1 else 0 end))  as ntile 
from (select * from analysis.users usr
Left outer join analysis.orders ord on usr.id = ord.user_id)t
 where user_id is not null
group by user_id