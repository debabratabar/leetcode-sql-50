/*
Question Link  : https://leetcode.com/problems/nth-highest-salary/description/
Question Name :  177. Nth Highest Salary

*/



CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY 
    -- Write your PostgreSQL query statement below.
    select distinct a.salary from ( 
        select * , dense_rank() over(order by e.salary desc) as rnk from employee e
    ) as a where a.rnk = N ;     

END;
$$ LANGUAGE plpgsql;