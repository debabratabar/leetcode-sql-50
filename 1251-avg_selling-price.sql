
/*
Question Link  : https://leetcode.com/problems/average-selling-price/
Question Name :  1251. Average Selling Price
*/


with temp1 as (
select distinct  
    pr.product_id, 
    sum ( pr.price * us.units )   as total_sales , 
    sum(units)   as total_products_sold
from Prices  pr  left  join unitsSold  us 
on us.product_id = pr.product_id 
and us.purchase_date >= pr.start_date 
and us.purchase_date <= pr.end_date   
group by pr.product_id
) 
select 
    product_id , 
    case when round( ( 1.0 * total_sales) /total_products_sold  , 2 ) is null then 0 
    else round( ( 1.0 * total_sales) /total_products_sold  , 2 ) end as average_price
from temp1 ;
