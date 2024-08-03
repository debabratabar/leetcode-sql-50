/*
Question Link  : https://leetcode.com/problems/customers-who-bought-all-products
Question Name :  1045. Customers Who Bought All Products

*/

select 
    customer_id 
from (
select 
    customer_id , 
    count(distinct product_key) as total_product_bought ,
    (select count(*) from product ) as total_products 
from customer
group by customer_id 
) temp1 
where total_product_bought = total_products;