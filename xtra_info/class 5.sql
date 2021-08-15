-- We will implement our query on "hr schema".


----------------------------------------------------------------------------------------------------
SELECT * FROM employees;
SELECT last_name, phone_number, salary FROM employees;
SELECT last_name, phone_number, salary * 12 FROM employees; -- annual salary
SELECT last_name, phone_number, salary * 12 "Annual Salary" FROM employees; -- changing the column name

SELECT last_name, commission_pct FROM employees;
SELECT last_name, (salary + salary * commission_pct) "Salary comm" FROM employees;
SELECT last_name, (salary + salary * NVL(commission_pct, 0)) "Salary comm" FROM employees; -- NVL -> checking NULL value


SELECT first_name, last_name FROM employees;
SELECT concat(first_name, ' ', last_name) "Full name", phone_number FROM employees;

SELECT * FROM jobs;
SELECT job_id FROM employees;
SELECT DISTINCT job_id FROM employees;  -- unique value

SELECT department_id, job_id FROM employees;
SELECT DISTINCT department_id, job_id FROM employees; 

DESCRIBE employees;     -- all information about table

# write an sql query to retrive all manager_ids.
SELECT DISTINCT manager_id FROM employees;
----------------------------------------------------------------------------------------------------

# Row Filtering
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 104;


SELECT department_id, first_name, salary
FROM employees
WHERE department_id = 80;


SELECT hire_date, first_name, salary
FROM employees
WHERE hire_date > "1998-02-05";


SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

SELECT first_name, salary, commission_pct
FROM employees
WHERE salary = 7000;

SELECT first_name, salary, commission_pct
FROM employees
WHERE salary <> 7000;       -- Not equal


SELECT first_name, salary, commission_pct
FROM employees
WHERE salary BETWEEN 7000 AND 10000;    -- (include)


SELECT first_name, salary, commission_pct
FROM employees
WHERE salary IN (7000, 8000, 9000, 10000);      -- if this value exists then show otherwise not


SELECT first_name, salary, commission_pct
FROM employees
WHERE hire_date BETWEEN '1997-01-01' AND '1997-12-31';

# sales dept(dept id = 80), salary > 6000
SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = 80 AND salary > 6000;

# show last_name and salary for employees from non-sales dept and either salary > 5000 or commission_pct is not null.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id <> 80 AND (salary > 5000 OR commission_pct IS NOT NULL);

----------------------------------------------------------------------------------------------------


# String Comparasion
-- pattern matching tool

# LIKE -> given value ta ekta string e ache kina seta ccheck kore dei.

SELECT last_name, salary
FROM employees
WHERE last_name = 'King';

-- OR

SELECT last_name, salary
FROM employees
WHERE last_name LIKE 'King';

# % -> 0 or more character match kore   (NO restriction)
# _ -> exactly one character match kore

-- EX: 1st character K diye start and er pore 3 ta character thake.

SELECT last_name, salary
FROM employees
WHERE last_name LIKE 'K___';

-- EX: employes er last name er vitor e 'S' character ta ache.

SELECT last_name, salary
FROM employees
WHERE last_name LIKE '%s%';

SELECT last_name, salary
FROM employees
WHERE last_name LIKE '%son%';


SELECT last_name, salary
FROM employees
WHERE last_name LIKE '_____%';

----------------- Formating--------------

SELECT LOWER(last_name) FROM employees;
SELECT UPPER(last_name) FROM employees;


SELECT ROUND(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL;
 

SELECT commission_pct, TRUNCATE(commission_pct, 2)
FROM employees
WHERE commission_pct IS NOT NULL;


SELECT commission_pct, MOD(10, 3)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT commission_pct, MOD(10, 3)
FROM employees
WHERE commission_pct IS NOT NULL;

# Find number of weeks for each employee
SELECT datediff(sysdate(), hire_date) / 7 "Weeks Employeed."
FROM employees
WHERE department_id = 80;


# select first name of the employees whose last name starts with 'S' and ends with 'n'.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'S%n';

# select names of the employees from the sales dept whose last name do not contain the letter 's'.
SELECT first_name, last_name
FROM employees
WHERE department_id = 80 && last_name NOT LIKE'%s%';

# select full names of the employees whose joining date is in 1999.
SELECT concat(first_name, ' ', last_name) 'full name'
FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '1999-12-31';

# select all locations in the following countries: Canada, United Kingdom, Germany.
SELECT location_id
FROM locations
WHERE country_id IN ('CA', 'UK', 'DE');

# select the names of the employees whose job type is 'AD_PRES' and whose salary is at 15000.
SELECT first_name + " " + last_name 'full name'
FROM employees
WHERE (job_id = 'AD_PRES' AND salary = '15000');

