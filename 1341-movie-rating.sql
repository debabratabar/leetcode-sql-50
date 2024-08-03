/*
Question Link  : https://leetcode.com/problems/movie-rating
Question Name :  1341. Movie Rating
*/



(
select  
    name as results 
from (
select 
    u.name, 
    mr.user_id, 
    count(mr.movie_id ) as count
from users u left join movierating mr 
on u.user_id = mr.user_id 
group by 1 , 2 )
order by count desc , name limit 1 )
union all
(
select  
    title as results from (
select 
    m.title , 
    mr.movie_id , 
    avg(mr.rating) as avg_rating
from movies m left join movierating mr 
on m.movie_id = mr.movie_id 
where to_char(created_at ,'yyyy-mm') = '2020-02'
group by 1 , 2
) 
order by avg_rating desc , title 
limit 1 
);