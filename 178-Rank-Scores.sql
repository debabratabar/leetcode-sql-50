/*
Question Link  : https://leetcode.com/problems/rank-scores/description/
Question Name :  178. Rank Scores

*/


select score , dense_rank() over(order by score desc) as rank 
from scores ;