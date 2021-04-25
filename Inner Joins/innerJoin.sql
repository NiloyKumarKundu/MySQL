-- ekhane INNER JOIN / JOIN duita key word same kaj kore
-- ON keyword use kora hoi, duita table er majhe kon condition e record match korabe ei vittite

-- SELECT *
-- FROM customers
-- JOIN orders ON customers.customer_id = orders.customer_id;


-- Amra jodi specific vabe jeta k primary key hisebe use korechi (customer_id) seta print korate chai,
-- tahole normally print korale error dekhabe
-- er jonno amader specify kore dite hobe, ei primary key ta kon table er jonno (j kono ekta table dilei hobe)


-- SELECT order_id, orders.customer_id, first_name, last_name
-- FROM customers
-- JOIN orders 
--    ON customers.customer_id = orders.customer_id;

-- &&

-- SELECT order_id, customers.customer_id, first_name, last_name
-- FROM customers
-- JOIN orders 
--     ON customers.customer_id = orders.customer_id;

-- Both are same

-- Ekoi table er column jokhon bar bar use kora lagtese, tokhon amra chaile ei jinish ta k variable er moto use korte pari
-- Eta k SQL e bola hoi Alias.
-- EX:

SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id;

