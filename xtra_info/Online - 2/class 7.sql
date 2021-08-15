-- 1 ---------------------------------------------

SELECT concat(first_name, " ", last_name) "Full Name", hire_date "Hiring Date", job_id "Job ID"
FROM employees
WHERE last_name LIKE "%____" AND salary BETWEEN 5000 AND 10000;




-- 2 ---------------------------------------------
SELECT job_title "Managerial Post", (max_salary - min_salary) "Salary Range"
FROM jobs
WHERE job_title LIKE "%Manager%";



-- 3 ---------------------------------------------
SELECT employee_id "Employee ID", first_name "First Name"
FROM employees
WHERE (first_name NOT LIKE "%n%" AND first_name NOT LIKE "%s") && job_id IN ("IT_PROG", "FI_ACCOUNT", "PU_CLERK");



-- 4 ---------------------------------------------
SELECT employee_id, first_name, salary, (salary * 12) "net annual salary"
FROM employees
WHERE (employee_id LIKE "%2" || employee_id LIKE "%5");



-- 5 ---------------------------------------------
SELECT DISTINCT job_id "Job ID", department_id "Department ID"
FROM employees;