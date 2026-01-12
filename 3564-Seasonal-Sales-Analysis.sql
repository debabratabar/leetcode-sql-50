

/*
Question Link  : https://leetcode.com/problems/seasonal-sales-analysis/
Question Name :  3564. Seasonal Sales Analysis
*/



select season  , category , total_quantity , total_revenue
from (
select * , 
dense_rank() over( partition by season order by total_quantity desc , total_revenue desc , category) as rnk
from (

select 
    case when extract (month from sale_date) in ( '12','1','2')   then 'Winter' 
     when extract (month from sale_date) in ( '3','4','5') then 'Spring' 
     when extract (month from sale_date) in ( '6','7','8') then 'Summer' 
    else 'Fall' end as season,
    p.category  , sum( quantity) as total_quantity , round( sum(quantity * price)::Numeric , 2 ) as total_revenue
    -- distinct s.* , p.category
from sales s left join products p on  s.product_id = p.product_id 
group by 1 ,2 )
) a where a.rnk=1
order by 1