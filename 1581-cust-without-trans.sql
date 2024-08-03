

/*
Question Link  : https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
Question Name :  1581. Customer Who Visited but Did Not Make Any Transactions

*/



with temp1 as (
select 
    v1.visit_id , 
    v1.customer_id 
from visits v1 left join transactions t1 
on v1.visit_id = t1.visit_id 
where t1.visit_id is null  )
select 
    customer_id , 
    count(visit_id) as count_no_trans
from temp1
group by 1;