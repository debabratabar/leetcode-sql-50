/*
Question Link  : https://leetcode.com/problems/not-boring-movies
Question Name :  620. Not Boring Movies
*/

select id , movie , description , rating 
from Cinema 
where description != 'boring' and (id % 2) != 0  
order by rating desc  ; 