/*
Question Link  : https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
Question Name :  2356. Number of Unique Subjects Taught by Each Teacher

*/ 


select teacher_id , count(distinct subject_id) cnt from 
teacher 
group by 1 