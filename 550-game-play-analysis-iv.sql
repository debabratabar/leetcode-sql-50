/*
Question Link  : https://leetcode.com/problems/game-play-analysis-iv
Question Name :  550. Game Play Analysis IV
*/

with temp1 as (
select player_id , event_date ,
event_date -  min(event_date) over(partition by player_id)  as rn 
from activity
) 
select 
round ( 
    1.0* sum ( 
        case when rn =1 then 1 else 0 end 
    ) / count(distinct player_id ) ,2
)
as fraction from temp1;