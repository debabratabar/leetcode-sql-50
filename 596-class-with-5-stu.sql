

/*
Question Link  : https://leetcode.com/problems/classes-more-than-5-students/
Question Name :  596. Classes More Than 5 Students

*/ 


select 
    class 
from courses 
group by 1 
having count(distinct student) >= 5;