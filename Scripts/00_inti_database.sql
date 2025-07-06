/*
=============================================================
Create Database and Tables
=============================================================
Script Purpose:
    This script creates a new database named 'library' after checking if it is not exists. 
    If the database exists, simply it doesn"t do anything
    Additionally this script creates a Tables in library Database 
	
WARNING:
    Running this script will craete 'library' database if it is not exists. 
    And also empty tables are created then import the data with Table Data Import Wizard.
*/


# CRAETING LIBRARY DATABASE
Create database if not exists learndb;

#----------------------------------------------------------------------------------------------------------------------------------------------

# USING LIBRARY DATABAE
use library;

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING PUBLISHER TABLE
create table Publisher(PublisherName varchar(50) primary key,PublisherAddress varchar(200),PublisherPhone varchar(30));
# Insert values thorgh Table Data Import Wizard

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING BORROWER TABLE
create table Borrower(CardNo int auto_increment primary key,BorrowerName varchar(30),BorrowerAddress varchar(100),BorrowerPhone varchar(30));
# Insert values thorgh Table Data Import Wizard

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING LIBRARY_BRANCH TABLE
create table Library_Branch(BranchID int auto_increment primary key,BranchName varchar(30),BranchAddress varchar(100));
# Insert values thorgh Table Data Import Wizard
select * from Library_Branch;

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING BOOK TABLE
create table Book(BookID int primary key,Title varchar(200),PublisherName varchar(50), foreign key (PublisherName) references Publisher(PublisherName));
# Insert values thorgh Table Data Import Wizard
select * from Book;

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING BOOK_AUTHORS TABLE
create table Book_authors(AuthorID int auto_increment primary key,BookID int,AuthorName varchar(50),foreign key (BookID) references Book(BookID));
# Insert values thorgh Table Data Import Wizard

#----------------------------------------------------------------------------------------------------------------------------------------------

#CREATING BOOKS_LOAN TABLE
create table books_loan(LoansID int auto_increment primary key,BookID int,BranchID int,CardNo int,DateOut varchar(30),DueDate varchar(30),foreign key (BookID) references Book(BookID),foreign key (BranchID) references Library_Branch(BranchID),foreign key (CardNo) references Borrower(CardNo));
# Insert values thorgh Table Data Import Wizard

#----------------------------------------------------------------------------------------------------------------------------------------------

# CREATING BOOK_COPIES TABLE
create table book_copies(CopiesID int auto_increment primary key,BookID int,BranchID int,No_Of_Copies int,foreign key (BookID) references Book(BookID),foreign key (BranchID) references Library_Branch(BranchID));
# Insert values thorgh Table Data Import Wizard

#----------------------------------------------------------------------------------------------------------------------------------------------
