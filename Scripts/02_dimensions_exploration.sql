/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/
use library;
-- Retrieve a list of unique branchnames from library_branch
select distinct(BranchName) as Branches 
from library_branch
order by Branches;

-- Retrieve a list of unique Borrower names from borrower
select distinct(BorrowerName) as B_Name 
from borrower
order by B_Name;

-- Retrieve a list of unique authors names from book_authors
select distinct(AuthorName) as A_Name 
from book_authors
order by A_Name;