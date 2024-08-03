

/*
Question Link  : https://leetcode.com/problems/fix-names-in-a-table/
Question Name :  1667. Fix Names in a Table

*/


select user_id , concat( upper(substr(name , 1,1)) , lower( substr(name , 2 , length(name)-1  ))) as name 
from users 
order by user_id 