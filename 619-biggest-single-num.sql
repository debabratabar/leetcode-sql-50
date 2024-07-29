


/*
Question Link  : https://leetcode.com/problems/biggest-single-number/
Question Name :  619. Biggest Single Number
*/


with temp1 as ( 
select num , count(num) as cnt from mynumbers
group by 1 ) 
select case when cnt  = 1 then num else null end as num  from temp1
order by cnt  ,  num  desc  limit 1 ; 