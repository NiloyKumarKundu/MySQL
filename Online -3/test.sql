# 1 

SELECT e1.employee_id, e1.last_name, COUNT(*) AS "total number of employees"
FROM employees AS e1 JOIN employees AS e2
ON e1.hire_date < e2.hire_date
GROUP BY e1.employee_id


# 2

SELECT employee_id, concat(first_name,' ',last_name)'Full_name', c.country_name AS country
FROM employees e
JOIN 
departments d 
ON (e.department_id = d.department_id)
JOIN 
locations l
ON (d.location_id = l.location_id)
JOIN 
countries c 
on(l.country_id=c.country_id)
WHERE e.first_name LIKE 'John' or e.first_name LIKE 'David';

# 3

SELECT concat(e.first_name,' ',e.last_name)'Full_name', d.department_name, e.salary
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
ORDER BY salary DESC
LIMIT 0, 5;

