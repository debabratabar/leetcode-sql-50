/*
Question Link  : https://leetcode.com/problems/human-traffic-of-stadium/description/
Question Name :  601. Human Traffic of Stadium

*/

with tmp1 as ( -- first getting the >100 records 
select * from
stadium 
where people>=100 
) , tmp2 as ( -- rnk is normal rnk , rnk2 will tell us continuous rows , when some rows breaks , the number will change 

    select * , row_number() over(order by id) as rnk ,
    id - row_number() over(order by id) as rnk2 
    from tmp1
)
select id   , visit_date , people  
from tmp2 where rnk2 in ( 
    select rnk2 from tmp2 group by 1 having count(1)>=3 -- we are only taking rnk2 where its count >=3 to meet the req.
)