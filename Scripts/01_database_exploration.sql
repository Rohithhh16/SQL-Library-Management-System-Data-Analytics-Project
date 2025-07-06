/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.
    - To inspect the rows from the tables

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/
use  library;

-- Retrieve a list of all tables in the database
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'book';


-- Retrieve all rows for a specific table (book)
select * from book;

-- Retrieve all rows for a specific table (book_authors)
select * from book_authors;

-- Retrieve all rows for a specific table (book_copies)
select * from book_copies;

-- Retrieve all rows for a specific table (books_loan)
select * from books_loan;

-- Retrieve all rows for a specific table (borrower)
select * from borrower;

-- Retrieve all rows for a specific table (library_branch)
select * from library_branch;

-- Retrieve all rows for a specific table (publisher)
select * from publisher;
