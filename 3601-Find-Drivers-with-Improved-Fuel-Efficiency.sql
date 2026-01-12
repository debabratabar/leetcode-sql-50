

/*
Question Link  : https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/
Question Name :  3601. Find Drivers with Improved Fuel Efficiency

*/






select * from 

(
select 
    t.driver_id
    , d.driver_name
    ,round(avg(t.distance_km /t.fuel_consumed)::Numeric , 2 ) as first_half_avg   
    ,round(avg(t1.distance_km /t1.fuel_consumed)::Numeric , 2 ) as second_half_avg      
    ,round(avg(t1.distance_km /t1.fuel_consumed)-avg(t.distance_km /t.fuel_consumed) , 2 ) as efficiency_improvement    

from trips t join trips t1 
on t.driver_id = t1.driver_id 
and extract( month from t.trip_date) between 1 and 6 
and extract( month from t1.trip_date) between 7 and 12
join drivers d on t.driver_id = d.driver_id
group by 1 ,2

) 
a 
where efficiency_improvement>0
order by efficiency_improvement desc , driver_name