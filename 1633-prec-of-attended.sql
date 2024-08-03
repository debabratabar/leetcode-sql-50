
/*
Question Link  : https://leetcode.com/problems/percentage-of-users-attended-a-contest/
Question Name :  1633. Percentage of Users Attended a Contest

*/

with temp1 as ( 
select 
    contest_id , 
    (  1.0* count(user_id) ) / ( select count(1) from users) as percentage 
from 
register 
group  by 1 
) 
select 
    contest_id , 
    round(percentage*100 , 2 ) as percentage
from temp1 
order by percentage desc  , contest_id ;