SELECT CONCAT (
    SUBSTRING(title, 1, 10),
    '....'
) AS 'Short Title' FROM books;