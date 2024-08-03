/*
Question Link  : https://leetcode.com/problems/product-sales-analysis-iii
Question Name :  1070. Product Sales Analysis III

*/


select 
    product_id , 
    year as  first_year , 
    quantity , 
    price
from (
select 
    product_id , -- min(year) over(partition by product_id) as first_year 
    quantity, 
    price, 
    year,
    rank() over(partition by product_id order by year ) as rn 
from sales
) temp1 
where rn =1 ;