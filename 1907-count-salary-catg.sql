/*
Question Link  : https://leetcode.com/problems/count-salary-categories
Question Name :  1907. Count Salary Categories

*/


with temp1 as (
select 'Low Salary' as category union
select 'Average Salary' as category union
select 'High Salary' as category 
)
, temp2 as (
select category , count(account_id) as accounts_count from (
select account_id , case when income <20000 then 'Low Salary' 
                        when income >=20000 and income <=50000 then 'Average Salary'
                        when income >50000  then 'High Salary' 
                        end as category
from accounts
) a1 group  by category 

)
select t1.category , case when  accounts_count is null  then 0 else accounts_count end as accounts_count
from temp1 t1 left join temp2 t2 on t1.category = t2.category 