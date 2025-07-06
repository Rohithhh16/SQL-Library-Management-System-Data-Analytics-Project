/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), Limit
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

use library;

-- retriving the top 3 total number of copies with respect to bookid
select
a.BookID,sum(No_Of_Copies) as total_copies from books_loan a 
join book_copies b 
on a.BookID = b.BookID
group by BookID
order by total_copies desc
limit 2 offset 0;

-- retriving top 3 highest count no_of_copies wrt bookid using rank
select * 
from(select a.BookID,sum(b.No_Of_Copies) as total_copies,
rank() over (order by sum(b.No_Of_Copies) desc) as rank_p from books_loan a 
join book_copies b 
on a.BookID = b.BookID
group by BookID ) as ranked_p
where rank_p<4
order by rank_p desc;

-- retriving top 3 highest count no_of_copies wrt bookid using dense_rank
select * 
from(select a.BookID,sum(b.No_Of_Copies) as total_copies,
dense_rank() over (order by sum(b.No_Of_Copies) desc) as rank_p from books_loan a 
join book_copies b 
on a.BookID = b.BookID
group by BookID ) as ranked_p
where rank_p<4
order by rank_p desc;