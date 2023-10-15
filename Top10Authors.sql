-- Retrieve the top 10 authors with the most books borrowed, along with the total borrowed books and average publication year.
-- I am assuming that the database name is "LibraryDB", if you have a different databse name, please replace "LibraryDB" with your database name
-- I am assuming that the table name is "authors", if you have a different table name, please replace "authors" with your table name

USE LibraryDB; -- Specify your database name

SELECT
    a.author_name AS Author,
    COUNT(b.book_id) AS TotalBooksBorrowed,
    AVG(b.publication_year) AS AveragePublicationYear
FROM
    authors AS a
-- Join the authors table with the books table using author_id
INNER JOIN
    books AS b ON a.author_id = b.author_id
-- Join the books table with the book_borrow_history table using book_id
INNER JOIN
    book_borrow_history AS bbh ON b.book_id = bbh.book_id
-- Group the results by the author's name
GROUP BY
    a.author_name
-- Order the authors by the total number of books borrowed in descending order
ORDER BY
    TotalBooksBorrowed DESC
-- Limit the result to the top 10 authors
LIMIT 10;
