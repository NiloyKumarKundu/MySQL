SELECT 
	first_name,
    last_name,
    points,
    (points * 10) + 100 AS new_points
FROM customers;