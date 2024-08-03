
/*
Question Link  : https://leetcode.com/problems/recyclable-and-low-fat-products/
Question Name : 1757. Recyclable and Low Fat Products

*/


select 
    product_id 
from products 
where low_fats = 'Y' 
and recyclable='Y' ; 