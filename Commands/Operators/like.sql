SELECT *
FROM customers
-- WHERE last_name LIKE 'b%';
-- WHERE last_name LIKE '%et%';

-- here % mean any string after the word b
-- here % mean any string after the word et and any string before %.

-- WHERE last_name LIKE '_y';
-- WHERE last_name LIKE '_____y';
WHERE last_name LIKE 'b____y';

-- _ single character

-- LIKE keyword is allow us to search for any string of pattern.
