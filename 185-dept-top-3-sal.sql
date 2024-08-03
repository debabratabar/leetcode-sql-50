


/*
Question Link  : https://leetcode.com/problems/department-top-three-salaries/
Question Name :  185. Department Top Three Salaries

*/

with temp1 as (
select 
    d.name as department, 
    e.name employee, 
    salary, 
    dense_rank() over ( partition by d.id order by salary desc ) as ranks 
from 
employee e  join department d
on e.departmentid = d.id
)
select 
    department,  
    employee, 
    salary  
from temp1 
where ranks  <=3 ;