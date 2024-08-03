

/*
Question Link  : https://leetcode.com/problems/group-sold-products-by-the-date/
Question Name :  1484. Group Sold Products By The Date

*/



select 
    sell_date,
    count(distinct product) as num_sold,
    string_agg( distinct product , ',') as products 
from 
activities
group by 1 ;