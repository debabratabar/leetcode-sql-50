

/*
Question Link  : https://leetcode.com/problems/analyze-subscription-conversion/
Question Name :  3497. Analyze Subscription Conversion 
*/





with userlist as(
select  user_id 
,sum(case when activity_type='free_trial' then activity_duration  else 0 end )/sum(case when activity_type='free_trial' then 1 else 0 end) as free_trial_count
,sum(case when activity_type='paid' then activity_duration  else 0 end )/sum(case when activity_type='paid' then 1 else 0 end) as paid_count
 from userActivity 
where activity_type='free_trial' or activity_type='paid'
group by 1 
)

select user_id , round(free_trial_count , 2) as trial_avg_duration , round(paid_count , 2) as paid_avg_duration from userList
where free_trial_count is not null 
and paid_count is not null 
