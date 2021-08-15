-- Join Practise

-- Show the employee first name and his manager first name

SELECT e.first_name AS employee_name, manager.first_name AS manager_name, manager_manager.first_name
FROM employees e
JOIN employees manager
ON e.manager_id = manager.employee_id

JOIN employees manager_manager
ON manager.manager_id = manager_manager.employee_id;

-- show the manager first name show manages more than 5 employees


SELECT manager.first_name
FROM employees e
JOIN employees manager
ON e.manager_id = manager.employee_id
GROUP BY manager.employee_id, manager.first_name
HAVING COUNT(*) > 5;
