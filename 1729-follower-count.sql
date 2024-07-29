

/*
Question Link  : https://leetcode.com/problems/find-followers-count/description/
Question Name :  1729. Find Followers Count
*/


select user_id , count(distinct follower_id) as followers_count
from Followers 
group by 1 
order by 1 ;