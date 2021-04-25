-- Data k specific record er vittite sort korar jonno Order By Clause use kora hoi

-- SELECT
-- 	*,
-- 	unit_price * quantity AS total_price
-- FROM order_items
-- ORDER BY (unit_price * quantity) DESC;

SELECT
	*,
	unit_price * quantity AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY (unit_price * quantity) DESC;