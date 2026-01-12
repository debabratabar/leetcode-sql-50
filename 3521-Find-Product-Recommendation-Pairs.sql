

/*
Question Link  : https://leetcode.com/problems/find-product-recommendation-pairs/
Question Name :  3521. Find Product Recommendation Pairs
*/




select product1_id , product2_id , b.category as product1_category  , c.category as product2_category ,  customer_count
from (

select   p1.product_id as product1_id  , p2.product_id as product2_id  , count(distinct p1.user_id) as customer_count 
from ProductPurchases  p1 join ProductPurchases p2
on p1.user_id =p2.user_id 
and p1.product_id < p2.product_id
group by 1 ,2 having count(distinct p1.user_id) >=3
) a join  ProductInfo  b on a.product1_id = b.product_id
join  ProductInfo  c on a.product2_id = c.product_id
order by customer_count desc , product1_id , product2_id 