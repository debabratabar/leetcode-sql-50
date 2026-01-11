
/*
Question Link  : https://leetcode.com/problems/dna-pattern-recognition/
Question Name :  3475. DNA Pattern Recognition 

*/



select * , 
    sum( case when dna_sequence like 'ATG%' then 1 else 0 end) over(partition by sample_id) as has_start
    ,sum( case when dna_sequence like '%TAA' or dna_sequence like '%TAG' or dna_sequence like '%TGA'  then 1 else 0 end) over(partition by sample_id) as has_stop
    ,sum( case when dna_sequence like '%ATAT%' then 1 else 0 end) over(partition by sample_id) as has_atat
    ,sum( case when dna_sequence like '%GGG%' then 1 else 0 end) over(partition by sample_id) as has_ggg
from samples