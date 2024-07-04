/*
Question Link  : https://leetcode.com/problems/exchange-seats/
Question Name :  626. Exchange Seats

*/

with temp1 as (
select   id , student , ceil(1.0*id/2)  as helper
 from seat  )

 select row_number() over(order by helper , id desc) as id, student  from temp1 