/*
Question Link  : https://leetcode.com/problems/rising-temperature/
Question Name :  197. Rising Temperature
*/

with temp1 as (
select id ,  recorddate  , recorddate -1 as previous_day  , temperature 
--  temperature  ,  lag(temperature )  over( order by recorddate)  as pre_temperature 
from weather 
) 

select t1.id from temp1   t1 
left join weather   w1
on t1.previous_day = w1.recorddate
where t1.temperature >  w1.temperature