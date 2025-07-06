/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
use library;

-- Finding total number of copies 
select sum(No_Of_Copies) as total_No_copies 
from book_copies;

-- Finding count number of copies
select count(No_Of_Copies) as No_copies 
from book_copies;

-- Finding count of Cardno
select count(CardNo) as a 
from borrower;

-- Finding count of Cardno
select count(LoansID) as a 
from books_loan;