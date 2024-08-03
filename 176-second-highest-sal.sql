/*
Question Link  : https://leetcode.com/problems/second-highest-salary
Question Name :  176. Second Highest Salary

*/

select coalesce( (
select 
    salary 
from (
select 
    salary, 
    dense_rank() over(order by salary desc) as ranks
from employee 
) 
where ranks =2  limit 1 ), null ) as SecondHighestSalary;