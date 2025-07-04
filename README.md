# SQL-Task8

Objective:
The goal of this task was to learn how to modularize SQL logic using stored procedures and functions. I created reusable SQL blocks using CREATE PROCEDURE and CREATE FUNCTION with input parameters and conditional logic.

What I Did:
Created a stored procedure that returns all books written by a specific author

Created a stored procedure that checks if a member has borrowed any books and displays a message accordingly

Created a function that returns the total number of books published after a given year

Used conditional logic (IF) and parameters in the procedures

Used CALL to execute stored procedures and SELECT to use the function

Also included how to drop procedures and functions when needed

Procedures and Functions Created:
1. GetBooksByAuthor (Stored Procedure)
Takes author name as input

Returns a list of book titles and publication years written by that author

Useful for filtering books by specific author

2. CheckBorrowStatus (Stored Procedure)
Takes member ID as input

Checks how many books the member has borrowed

Displays a custom message depending on whether the member has borrowed any books or not

3. CountBooksAfter (Function)
Takes a year as input

Returns how many books were published after that year

Can be used inside a SELECT query directly

Result:
After completing this task, I now understand how stored procedures and functions can be used to modularize SQL logic. This helps in keeping queries clean, reusable, and easy to manage. I also learned how to pass parameters and use IF conditions inside stored procedures.

