-- USE sql_store;

-- SELECT *
-- FROM orders o
-- JOIN customers c
-- 	ON o.customer_id = c.customer_id
-- JOIN order_statuses os
-- 	ON o.status = os.order_status_id;

USE sql_store;

SELECT order_id, order_date, first_name, last_name, name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;