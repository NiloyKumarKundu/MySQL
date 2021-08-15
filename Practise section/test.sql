CREATE DATABASE IF NOT EXISTS practise;
USE practise;

CREATE TABLE IF NOT EXISTS table1 (
    colA INT,
    colB VARCHAR(40),
    colC DATETIME DEFAULT '2020-01-01 00:00:00',

    foreign_colA INT,
    foreign_colP VARCHAR(30),
    CONSTRAINT pk1 PRIMARY KEY(colA),
    CONSTRAINT fk1 FOREIGN KEY(foreign_colA) REFERENCES table1(colA) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS table2 (
    colP VARCHAR(30),
    colQ CHAR(10),
    colR DOUBLE NOT NULL,
    foreign_colA INT,

    CONSTRAINT pk2 PRIMARY KEY(colP),
    CONSTRAINT uq UNIQUE(colQ),
    CONSTRAINT fk2 FOREIGN KEY(foreign_colA) REFERENCES table1(colA) ON DELETE CASCADE
);

ALTER TABLE table1
ADD CONSTRAINT fk3 FOREIGN KEY(foreign_colP) REFERENCES table2(colP) ON DELETE CASCADE;


/* hr_schema */
/* Basic Search Operation */

SELECT *
FROM countries;

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM job_history;


/* LIKE / NOT LIKE */


SELECT *
FROM employees
WHERE first_name LIKE "s%";


SELECT *
FROM employees
WHERE first_name NOT LIKE "s%";


SELECT *
FROM employees
WHERE first_name LIKE "%a";


SELECT *
FROM employees
WHERE first_name LIKE "%da%";


SELECT *
FROM employees
WHERE first_name LIKE "s%a";

SELECT *
FROM employees
WHERE first_name LIKE "s%" OR first_name LIKE "m%";


SELECT *
FROM employees
WHERE first_name LIKE "%o%a%";

SELECT *
FROM employees
WHERE first_name LIKE "___";


SELECT *
FROM employees
WHERE first_name LIKE "___%";


SELECT *
FROM employees
WHERE first_name LIKE "%a_";



/* IN() / NOT IN( ) / OR, || */

SELECT *
FROM countries
WHERE country_id IN("AU", "BR", "CN", "JP");

SELECT *
FROM departments
WHERE manager_id NOT IN(204, 100, 145);

SELECT *
FROM employees
WHERE job_id IN("ST_MAN", "IT_PROG");


/* BETWEEN ... AND... / NOT BETWEEN ... AND ... / AND, && */

SELECT *
FROM departments
WHERE location_id BETWEEN 1000 AND 2000;

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;


SELECT *
FROM employees
WHERE hire_date BETWEEN "1987-01-01" AND "1987-06-30";

SELECT *
FROM employees
WHERE department_id NOT BETWEEN 50 AND 60;


SELECT *
FROM jobs
WHERE max_salary - min_salary BETWEEN 5000 AND 10000;

SELECT *
FROM job_history
WHERE end_date BETWEEN "1998-12-01" AND "1998-12-31";


/* ORDER BY clause */

SELECT first_name, last_name, email, hire_date, salary
FROM employees
ORDER BY salary DESC, first_name ASC;


SELECT employee_id, hire_date
FROM employees
ORDER BY hire_date ASC, department_id DESC;


SELECT first_name, email, phone_number
from employees
ORDER BY SUBSTRING(phone_number, 1, 3) DESC;

SELECT employee_id,
       email,
       YEAR(hire_date) AS "year",
       MONTH(hire_date) AS "month"
FROM employees
ORDER BY hire_date DESC;
