/*
Question Link  : https://leetcode.com/problems/triangle-judgement/
Question Name :  610. Triangle Judgement
*/



select x , y , z , 
case when ( x+y > z  and x+z>y and y+z>x ) then 'Yes' 
else 'No' end as triangle 
from triangle ;