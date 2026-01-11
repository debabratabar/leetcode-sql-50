
/*
Question Link  : https://leetcode.com/problems/find-products-with-valid-serial-numbers/description/
Question Name :  3465. Find Products with Valid Serial Numbers

*/



select  product_id , product_name ,  description 
from (
select product_id , product_name ,  description , unnest(string_to_array(description,' ')) as vals
from products 
) where vals ~ '^SN[0-9]{4}-[0-9]{4}$'
order by product_id