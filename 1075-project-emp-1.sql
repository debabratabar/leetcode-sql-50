
/*
Question Link  : https://leetcode.com/problems/project-employees-i/
Question Name :  1075. Project Employees I

*/  





with temp1 as (
select 
    p.project_id, 
    avg( e.experience_years ) as average_years
from 
project p left join employee e
on p.employee_id = e.employee_id 
group by 1 
) 
select 
    project_id, 
    round( average_years , 2 ) as average_years 
from temp1  ;