insert into analysis.dm_rfm_segments
with tmp as(
select * from analysis.tmp_rfm_frequency),
tmp1 as(select * from analysis.tmp_rfm_monetary_value),
tmp2 as(select * from analysis.tmp_rfm_recency trr)
 select tmp.user_id, frequency, monetary_value, recency from tmp
 join tmp1 on tmp.user_id = tmp1.user_id
 join tmp2 on tmp2.user_id = tmp.user_id


0	5	5	2
1	4	4	4
2	3	3	2
3	3	2	3
4	4	2	3
5	5	5	3
6	2	2	1
7	1	2	5
8	1	2	3
9	3	2	4