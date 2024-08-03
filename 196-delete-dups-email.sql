
/*
Question Link  : https://leetcode.com/problems/delete-duplicate-emails/
Question Name :  196. Delete Duplicate Emails
*/




with temp1 as (
select 
    id,
    email,
    rank() over ( partition by email order by id ) as rn 
    from person 
)
delete from person 
where id  in  ( select id from temp1 where rn !=1);