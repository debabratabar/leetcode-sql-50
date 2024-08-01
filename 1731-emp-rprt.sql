
/*
Question Link  : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
Question Name :  1731. The Number of Employees Which Report to Each Employee
*/




with temp1 as (
select 
e1.employee_id  , e1.name , count(e2.reports_to ) reports_count  ,round( avg(e2.age) , 1) 
as  average_age  from 
Employees  e1 join Employees  e2 
on e1.employee_id = e2.reports_to
group by 1,2
order by 1 )

select employee_id , name , reports_count , 
case when average_age >  ( cast( average_age as int)+0.5 ) then cast(average_age as int ) +1
else cast(average_age as int ) end as average_age
from temp1 