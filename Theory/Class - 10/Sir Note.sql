
MySQL:
------

Data Search:
-------------

1) Full table data read:
------------------------
    
    SELECT  *
    FROM    tablename;
    
    * = all column
    default = all row

    Example:
    --------
    SELECT 	*
    FROM 	job_history;
    
2) Reading specific columns:
-----------------------------

    SELECT  col10, col2, col5, ... coln
    FROM    tablename;
    
    default = all row
    
    Example:
    --------
    SELECT	employee_id,
            department_id
    FROM 	job_history;
    
    
    table1
    ------
    col1        col2
    -----------------
    10          100
    20          200
    30          150
    40          160
    
    SELECT  col1, col2, col1+col2, col1/10
    FROM    table1;
    
    Output(temporary view):
    ------------------------
    col1        col2    col1+col2   col1/10
    ----------------------------------------
    10          100     110         1
    20          200     220         2
    30          150     180         3    
    40          160     200         4
    
    
    /*show all the employees first_name, salary, commission_pct, total salary from employees table*/

    SELECT	first_name,
            salary,
            commission_pct,
            salary+(salary*commission_pct)

    FROM	employees;
    
    
3) Column aliasing (renaming):
-------------------------------

    SELECT  col1 AS new_colname,
            col2,
            col1+col2+col10 AS 'new colname' 
            
    FROM    tablename;
    
    
    Example:
    --------
    /*show all the employees first_name, salary, commission_pct, total salary from employees table*/

    SELECT	first_name,
            salary,
            commission_pct AS 'Commission Percentage',
            salary+(salary*commission_pct) AS Total_Salary

    FROM	employees;
    
    
4) Showing distinct data (no repeated data):
---------------------------------------------
    
    SELECT DISTINCT *|col1, col2, col3+col4 AS 'new colname', ...
    FROM            tablename;
    
    
    Table1
    ------
    col1        col2
    -----------------
    10          100
    20          200
    30          150
    40          160
    10          100
    10          120
    30          180
    40          160
    
    SELECT  col1, col2
    FROM    table1;
    
    output:
    -------
    col1        col2
    -----------------
    10          100
    20          200
    30          150
    40          160
    10          100
    10          120
    30          180
    40          160

    SELECT  DISTINCT    col1, col2
    FROM                table1;
    
    output:
    -------
    col1        col2
    -----------------
    10          100
    20          200
    30          150
    40          160
    10          120
    30          180
    
    SELECT  col1
    FROM    table1;
    
    default = all row
    
    output:
    -------
    col1
    ----
    10
    20
    30
    40
    10
    10
    30
    40
    
    SELECT DISTINCT  col1
    FROM             table1;
    
    default = all row
    
    output:
    -------
    col1
    ----
    10
    20
    30
    40
    
    /*show all the employees department_id from employees table*/

    SELECT	DISTINCT department_id
    FROM	employees;
    
    
5) Showing specific rows:
-------------------------

    SELECT [DISTINCT]   *|col1, col2, col3+col4 AS 'new colname', ...
    FROM                tablename
    WHERE               condition;

    Example:
    --------
    /* Show all the employee details who receives salary greater than 15000$ */

    SELECT	*
    FROM	employees
    WHERE 	salary>15000;
    
    /* Show all the employee details who works in department number 30 or, 90 or, 100 */

    SELECT	*
    FROM	employees
    WHERE 	department_id=30 OR department_id=90 OR department_id=100;
    
    /* Show all the employee details whose job type is 'IT_PROG' */

    SELECT	*
    FROM	employees
    WHERE 	job_id='IT_PROG';
    
    /* Show all the employee details who joined on or after 1990-01-01 in the company */

    SELECT	*
    FROM	employees
    WHERE 	hire_date>='1990-01-01'
    
6) Showing sorted output:
--------------------------

    SELECT  [DISTINCT]  *|col1, col2, col3+col4 AS 'new colname', ...
    FROM                tablename
    [WHERE              condition]
    ORDER BY            col1 [ASC|DESC], col3 [ASC|DESC], ... ...
    
    
    Example:
    --------
    /* Show all the employee details based on their salary value from lowest to highest */

    SELECT	*
    FROM	employees

    ORDER BY SALARY ASC;
    
    /* Show all the employees first_name, last_name, email in the alphabetical order of their first name */

    SELECT	first_name,
            last_name,
            email
    FROM	employees

    ORDER BY first_name ASC
    
    /* Show all the employees details from senior to junior */

    SELECT	*
    FROM	employees

    ORDER BY hire_date ASC;
    
    
    table1
    -------
    col1    col2    col3
    --------------------
    abc     10      100
    abc     20      200
    def     30      50
    ghi     40      300
    def     20      150
      
    jkl     99      999 - x
    
    
    SELECT  *
    FROM    table1
    WHERE   col1!='jkl'
    ORDER BY col1 DESC, col2 ASC;
    
    output:
    -------
    col1    col2    col3
    ---------------------
    ghi     40      300
    
    def     20      150
    def     30      50
    
    abc     10      100
    abc     20      200
    
    
7)  Limiting number of rows:
-----------------------------
    - when you need to show some specific rows
    - when you can't row filter using WHERE clause
    
    - first 3 seniormost employee details
    - the 4th senior most joined on 1990-01-03
    
    SELECT  *
    FROM    employees
    WHERE   hire_date<1990-01-03 
    
    (wrong approach)
    
    
    Syntax:
    -------
    SELECT  [DISTINCT]  *|col1, col2, col3+col4 AS 'new colname', ...
    FROM                tablename
    [WHERE              condition]
    [ORDER BY           col1 [ASC|DESC], col3 [ASC|DESC], ... ...]
    LIMIT               offset, row_count;
    
    
    /* Show the top 3 senior most employee details */

    SELECT	*
    FROM	employees

    ORDER BY hire_date ASC
    LIMIT	0, 3
    
    /* Show the top 3 lowest salary holder employee details */

    SELECT	*
    FROM	employees

    ORDER BY salary ASC
    LIMIT	0, 3
    
    /* Show the top 3 lowest salary holder from department id 90 employee details */

    SELECT	*
    FROM	employees
    WHERE 	department_id=90
    ORDER BY salary ASC
    LIMIT	0, 3
    
    /* Show the 5th highest salary holder employee details */

    SELECT	*
    FROM	employees

    ORDER BY salary DESC
    LIMIT	4, 1
    
    
        
    
    