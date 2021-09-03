/* Find the full names (first_name<space>last_name) of those employees who are not
managers. */

SELECT 	employee_id
FROM employees
EXCEPT  (
        SELECT manager_id
        FROM employees
    )  


SELECT  CONCAT(first_name, " ", last_name) AS "full name"
FROM    employees
WHERE    employee_id = ANY (
            SELECT 	employee_id
            FROM employees
            EXCEPT  (
                        SELECT manager_id
                        FROM employees
                    )  
        )



/* Display those department names which have the highest number of employees in
service. */


SELECT department_id, COUNT(department_id) AS dcnt
FROM    employees
GROUP BY department_id


SELECT  MAX(dcnt)
FROM    (
            SELECT COUNT(department_id) AS dcnt
            FROM    employees
            GROUP BY department_id
        )   AS dtable



SELECT  department_id 
FROM    employees
GROUP BY department_id
HAVING COUNT(department_id) =  (
                                    SELECT  MAX(dcnt)
                                    FROM    (
                                                SELECT COUNT(department_id) AS dcnt
                                                FROM    employees
                                                GROUP BY department_id
                                            )   AS dtable
                                )                   


/* Solution */

SELECT  department_name
FROM    departments
WHERE   department_id = (
            SELECT  department_id
            FROM    employees
            GROUP BY department_id
            HAVING COUNT(department_id) =  (
                    SELECT  MAX(dcnt)
                    FROM    (
                                SELECT COUNT(department_id) AS dcnt
                                FROM    employees
                                GROUP BY department_id
                    )   AS dtable
                )              
        )





/* 
    For each employee, find the minimum and maximum salary of his/her department using
    sub-query. Print last name, minimum salary and maximum salary. In this problem, use
    sub-query in FROM clause (Not in WHERE clause)
 */



SELECT      department_id, MIN(salary) AS "minimun salary", MAX(salary) AS "maximum salary"
FROM        employees
GROUP BY    department_id


/* Solution */
SELECT  e.last_name, minimun_salary, maximum_salary
FROM    (
        SELECT      department_id AS d, MIN(salary) AS "minimun_salary", MAX(salary) AS "maximum_salary"
        FROM        employees
        GROUP BY    department_id
    )   AS dtable
    JOIN 
    employees e
    ON e.department_id = dtable.d





/* 
    Find those departments whose average salary is greater than the minimum salary of all
    other departments. Print department names.
*/

SELECT      AVG(salary)
FROM        employees
GROUP BY    department_id



SELECT      department_id
FROM        employees
GROUP BY    department_id
HAVING      AVG(salary) > ALL (
        SELECT      MIN(salary)
        FROM        employees
        GROUP BY    department_id
    )


SELECT  department_name AS "department name"
FROM    departments
WHERE   department_id = (
            SELECT      department_id
            FROM        employees
            GROUP BY    department_id
            HAVING      AVG(salary) > ALL (
                    SELECT      MIN(salary)
                    FROM        employees
                    GROUP BY    department_id
                )
        )