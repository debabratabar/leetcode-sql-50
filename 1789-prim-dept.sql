
/*
Question Link  : https://leetcode.com/problems/primary-department-for-each-employee/
Question Name :  1789. Primary Department for Each Employee

*/



select 
    employee_id  , 
    department_id 
from employee 
where primary_flag='Y'
union 
select 
    employee_id  , 
    department_id  
from 
( 
    select  
        employee_id  , 
        department_id  , 
        count(1) over( partition by employee_id ) counts 
    from employee 
    where primary_flag='N'
    and employee_id not in (select employee_id  
                            from employee 
                            where primary_flag='Y'  ) -- to remove Y primary_flags 
    -- group by 1 , 2 
)temp1 
where counts =1 ; -- to remove only N primary flags for a emp_id 