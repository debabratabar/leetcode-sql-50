/*
Question Link  : https://leetcode.com/problems/find-students-who-improved/description/
Question Name :  3421. Find Students Who Improved
*/


select distinct student_id , subject  , first_score , latest_score
from
(
select * 
,first_value(score) over( partition by student_id , subject order by  exam_date  ) as first_score
,last_value(score) over( partition by student_id , subject order by  exam_date rows between  unbounded preceding  and unbounded following ) as latest_score
, count(exam_date) over( partition by student_id ,subject) as cnt
from scores  
) tmp 
where latest_score> first_score and cnt >1
order by student_id , subject 