-- SELECT *
-- FROM orders o
-- JOIN customers c
-- 	ON o.customer_id = c.customer_id;

-- implicit join syntax
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

-- Jodi amra WHERE clause likhte vule jai, tahole customer table er all record amader show koriye dibe
-- Better to use explecit JOIN syntax
