

/*
Question Link  : https://leetcode.com/problems/find-covid-recovery-patients/description/
Question Name :  3586. Find COVID Recovery Patients

*/






with tmp as (

select 
    pos.patient_id 
    , pos.test_date as pos_date
    , neg.test_date as neg_date 
    ,rank() over(partition by pos.patient_id  order by  pos.test_date,neg.test_date  ) as rnk
from 
( 
    select 
        patient_id 
        , test_date  
    from covid_tests 
    where result = 'Positive'
) pos join ( 
    select 
        patient_id 
        , test_date  
    from covid_tests 
    where result = 'Negative'
)  neg 
on pos.patient_id = neg.patient_id
and pos.test_date < neg.test_date
) 
select 
    t.patient_id 
    , p.patient_name
    , p.age 
    ,t.neg_date - t.pos_date as recovery_time   
from tmp t join patients p 
on t.patient_id = p.patient_id and t.rnk =1
order by (t.neg_date - t.pos_date) , p.patient_name

