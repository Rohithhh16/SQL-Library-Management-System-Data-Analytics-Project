/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/




use library;

# 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
select No_Of_Copies from book_copies 
inner join library_branch on book_copies.BranchID = library_branch.BranchID 
inner join book on book_copies.BookID=book.BookID 
where book.Title="The Lost Tribe" and library_branch.BranchName = "Sharpstown";

#----------------------------------------------------------------------------------------------------------------------------------------------

# 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
select sum(No_Of_Copies) from book_copies
inner join book on book_copies.BookID=book.BookID 
where book.Title="The Lost Tribe";

#----------------------------------------------------------------------------------------------------------------------------------------------

# 3. Retrieve the names of all borrowers who do not have any books checked out.
select borrower.BorrowerName
from borrower 
left join books_loan on books_loan.CardNo = borrower.CardNo
where books_loan.CardNo is null;

#----------------------------------------------------------------------------------------------------------------------------------------------

# 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 
select book.Title,borrower.BorrowerName,borrower.BorrowerAddress
from books_loan 
inner join library_branch on books_loan.BranchID = library_branch.BranchID
inner join book on books_loan.BookID=book.BookID 
inner join borrower on borrower.CardNo = books_loan.CardNo
where library_branch.BranchName = "Sharpstown" and books_loan.DueDate="2/3/18";

#----------------------------------------------------------------------------------------------------------------------------------------------

# 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

select  library_branch.BranchName,count(library_branch.BranchID) as total_books
from books_loan
inner join library_branch on books_loan.BranchID=library_branch.BranchID
group by library_branch.BranchID;

#----------------------------------------------------------------------------------------------------------------------------------------------

# 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select borrower.BorrowerName,borrower.BorrowerAddress,count(borrower.CardNo) as number_of_books
from books_loan
inner join borrower on borrower.CardNo=books_loan.CardNo
group by borrower.CardNo;

#----------------------------------------------------------------------------------------------------------------------------------------------

# 7. For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
select book.Title,(book_copies.No_Of_Copies)
from book_copies
inner join book on book.BookID=book_copies.BookID
inner join library_branch on library_branch.BranchID = book_copies.BranchID
inner join book_authors on book_authors.BookID = book_copies.BookId
where library_branch.BranchName = "Central" and book_authors.AuthorName = "Stephen King";
