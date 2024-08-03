
/*
Question Link  : https://leetcode.com/problems/average-time-of-process-per-machine/
Question Name :  1661. Average Time of Process per Machine
*/




with temp1 as (
select 
    t1.machine_id , 
    count(t1.process_id) tot_process , 
    sum (t2.end_timestamp - t1.start_timestamp ) as total_time
from 
(
select 
    machine_id , 
    process_id ,  
    timestamp as start_timestamp
from activity 
where activity_type='start'
) t1 inner join 
(
select 
    machine_id , 
    process_id ,  
    timestamp as end_timestamp
from activity 
where activity_type='end'
)t2 
on t1.machine_id = t2.machine_id 
and t1.process_id = t2.process_id 
group by 1 
)

select 
    machine_id , 
    round(  cast ( total_time/tot_process as Numeric ) , 3 ) 
as processing_time
from temp1;