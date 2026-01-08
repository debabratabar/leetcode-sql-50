/*
Question Link  : https://leetcode.com/problems/department-highest-salary/
Question Name :  184. Department Highest Salary

*/


select d.name as department , a.name as employee , a.salary 
from 
(
select * , dense_rank() over(partition by departmentId order by salary desc  ) rnk
from employee 
) a 
 join department d 
on a.departmentId = d.id 
and a.rnk = 1