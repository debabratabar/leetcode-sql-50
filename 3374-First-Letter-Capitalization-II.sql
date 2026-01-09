/*
Question Link  : https://leetcode.com/problems/first-letter-capitalization-ii/description/
Question Name :  3374. First Letter Capitalization II

*/

-- Write your PostgreSQL query statement below




with temp as 
(select * , 
    unnest (string_to_array(content_text , ' ') ) examp
from user_content
) , tmp2 as (
select * , case when examp like '%-%' then 
            concat( upper( substr( split_part(examp , '-' , 1) , 1,1) ) , lower( substr( split_part(examp , '-' , 1) , 2, length(split_part(examp , '-' , 1))) )  , '-' ,
            upper( substr( split_part(examp , '-' , 2) , 1,1) ) , lower( substr( split_part(examp , '-' , 2) , 2, length(split_part(examp , '-' , 2))) )  
            )
                else concat( upper(substr(examp,1,1)) , lower(substr(examp,2,length(examp))) ) end as  examp2
from temp
)
select content_id , content_text as original_text , string_agg(examp2 , ' ' )  as converted_text
from tmp2 
group by 1,2
order by 1