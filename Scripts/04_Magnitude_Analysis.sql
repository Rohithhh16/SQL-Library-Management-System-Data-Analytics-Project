/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/

use library;

-- Finding the total number of copies WRT branch id
select BranchID,count(No_Of_Copies) as copies
from book_copies
group by BranchID
order by BranchID desc;

-- Finding the total number of copies WRT book id
select BookID,sum(No_Of_Copies) as copies
from book_copies
group by BookID;


-- Finding the total number of copies WRT Card No
select b.CardNo,sum(c.No_Of_Copies) as total_copies
from books_loan as a
join borrower as b
on a.CardNo=b.CardNo
join book_copies as c
on a.BookID=c.BookID
group by b.CardNo;


-- Finding the total number of  and how many times borrowed and average copies borrow each time WRT BorrowerName
select b.BorrowerName,count(c.No_Of_Copies) as No_of_times_taken,avg(c.No_Of_Copies)as avg_copies,sum(c.No_Of_Copies) as total_copies
from books_loan as a
join borrower as b
on a.CardNo=b.CardNo
join book_copies as c
on a.BookID=c.BookID
group by b.BorrowerName;

