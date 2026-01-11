
/*
Question Link  : https://leetcode.com/problems/find-valid-emails/description/
Question Name :  3436. Find Valid Emails

*/



select user_id , trim(email) email from 
users 
where email ~ '^[0-9A-Za-z_]*@[a-zA-Z]*[.]com$'
order by user_id