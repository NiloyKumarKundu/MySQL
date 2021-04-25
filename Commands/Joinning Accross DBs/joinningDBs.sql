-- Real life e kaj korar somoy amader multiple DBs niye kaj korte hoi.
-- Ekhane amra dekhbo kivabe multiple DBs er table niye kaj korte hoy.

-- We have to prefix the table that not a part of out DBs.

-- if we use a DBs called sql_store and we want to join with sql_inventory then,

-- SELECT *
-- FROM order_items oi
-- JOIN sql_inventory.products p
-- 	ON oi.product_id = p.product_id;

-- This is a way to do this.
-- On the other hand, if we working on sql_inventory and want to join sql_store then at first we have to select 
-- sql_inventory then we have to prefix on the joinning of the DB called sql_store.

USE sql_inventory;

SELECT *
FROM sql_store.order_items oi
JOIN products p
	ON oi.product_id = p.product_id;