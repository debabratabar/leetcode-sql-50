/*
Question Link  : https://leetcode.com/problems/last-person-to-fit-in-the-bus
Question Name :  1204. Last Person to Fit in the Bus

*/

with temp1 as (
select person_name , sum(weight) over(order by turn) as moving_weight  
from queue 
) , result as (
select person_name , rank() over(order by moving_weight desc ) as ranks  from temp1 
where moving_weight <= 1000
)
select person_name from result where ranks =1;