
/*
Question Link  : https://leetcode.com/problems/queries-quality-and-percentage/
Question Name :  1211. Queries Quality and Percentage

*/

select 
    a.query_name , 
    round( quality/tot_count , 2 ) as quality, 
    round( ( 100.0* poor_query)  /tot_count , 2  ) as poor_query_percentage  
from
(
select 
    query_name , 
    sum (  (1.0*rating ) / position )  as quality 
from queries 
group by 1 
) a inner join 
(select 
    query_name ,  
    count(1)  as tot_count , 
    sum  ( case when rating < 3 then 1 else 0 end ) as poor_query  
from queries
group by 1 ) b 
on a.query_name = b.query_name;