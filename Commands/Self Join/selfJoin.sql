-- In SQL we can also join a table with itself.

-- USE sql_hr;

-- SELECT *
-- FROM employees e
-- JOIN employees m
-- 	ON e.reports_to = m.employee_id;

-- er ortho holo, employee jader k manager er kache report korte hobe, tader details dekhabe
-- manager er name asbe na

-- USE sql_hr;

-- SELECT 
-- 	e.employee_id,
--     e.first_name,
--     m.first_name,
--     e.reports_to
-- FROM employees e
-- JOIN employees m
-- 	ON e.reports_to = m.employee_id;



USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;