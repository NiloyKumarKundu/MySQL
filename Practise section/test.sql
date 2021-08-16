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


SELECT *
FROM job_history
ORDER BY start_date ASC, end_date DESC;


SELECT *
FROM jobs
ORDER BY (max_salary - min_salary) DESC;



-- DISTINCT clause
SELECT  DISTINCT manager_id
FROM    employees;


SELECT  DISTINCT job_id
FROM    employees;


SELECT  DISTINCT country_id
FROM    locations;


SELECT  DISTINCT job_id, department_id
FROM    employees;



-- Aggregate Operations (GROUP BY, HAVING clauses)

SELECT  COUNT(employee_id) AS 'total no of employees',
        SUM(salary) AS 'total salary',
        AVG(salary) AS 'average salary',
        MAX(salary) AS 'maximum salary'

FROM    employees;


SELECT  MAX(hire_date), MIN(hire_date)
FROM    employees;

SELECT  MAX(hire_date)
FROM    employees
WHERE   department_id = 50;


SELECT  COUNT(department_id)
FROM    departments
WHERE   location_id = 1700;


SELECT      end_date
FROM        job_history
WHERE       department_id = 80
ORDER BY    end_date DESC
LIMIT       0, 1;


SELECT  MAX(min_salary), MIN(min_salary), MAX(max_salary), MIN(max_salary)
FROM    jobs;


SELECT  COUNT(employee_id)
FROM    employees
WHERE   manager_id = 114;


SELECT  COUNT(DISTINCT job_id)
FROM    employees;


SELECT  COUNT(DISTINCT country_id)
FROM    locations;


SELECT  COUNT(DISTINCT location_id)
FROM    locations
WHERE   country_id = "US";




-- CT - 2 (Even) 

CREATE DATABASE IF NOT EXISTS medical_appointment_system;
USE medical_appointment_system;

CREATE TABLE IF NOT EXISTS Doctor (
    license_no VARCHAR(40),
    name VARCHAR(40), 
    email VARCHAR(40),
    contact_no VARCHAR(40),
    type    VARCHAR(40),
    Fee     DOUBLE

    CONSTRAINT PK PRIMARY KEY(license_no);
)




SELECT  YEAR(a.start_time),  SUM(d.fee)
FROM    appointment AS a
        JOIN 
        doctor AS d
        ON a.doctor_id = d.lisence_no

GROUP BY YEAR(a.start_time), a.patient_id
ORDER BY AVG(d.fee) DESC;



-- Exam

SELECT  description
FROM    question
WHERE   category LIKE "cse" OR "eee" 
GROUP BY diff_level, description
HAVING diff_level >= 2; 


SELECT  COUNT(id) AS "total no of exams"
FROM    exam
WHERE exam_taker NOT LIKE "UIU";



SELECT  myself.id, 
        COUNT(other.id) AS "total no of other exams"
FROM    exam myself
        JOIN
        exam other
        ON myself.id = other.id
WHERE   other.exam_date_time < myself.exam_date_time
GROUP BY myself.exam_taker, other.exam_taker, myself.id, other.id
HAVING  myself.exam_taker = other.exam_taker;



SELECT  COUNT(ques.id)
FROM    question AS q
        JOIN 
        ques_exam AS qe
        on q.id = qe.ques_id

        JOIN
        exam AS e
        ON qe.exam_id = e.id

WHERE YEAR(e.exam_date_time) = 2020
GROUP BY e.id, q.id
ORDER BY COUNT(q.id) DESC
LIMIT 0, 3;

