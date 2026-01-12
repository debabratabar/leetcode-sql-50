

/*
Question Link  : https://leetcode.com/problems/find-books-with-no-available-copies/
Question Name :  3570. Find Books with No Available Copies
*/



with tmp as ( 
    select book_id , count(1) as current_borrowers  from borrowing_records 
    where return_date is NULL 
    group by 1 
)

select  
    lb.book_id 
    , lb.title
    , lb.author
    , lb.genre
    ,lb.publication_year
    ,t.current_borrowers 
from tmp t join library_books lb 
on t.book_id = lb.book_id 
and t.current_borrowers  = lb.total_copies
order by t.current_borrowers desc , lb.title