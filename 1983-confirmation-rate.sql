/*
Question Link  : https://leetcode.com/problems/confirmation-rate/
Question Name :  1934. Confirmation Rate

*/

with  total_counts as  (
select 
    user_id ,
    count(user_id) total_action_per_user 
from Confirmations 
group by user_id 
) , 
total_confirmed_count as (
select 
    user_id ,
    count(user_id)  as  total_confirmed_action_per_user
from Confirmations 
where action= 'confirmed'
group by user_id 
) , 
temp_rate as (
    select 
        tc.user_id ,  
        ( case when total_confirmed_action_per_user is null then 0.0 else total_confirmed_action_per_user * 1.0  end ) /total_action_per_user as confirmation_rate
    from total_counts tc left join total_confirmed_count tcc 
    on tc.user_id = tcc.user_id 
)

select 
    sn.user_id , 
    round(case when tr.user_id is null then 0 else confirmation_rate end , 2 ) as confirmation_rate 
from signups sn left join  temp_rate tr 
on sn.user_id = tr.user_id   ; 