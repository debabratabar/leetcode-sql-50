/*
Question Link  : https://leetcode.com/problems/invalid-tweets/
Question Name :  1683. Invalid Tweets

*/


select tweet_id 
 from tweets
where length(content) > 15 ;