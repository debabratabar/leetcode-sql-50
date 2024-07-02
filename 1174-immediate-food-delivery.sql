/*
Question Link  : https://leetcode.com/problems/immediate-food-delivery-ii
Question Name :  1174. Immediate Food Delivery II

*/

with temp1 as (
select customer_id , order_date , 
case when order_date =  customer_pref_delivery_date then 'immediate' else 'scheduled' end as delivery_type ,
rank() over(partition by customer_id  order by order_date) as ranks 
from delivery 
) 

select 
round(     
100.00 * sum(
    case when ranks =1 and delivery_type='immediate' then 1 else 0 end 
) / count(distinct customer_id) , 2  )  as immediate_percentage 
from temp1 