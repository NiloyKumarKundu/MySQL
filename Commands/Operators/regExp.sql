-- Regular Expression is very powerful when it comes to search for a string
SELECT *
FROM customers
-- WHERE last_name REGEXP 'field';
-- WHERE last_name REGEXP '^field';
-- WHERE last_name REGEXP 'field$';
-- WHERE last_name REGEXP 'field|mac';
-- WHERE last_name REGEXP '^field|mac|rose';
-- WHERE last_name REGEXP '[gim]e';
-- WHERE last_name REGEXP 'e[fmq]';
WHERE last_name REGEXP '[a-h]e';



-- ^ -> must start with the word after ^
-- $ -> end of the string
-- | -> find two or more pattern
-- [gin]e -> ge, ie, me -> try math all the pattern are in the string
-- e[fmq] -> ef, em, eq -> try math all the pattern are in the string
-- [a-h] -> a to h