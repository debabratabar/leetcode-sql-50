/*
Question Link  : https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
Question Name :  181. Employees Earning More Than Their Managers

*/

select m.name as employee
from employee m left join employee e
on m.managerId = e.id
where m.salary > e.salary