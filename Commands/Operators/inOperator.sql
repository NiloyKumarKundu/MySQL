SELECT *
FROM customers
-- WHERE state = 'VA' OR state = 'FL' OR state = 'GA';
-- WHERE state IN ('VA', 'FL', 'GA');
WHERE state NOT IN ('VA', 'FL', 'GA');