
/*
Question Link  : https://leetcode.com/problems/employees-whose-manager-left-the-company/
Question Name :  1978. Employees Whose Manager Left the Company

*/




select employee_id 
from employees 
where salary < 30000 
and manager_id not in ( select  employee_id from employees )
and manager_id is not null 
order by 1 