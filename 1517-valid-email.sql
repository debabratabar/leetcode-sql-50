/*
Question Link  : https://leetcode.com/problems/find-users-with-valid-e-mails/
Question Name :  1517. Find Users With Valid E-Mails
*/



select 
    user_id,
    name,
    mail 
from users 
where mail ~ '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode[.]com$';

