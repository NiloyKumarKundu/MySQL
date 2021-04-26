-- My submission

-- USE sql_invoicing;

-- SELECT 
-- 	payment_id,
--     p.client_id,
--     p.date,
--     p.payment_method,
--     pm.name,
--     c.name,
--     phone
-- FROM payments p
-- JOIN payment_methods pm
-- 	ON p.payment_method = pm.payment_method_id
-- JOIN clients c
-- 	ON p.client_id = c.client_id;

-- Judge Submission

USE sql_invoicing;

SELECT 
	p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
JOIN clients c
	ON p.client_id = c.client_id;