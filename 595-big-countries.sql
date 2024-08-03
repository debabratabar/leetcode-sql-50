/*
Question Link  : https://leetcode.com/problems/big-countries
Question Name :  595. Big Countries 

*/



select 
    name, 
    population, 
    area 
from world 
where population >= 25000000
or area >= 3000000 ;