

/*
Question Link  : https://leetcode.com/problems/restaurant-growth/
Question Name :  1321. Restaurant Growth

*/


with temp1 as ( --getting every day total amount 
select visited_on , sum(amount ) as amount , rank() over( order by visited_on) as rn 
from customer 
group by 1 
order by 1 
), temp2 as ( --getting every day moving sum
select visited_on ,rn 
, case when rn <= 7 then 0  else rn-7 end as minus
,  sum(amount) over ( order by visited_on) as mov_avg
from temp1) 
, temp3 as (  --getting every 7 day total sum
-- select * from temp2 
select a.visited_on , ( a.mov_avg - case when  b.mov_avg is null then 0 else  b.mov_avg end)  as amount
from temp2 a left  join temp2 b 
on a.minus = b.rn
where a.rn >=7
order by a.visited_on
)
select * , round( amount / 7 , 2 ) as average_amount 
from temp3