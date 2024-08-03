

/*
Question Link  : https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
Question Name :  1141. User Activity for the Past 30 Days I

*/ 


select  
    activity_date as day, 
    count(distinct user_id ) as active_users  
from activity 
where  activity_date > '2019-06-27' 
and activity_date <='2019-07-27'
group by 1;