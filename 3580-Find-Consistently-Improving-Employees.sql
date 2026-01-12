

/*
Question Link  : https://leetcode.com/problems/find-consistently-improving-employees/
Question Name :  3580. Find Consistently Improving Employees

*/





with temp as (

select employee_id , (rating - prev_day_2 ) as improvement_score  from 
(
    select * 
    , lag(rating , 1) over(partition by employee_id order by review_date) as prev_day_1
    , lag(rating , 2) over(partition by employee_id order by review_date) as prev_day_2 
    ,rank() over(partition by employee_id order by review_date desc ) as latest_review
from performance_reviews 
) a 
where latest_review = 1 
and ( rating > prev_day_1  and prev_day_1 > prev_day_2 )
) 

select 
    t.employee_id 
    , e.name 
    , t.improvement_score
from temp t join employees e 
on t.employee_id = e.employee_id
order by t.improvement_score desc , e.name