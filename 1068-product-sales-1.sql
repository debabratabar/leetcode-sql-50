

/*
Question Link  : https://leetcode.com/problems/product-sales-analysis-i
Question Name :  1068. Product Sales Analysis I

*/



select 
    p1.product_name, 
    s1.year, 
    s1.price
from sales s1 left join product p1
on s1.product_id = p1.product_id ;