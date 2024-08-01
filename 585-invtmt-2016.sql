


/*
Question Link  : https://leetcode.com/problems/investments-in-2016/description
Question Name :  585. Investments in 2016
*/

with temp1 as (
select sum(a.tiv_2016)    as tiv_2016 
from  
(
select pid , tiv_2016 from insurance 
where  tiv_2015  in    ( select tiv_2015  from insurance 
group by 1 having count(1) >1 )
)  a join -- to get the data for 1st point 
(
select pid , tiv_2016 from insurance 
where ( lat, lon) in  
(
select lat , lon
from insurance  
group by 1,2  having count(1) = 1  )
) b on a.pid= b.pid -- to get the data for 2nd point 
-- group by 1 
) 
select   round ( cast ( tiv_2016 as numeric ) , 2 ) as    tiv_2016 
from temp1 