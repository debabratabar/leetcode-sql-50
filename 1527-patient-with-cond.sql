/*
Question Link  : https://leetcode.com/problems/patients-with-a-condition/
Question Name :  1527. Patients With a Condition

*/

with temp1 as (
select distinct
    patient_id,
    patient_name,
    unnest(string_to_array(cast(conditions as TEXT )  , ' ')) as conditions
from patients 
)
select distinct
    t1.patient_id,
    t1.patient_name,
    p.conditions
from temp1 t1 join patients p 
on t1.patient_id = p.patient_id
where t1.conditions like 'DIAB1%' ; 