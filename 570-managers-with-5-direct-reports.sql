/*
Question Link  : https://leetcode.com/problems/managers-with-at-least-5-direct-reports
Question Name :  570. Managers with at Least 5 Direct Reports

*/

with temp1 as (
select e1.id , count(1)  from
employee e1 inner join employee e2 
on e1.id = e2.managerId
group by e1.id having count(1) >= 5 
)
select  e2.name from 
temp1 t1 join employee e2 
on t1.id = e2.id ; 