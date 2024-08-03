/*
Question Link  : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
Question Name :  602. Friend Requests II: Who Has the Most Friends

*/

with temp1 as (
select 
    id, 
    sum(num) as num 
from 
(
select 
    accepter_id  as id, 
    count(requester_id) as num 
from RequestAccepted
group by 1 
union all 
select 
    requester_id as id, 
    count(accepter_id) as num 
from RequestAccepted
group by 1 
) a
group by a.id 
)
select 
    id, 
    num
from temp1
order by num desc 
limit 1 ;