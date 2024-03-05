

-- ======================= TABLES ========================

-- Table for storing publisher information
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_PublisherAddress VARCHAR(200) NOT NULL,
    publisher_PublisherPhone VARCHAR(50) NOT NULL
);

-- Table for storing book information
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_Title VARCHAR(100) NOT NULL,
    book_PublisherName VARCHAR(100) NOT NULL,
    CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);


-- Table for storing library branch information
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    library_branch_BranchName VARCHAR(100) NOT NULL,
    library_branch_BranchAddress VARCHAR(200) NOT NULL
);

-- Display all rows from tbl_library_branch (for testing purposes)
SELECT * FROM tbl_library_branch;

-- Table for storing borrower information
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
    borrower_BorrowerName VARCHAR(100) NOT NULL,
    borrower_BorrowerAddress VARCHAR(200) NOT NULL,
    borrower_BorrowerPhone VARCHAR(50) NOT NULL
);

-- Display all rows from tbl_borrower (for testing purposes)
SELECT * FROM tbl_borrower;

-- Table for storing book loans information
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_loans_BookID INT NOT NULL,
    book_loans_BranchID INT NOT NULL,
    book_loans_CardNo INT NOT NULL,
    book_loans_DateOut VARCHAR(50) NOT NULL,
    book_loans_DueDate VARCHAR(50) NOT NULL,
    CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Display all rows from tbl_book_loans (for testing purposes)
SELECT * FROM tbl_book_loans;
-- Use GETDATE() to retrieve the date values for Date out.
-- Use DATEADD for the DueDate

-- Table for storing book copies information
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_copies_BookID INT NOT NULL,
    book_copies_BranchID INT NOT NULL,
    book_copies_No_Of_Copies INT NOT NULL,
    CONSTRAINT fk_book_id2 FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_branch_id2 FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Display all rows from tbl_book_copies (for testing purposes)
SELECT * FROM tbl_book_copies;

-- Table for storing book authors information
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(50) NOT NULL,
    CONSTRAINT fk_book_id3 FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Display all rows from tbl_book_authors (for testing purposes)
SELECT * FROM tbl_book_authors;

-- ====================== END TABLES ======================
