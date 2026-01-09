/*
Question Link  : https://leetcode.com/problems/trips-and-users/
Question Name :  262. Trips and Users

*/


select request_at "Day" , round( sum(case when status like 'cancelled%' then 1 else 0 end ) /count(1)::Numeric , 2 )  as "Cancellation Rate"
from 
( select a.request_at , a.status
from  
trips a left join users b on a.client_id = b.users_id 
left join users c on a.driver_id = c.users_id 
where b.banned = 'No' and c.banned = 'No'
and ( a.request_at >= '2013-10-01' and a.request_at <= '2013-10-03')
) tmp 
group by 1 ;