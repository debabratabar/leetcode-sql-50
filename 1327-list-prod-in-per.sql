


/*
Question Link  : https://leetcode.com/problems/list-the-products-ordered-in-a-period/
Question Name :  1327. List the Products Ordered in a Period

*/


select 
    p.product_name,
    sum(o.unit) as unit 
from orders o   join products p
on o.product_id = p.product_id
where to_char(order_date , 'yyyy-MM') = '2020-02'
group by 1 having sum(o.unit) >=100;