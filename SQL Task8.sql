Use LibraryDB;

-- Creating a Stored Procedure to get books by a specific author
DELIMITER $$
CREATE PROCEDURE GetBooksByAuthor(IN author_name VARCHAR(100))
BEGIN
    SELECT b.title, b.publication_year
    FROM Book b
    JOIN Book_Author ba ON b.book_id = ba.book_id
    JOIN Author a ON ba.author_id = a.author_id
    WHERE a.name = author_name;
END $$
DELIMITER ;
-- This procedure takes author name as input and shows all books written by that author


SHOW PROCEDURE STATUS WHERE Db = 'Librarydb';

-- To call this procedure:
CALL GetBooksByAuthor('J.K. Rowling');


-- Creating a Stored Procedure with IF condition: Check if a member has borrowed any books
DELIMITER $$
CREATE PROCEDURE CheckBorrowStatus(IN member_id INT)
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM Borrow
    WHERE Borrow.member_id = member_id;

    IF total > 0 THEN
        SELECT CONCAT('Member ', member_id, ' has borrowed ', total, ' books.') AS message;
    ELSE
        SELECT CONCAT('Member ', member_id, ' has not borrowed any books.') AS message;
    END IF;
END $$
DELIMITER ;
-- This procedure checks whether a member has borrowed any books or not using IF condition


-- To call:
CALL CheckBorrowStatus(2);


-- Creating a SQL FUNCTION to count total books published after a certain year
DELIMITER $$
CREATE FUNCTION CountBooksAfter(year_input INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_books INT;

    SELECT COUNT(*) INTO total_books
    FROM Book
    WHERE publication_year > year_input;

    RETURN total_books;
END $$
DELIMITER ;
-- This function takes a year and returns how many books were published after that year


-- To use the function:
SELECT CountBooksAfter(2010) AS books_after_2010;


-- Drop procedure or function (optional cleanup)
DROP PROCEDURE IF EXISTS GetBooksByAuthor;
DROP PROCEDURE IF EXISTS CheckBorrowStatus;
DROP FUNCTION IF EXISTS CountBooksAfter;
-- Use this when you want to remove procedures/functions for testing or re-creation
