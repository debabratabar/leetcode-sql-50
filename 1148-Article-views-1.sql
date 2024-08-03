/*
Question Link  : https://leetcode.com/problems/article-views-i/
Question Name :  1148. Article Views I

*/



select distinct 
    author_id as id 
from views 
where author_id = viewer_id
order by author_id ;