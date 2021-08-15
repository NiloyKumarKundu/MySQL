/* Full Table Data Read */
/* 
    SELECT * FROM table_name;

    * = all column
    default = all row

*/

SELECT * FROM employees;
SELECT * FROM job_history;

/*
    Reading specific column

    SELECT col1, col2, ....., coln
    FROM tableName;

    BY default : all row

*/


SELECT employee_id, department_id
FROM job_history;

SELECT col1, col2, col1 + col2          # we can do mathmatical calculation here.
FROM tableName;


/* 
    Show all the employees first_name, salary, commision_pct, total_salary form employees table
 */

 SELECT first_name, salary, commission_pct, (salary + (salary * commission_pct))
 FROM employees;



 /* Column Aliasing (Renaming) */

SELECT first_name AS new_column,
        salary, 
        commission_pct, 
        (salary + (salary * commission_pct)) AS 'New Column Name'
FROM employees;


SELECT first_name,
        salary, 
        commission_pct AS "Commission Parcentage", 
        (salary + (salary * commission_pct)) AS Total_Salary
 FROM employees;



/* Showing Distinct Data */

SELECT DISTINCT * | col1, col2, ......, coln 
FROM tableName;

/* 
    Show all the deparment_id form employees table
*/

SELECT department_id 
FROM departments;


SELECT DISTINCT department_id 
FROM departments;


/* Showing specific rows */
/* 
    SELECT *|col1, col2, col3, ..... coln
    FROM table_name
    WHERE condition;
*/



/* 
    Show all the employee details who receives salary greater than 15000
*/

SELECT *
FROM employees
WHERE salary > 15000;


/* 
    Show all the employee details who works in department number 50 or 90 or 100
*/

SELECT * 
FROM employees
WHERE department_id = 50 or department_id = 90 or department_id = 100;



/* 
    Show all the employee details whoes job type is 'IT_PROG'
*/

SELECT * 
FROM employees
WHERE job_id = 'IT_PROG';

/* 
    Show all the employee details who joined on or after 1990-01-01 in the company
*/

SELECT * 
FROM employees
WHERE hire_date >= '1990-01-01';


/* Showing Sorted Output */

SELECT *|col1, col2, ....., coln
FROM table_name, 
[WHERE condition],
ORDER BY column_name [ASC|DESC], column_name[ASC|DESC]

/* 
    Show all the employee details based on their salary value from lowest to height
*/

SELECT *
FROM employees
ORDER BY salary ASC;


/* 
    Show all the employees first_name, last_name, email in the alphabetical order of their first_name
*/

SELECT first_name, last_name, email
FROM employees
ORDER BY first_name ASC;


/* 
    Show all the employees details from senior to junior
*/

SELECT * 
FROM employees
ORDER BY hire_date ASC;


/* Multiple table sort */
/* 
 SELECT *
 FROM table_name
 ORDER BY col1[ASC], col2[DESC] 
*/



/* Limiting number of rows */


/* 
 SELECT *
 FROM table_name
 ORDER BY col1[ASC], col2[DESC] 
 LIMIT offset, rowcount;    (offset-> suru theke koto gulo row skip korbo, rowcount -> kotogulo row k consider korbo)
*/

/* 
    Show the top 3 senior most employee details
*/

SELECT * 
FROM employees
ORDER BY hire_date ASC
LIMIT 0, 3;


/* 
    Show the top 3 lowest salary holder from department_id 90 employee details
*/

SELECT *
FROM employees
WHERE department_id = 90
ORDER BY salary ASC
LIMIT 0, 3;


