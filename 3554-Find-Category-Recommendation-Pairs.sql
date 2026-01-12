

/*
Question Link  : https://leetcode.com/problems/find-category-recommendation-pairs/
Question Name :  3554. Find Category Recommendation Pairs
*/




with tmp as (
    select a.* , b.category 
    from ProductPurchases a left join ProductInfo b on a.product_id = b.product_id
)

select   p1.category as category1  , p2.category as category2  , count(distinct p1.user_id) as customer_count 
from tmp  p1 join tmp p2
on p1.user_id =p2.user_id 
and p1.category < p2.category
group by 1 ,2 having count(distinct p1.user_id) >=3
order by customer_count desc , p1.category , p2.category