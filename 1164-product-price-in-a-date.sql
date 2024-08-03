/*
Question Link  : https://leetcode.com/problems/product-price-at-a-given-date/
Question Name :  1164. Product Price at a Given Date

*/

with temp1 as 
(select distinct 
    product_id 
from products ) ,
temp2 as (
select 
    *
from (
select 
    product_id, 
    new_price, 
    change_date, 
    rank() over ( partition by product_id order by change_date desc)as ranks 
from products 
where change_date <= '2019-08-16'
) 
where ranks =1)
select 
    t1.product_id, 
    case when t2.new_price is null then 10 else t2.new_price end as price 
from temp1 t1 left join temp2 t2 
on t1.product_id = t2.product_id ;