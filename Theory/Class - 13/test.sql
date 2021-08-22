# SubQuery:
/* Vitor er query gulo sob select query hote hobe. ekdom sobar baire jeta oita j kono query holei hobe */

# Derived and schelar subquerry sob theke besi use hoi;



/* 

    Subquery Operations:

    -> Scalar Subquery
        -> returns a scalar/constant value
        -> return type (1 row, 1 column)
        -> constant value joto jagai lekha jai, sob jagai scalar subquery lekha jabe

        Example:
        --------
        SELECT col1, col2, 10       // 10 er place e scalar subquery lekha jabe
        FROM tablename
        WHERE col1 > 100            // 100 er place e scalar subquery lekha jabe
        GROUP BY col1
        HAVING COUNT(*) > 8         // 8 er place e scalar subquery lekha jabe

        Questions:
        ----------
        Show all those employee details who receives heigher salary than employee id 165

            let, employee id 165 = x
            Show all those employee details who receives heigher salary than x.

            x: employee id 165 salary
            -------------------------
            SELECT salary       // returns only 1 salary
            FROM employees
            WHERE employee_id = 165

            SELECT *
            FROM employess
            WHERE salary > x


        Questions:
        ----------
        Show all those employee details who receives heigher salary than the maximum salary of department id 100

        let, the maximum salary of department id = x
        Show all those employee details who receives heigher salary than x

        x: the maximum salary of department id 100

        SELECT MAX(salary)
        FROM employees
        WHERE department_id = 100

        SELECT *
        FROM employees
        WHERE salary > x


        Questions:
        ----------
        Show all those employee details who works in the same department as employee id 110 works and who also works in the same job type as employee id 160 works.

        let, 110 employee id department id = x
        160 employee job id = y

        Show all those employee details who works in department id x and whoes job type is y.

        x: 110 employee department_id 
        ------------------------------
        SELECT department_id
        FROM employees
        WHERE employee_id = 110


        y: 160 employee job id
        -----------------------
        SELECT job_id
        FROM employees
        WHERE employee_id = 160


        SELECT  *
        FROM    employees 
        WHERE   department_id = x
                AND
                job_id = y


        Questions:
        ----------
        
        # Show all the employee details who receives the height salary.

        # do not use LIMIT clause because it can't detect repeated value, only use subquery

        let, height salary = x
        # Show all the employee details whoes salary is x.

        x: the height salary
        ---------------------

        SELECT MAX(salary)
        FROM employees

        SELECT  *
        FROM    employees
        WHERE salary = x





    -> Column Subquery
        -> Return a single column (multiple row)
        
        Extra 2 operator:
        -----------------
        ANY -> j kono ektar sathe condition true pele true return korbe (or operator er moto)
        ALL -> sob gulor sathe condition true hote hobe. tobei true return korbe

        USAGES:
        -------
        column subquery chalanor age.

        
        Questions:
        ----------

        # Show all those employee details whoes salary is equal to the maximum salary of either department number 30/50/90/100.

        let, the maximum salary of department number 30, 50, 90, 100 = (x, y, z, w)

        # Show all those employee details whoes salary is equal to either (x, y, z, w)


        (x, y, z, w):
        --------------
        SELECT  MAX(salary)
        FROM    employees
        WHERE   department_id IN(x, y, z, w)
        GROUP BY department_id

        SHOW *
        FROM employees
        WHERE salary = ANY (x, y, z, w)


        Questions:
        ----------

        # Show all those employee details whoes salary is higher than all the maximum salary of department number 30/50/60.

        let, the maximum salary of department number 30, 50, 60 = (x, y, z)

        # Show all those employee details whoes salary is heigher than all the (x, y, z)

        (x, y, z):
        --------------
        SELECT  MAX(salary)
        FROM    employees
        WHERE   department_id IN(x, y, z)
        GROUP BY department_id

        SHOW *
        FROM employees
        WHERE salary > ALL (x, y, z)


    -> Row Subquery
        -> Return a single row (multiple column)

        Questions:
        ----------

        # Show all those employee details who works in the same department and same job type as employee id 110.

        did, jid:
        --------
        SELECT  department_id   AS  did,
                job_id  AS jid
        FROM employees
        WHERE employee_id = 110

        SELECT  *
        FROM    employees
        WHERE   (department_id, job_id) = (
            SELECT  department_id   AS  did
                job_id  AS jid
            FROM employees
            WHERE employee_id = 110
        )

         Questions:
        ----------
        
        # Show all the employee details who receives the height salary in his own department.


        let, height salary = x
        # Show all the employee details whoes salary is x.

        x: the height salary
        ---------------------
        SELECT  department_id AS did,
                MAX(salary) AS max_sal
        FROM    employees
        GROUP BY department_id


        SELECT  *
        FROM employees
        WHERE (department_id, salary) = x


    -> Correlated Subquery



    -> Derived Subquery
        -> Emon ekta table theke data derive kora lagbe, jei table er ostitto amader kache nei
        -> Table er place e query likhi
        -> Return multiple row, multiple column

        Example:
        --------
        SELECT  .....
        FROM    (select query - multiple row, multiple column) AS newTableName 
        WHERE   ......

        Aggregate fn: max, sum, min, avg, count; can't be nexted
        Single row fn: concat, abs, left, substr, date, month etc. can be nested


        Questions:
        ----------
        # Find out the maximum average salary from any department

        SELECT  department_id AS did,
                AVG(salary) AS d_avg
        FROM    employees
        GROUP BY department_id

        ANS:
        ----
        SELECT  MAX(d_avg)
        FROM (
            SELECT  department_id AS did,
                AVG(salary) AS d_avg
            FROM    employees 
            GROUP BY department_id
        )   AS dtable



 */


/* Scalar Subquery */

/* Show all those employee details who receives heigher salary than employee id 165 */

SELECT  *
FROM employees
WHERE salary > (
    SELECT  salary
    FROM employees
    WHERE employee_id = 165
)

/* Show all those employee details who receives heigher salary than the maximum salary of department id 100 */

SELECT  *
FROM employees
WHERE salary > (
    SELECT  MAX(salary)
    FROM employees
    WHERE department_id = 100
)


SELECT  first_name,
        salary,
        (
            SELECT  MAX(salary)
            FROM employees
            WHERE department_id = 100
        )   AS 'dept_100_max_salary'
FROM employees
WHERE salary > (
    SELECT  MAX(salary)
    FROM employees
    WHERE department_id = 100
)



/* Show all those employee details who works in the same department as employee id 110 works and who also works in the same job type as employee id 160 works. */

SELECT  first_name,
        department_id,
        job_id,
        (
            SELECT  department_id
            FROM    employees
            WHERE   employee_id = 110
        )   AS  '110_employee_department_id',
        (
            SELECT  job_id
            FROM    employees
            WHERE   employee_id = 160
        )   AS  '160_employee_job_id'
FROM    employees
WHERE   department_id = (
            SELECT  department_id
            FROM    employees
            WHERE   employee_id = 110
        )      
        AND 
        job_id = (
            SELECT  job_id
            FROM    employees
            WHERE   employee_id = 160
        )


# Show all the employee details who receives the height salary.


SELECT  *
FROM employees
WHERE salary = (
    SELECT  MAX(salary)
    FROM employees
)






/* -> Column Subquery */

/* Show all those employee details whoes salary is equal to the maximum salary of either department number 30/50/90/100. */

SELECT  *
FROM    employees
WHERE   salary = ANY (
            SELECT  MAX(salary)
            FROM employees
            WHERE department_id IN (30, 50, 90, 100)
            GROUP BY  department_id
        )

/* Show all those employee details whoes salary is higher than all the maximum salary of department number 30/50/60. */

SELECT  *
FROM    employees
WHERE   salary > ALL (
            SELECT  MAX(salary)
            FROM employees
            WHERE department_id IN (30, 50, 60)
            GROUP BY  department_id
        )



/* Show all those employee details who works in the same department and same job type as employee id 110. */

SELECT  *
FROM    employees
WHERE   (department_id, job_id) = (
    SELECT  department_id   AS  did,
        job_id  AS jid
    FROM employees
    WHERE employee_id = 110
)



/* Show all the employee details who receives the height salary in his own department. */

/* ************************ SPECIAL CASE ****************************** */

SELECT  *
FROM employees
WHERE (department_id, salary) = ANY (
    SELECT  department_id AS did,
    MAX(salary) AS max_sal
    FROM employees
    GROUP BY  department_id
)


/* -> Derived Subquery */

Questions:
----------
# Find out the maximum average salary from any department

SELECT  MAX(d_avg)  AS 'maximum_average_salary_of_any_department'
FROM (
    SELECT  department_id AS did,
        AVG(salary) AS d_avg
    FROM    employees 
    GROUP BY department_id
)   AS dtable