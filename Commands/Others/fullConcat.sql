SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full
FROM books;