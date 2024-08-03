
/*
Question Link  : https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
Question Name :  1378. Replace Employee ID With The Unique Identifier

*/



select 
    e2.unique_id , 
    e1.name 
from employees e1 left join employeeuni e2 
on e1.id = e2.id;