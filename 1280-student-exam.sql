
/*
Question Link  : https://leetcode.com/problems/students-and-examinations/
Question Name :  1280. Students and Examinations
*/


with temp1 as (
select 
    s1.student_id, 
    s1.student_name,  
    s2.subject_name 
from students s1 cross join subjects s2 
order by s1.student_id
) 
, temp2 as (
select 
    t1.student_id , 
    t1.student_name ,  
    t1.subject_name , 
    case when e1.student_id is null and  e1.subject_name is null then 0 
    else 1 end as count_check     
from temp1 t1 left join examinations e1 
on t1.student_id = e1.student_id 
and t1.subject_name  = e1.subject_name 
)
select 
    student_id , 
    student_name ,  
    subject_name , 
    sum(count_check) as attended_exams
from temp2 
group by 1,2 ,3
order by 1, 3;
