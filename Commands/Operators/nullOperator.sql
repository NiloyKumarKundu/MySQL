-- NULL means the absence of the value
SELECT *
FROM customers
-- WHERE phone IS NULL;
WHERE phone IS NOT NULL;