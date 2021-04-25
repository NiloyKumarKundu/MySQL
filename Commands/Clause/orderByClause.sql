-- SELECT *
-- FROM customers
-- ORDER BY customer_id DESC;
-- ORDER BY first_name;
-- ORDER BY first_name DESC;
-- ORDER BY state, first_name;
-- ORDER BY state DESC, first_name;
-- ORDER BY state DESC, first_name DESC;


-- SELECT first_name, last_name
-- FROM customers
-- ORDER BY birth_date;

SELECT birth_date, first_name, last_name, 10 AS points
FROM customers
ORDER BY first_name;