SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

SELECT job_id, MAX(salary), MIN(salary), AVG(salary)
FROM employees
GROUP BY job_id;

SELECT job_id, COUNT(first_name)            -- Non null value gulo er count k return kore
FROM employees
GROUP BY job_id;



SELECT job_id, COUNT(*)         -- Total joto row ache counting NULL.
FROM employees
GROUP BY job_id;


-- Complete table ta k ekta single group hisebe consider kora
SELECT AVG(salary), COUNT(*)
FROM employees;

-- sales dept e job_id er basis e group korbo
SELECT job_id, MAX(salary), MIN(salary)
FROM employees
WHERE department_id = 80
GROUP BY job_id;


-- sorted
SELECT job_id, MAX(salary), MIN(salary)
FROM employees
WHERE department_id = 80
GROUP BY job_id
ORDER BY job_id DESC;



SELECT job_id, department_id, MAX(salary), MIN(salary)
FROM employees
GROUP BY job_id, department_id;

SELECT job_id, COUNT(DISTINCT salary), SUM(DISTINCT salary), SUM(salary)
FROM employees
GROUP BY job_id;



-------- HAVING CLAUSE-------
SELECT department_id, MAX(salary), MIN(salary), MIN(salary)
FROM employees
WHERE department_id <> 80
GROUP BY department_id;

-- same kaj ta having clause er maddhome kora jai
SELECT department_id, MAX(salary), MIN(salary), MIN(salary)
FROM employees
GROUP BY department_id
HAVING department_id <> 80;


SELECT department_id, MAX(salary), MIN(salary), MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 5000;


SELECT department_id, MAX(salary), MIN(salary), MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 5000 AND MAX(salary) > 12000;
ORDER BY department_id DESC;


------------ JOIN ------------
----- VERY IMPORTANT -----
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d USING(department_id);

SELECT e.last_name, e.department_id, d.department_id, d.department_name
FROM employees e JOIN departments d;                --- All possible combinaiton create kore

SELECT e.last_name, e.department_id, d.department_id, d.department_name
FROM employees e JOIN departments d
ON(e.department_id = d.department_id);                --- ON -> all possible combination ta remove kore 


SELECT e1.first_name "Employee", e2.first_name "Manager"
FROM employees e1 JOIN employees e2
ON (e1.manager_id = e2.employee_id)


SELECT e1.employee_id, e1.last_name, e1.salary, COUNT(*) "higher salary" 
FROM employees e1 JOIN employees e2
ON (e2.salary > e1.salary)
GROUP BY e1.employee_id, e1.last_name;

SELECT e.last_name, d.department_name, l.city
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)


#LEFT OUTER JOIN
# RIGHT OUTER JOIN

# LEFT OUTER JOIN
# left er sathe right er join koranor por left jegulor sathe join hoi nai, segulo rekhe dile left outer join

# RIGHT OUTER JOIN
# right er sathe left er join koranor por right jegulor sathe join hoi nai, segulo rekhe dile right outer join


SELECT e1.last_name, COUNT(e2.employee_id), COUNT(*)
FROM employees e1 JOIN employees e2
ON (e1.employee_id = e2.manager_id)
GROUP BY e1.employee_id, e1.last_name;

SELECT e1.last_name Manager, e2.last_name Employee
FROM employees e1 LEFT OUTER JOIN employees e2
ON (e1.employee_id = e2.manager_id)


SELECT e1.last_name, COUNT(e2.employee_id), COUNT(*)
FROM employees e1 LEFT OUTER JOIN employees e2
ON (e1.employee_id = e2.manager_id)
GROUP BY e1.employee_id, e1.last_name;


SELECT e1.last_name, COUNT(e2.employee_id), COUNT(*)
FROM employees e1 RIGHT OUTER JOIN employees e2
ON (e1.employee_id = e2.manager_id)
GROUP BY e1.employee_id, e1.last_name;