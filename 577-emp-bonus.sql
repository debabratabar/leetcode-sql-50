

/*
Question Link  : https://leetcode.com/problems/employee-bonus/
Question Name :  577. Employee Bonus

*/



select 
    e1.name, 
    b1.bonus 
from employee e1 left join bonus b1 
on e1.empid = b1.empid 
where b1.bonus < 1000 
or  b1.bonus is null;
