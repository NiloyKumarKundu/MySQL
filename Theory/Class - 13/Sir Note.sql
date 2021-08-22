MySQL:
------

Subquery:
---------

1) Scalar Subquery:
-------------------
Subquery returns a scalar/constant value.

return type (1 row,1 col)

table
--------
col1    col2
-------------
1       abc
2       def
3       ghi

SELECT  col1, col2, (scalar subquery)
FROM    tablename
WHERE   col1>(scalar subquery)
GROUP BY    col1
HAVING COUNT(*)>(scalar subquery)


Example:
---------
/*
show all those employee details who receives higher salary than employee id 165.

Let, 165 employee id salary=x

show all those employee details who receives higher salary than x.

x: employee id 165 salary
---
SELECT	salary					#returns only 1 salary i.e. constant value
FROM	employees
WHERE	employee_id=165

*/

SELECT	*
FROM	employees
WHERE	salary>(
					SELECT	salary					
                    FROM	employees
                    WHERE	employee_id=165
				)

Example:
--------
/*
show all those employee details who receives higher salary than the maximum salary of department id 100.

Let, the maximum salary of department id 100=x

show all those employee detials who receives higher salary than x.

x: the maximum salary of department id 100 i.e. department_id=100
--
SELECT 	MAX(salary)			#will return only 1 maximum value
FROM	employees
WHERE	department_id=100

*/

SELECT	first_name, salary,
							(
                                SELECT 	MAX(salary)			
                                FROM	employees
                                WHERE	department_id=100
                            ) AS 'dept 100 max salary'
FROM	employees
WHERE	salary>(
					SELECT 	MAX(salary)			
                    FROM	employees
                    WHERE	department_id=100
				)
                
Example:
--------
/*
show all those employee details 
who works in the same department as employee id 110 works and 
who also works in the same job type as employee id 160 works.

Let, 110 employee deparment id=x
	 160 employee job id = y
     
show all those employee details who works in department id x and whose job type is y.

x: 110 employee department id
--
SELECT 	department_id
FROM	employees
WHERE	employee_id=110

y: 160 employee job id
--
SELECT 	job_id
FROM	employees
WHERE	employee_id=160
*/

SELECT	first_name, department_id, job_id,
							(
                                SELECT 	department_id
                                FROM	employees
                                WHERE	employee_id=110
                            )	AS '110 employee department id',
                            
                            (
                                SELECT 	job_id
                                FROM	employees
                                WHERE	employee_id=160
                            )   AS '160 employee job id'
                            
FROM	employees
WHERE	department_id=(
							SELECT 	department_id
                            FROM	employees
                            WHERE	employee_id=110
						)
		AND
        job_id=(
        			SELECT 	job_id
                    FROM	employees
                    WHERE	employee_id=160
        		)
   
Example:
--------
/*
Show all those employee details who receives the highest salary.

#do not use LIMIT clause because it can't detect repeated value
#only use subquery

TABLE
------
col1	col2
-------------
abc		1000
def		2000
ghi		2000


Let, highest salary = x

Show all those employee details whose salary is x.

x: the highest salary
---
SELECT	MAX(salary)
FROM	employees

*/

SELECT	*
FROM	employees
WHERE	salary=(
					SELECT	MAX(salary)
					FROM	employees
				)
   
                
2) Column Subquery:
--------------------
Subquery will return a single column (multiple row)

Extra 2 operator:
------------------
ANY
ALL

SELECT
FROM    
WHERE   salary> ALL (column subquery: 10,20,30,40,50)
        35                             T, T, T, F, F
         
Example:
--------
/*
Show all those employee details whose salary is equal to the maximum salary of either department number 30/50/90/100.

Let, the maximum salary of deparment number 30,50,90,100=(x,y,z,w)

Show all those employee details whose salary is equal to either (x,y,z,w)

(x,y,z,w):
-----------
SELECT	MAX(salary)
FROM	employees
WHERE	department_id IN(30,50,90,100)
GROUP BY department_id

*/

SELECT	*
FROM	employees
WHERE	salary= ANY (
							SELECT	MAX(salary)
                            FROM	employees
                            WHERE	department_id IN(30,50,90,100)
                            GROUP BY department_id
						)
                        
Example:
--------
/*
Show all those employee details whose salary is higher than all the maximum salary of department number 30/50/60.

Let, the maximum salary of deparment number 30,50,60=(x,y,z,w)

Show all those employee details whose salary is higher than all the (x,y,z,w)

(x,y,z,w):
-----------
SELECT	MAX(salary)
FROM	employees
WHERE	department_id IN(30,50,60)
GROUP BY department_id

*/

SELECT	*
FROM	employees
WHERE	salary> ALL (
							SELECT	MAX(salary)
                            FROM	employees
                            WHERE	department_id IN(30,50,60)
                            GROUP BY department_id
						)
                        
                        
3) Row subquery:
----------------
Subquery returns a single row (multiple column)

Example:
---------
/*
Show all those employee details who works in the same deparment and same job type as employee id 110.

did,jid:
--------
SELECT	department_id AS did, job_id AS jid
FROM	employees
WHERE	employee_id=110

*/

SELECT	*
FROM	employees
WHERE	(department_id, job_id) = (
                                    SELECT	department_id AS did, job_id AS jid
                                    FROM	employees
                                    WHERE	employee_id=110
									)
                                    
Example:
--------
/*
Show all those employee details who receives the highest salary in his own department.

did		max_sal
---------------
1		2000 - F
2		5000 - F
3		3000 - T
4		6000 - F

SELECT	department_id AS did,	MAX(salary) AS max_sal
FROM	employees
GROUP BY department_id

[(did=1,salary=1500),(did=3,salary=3000)]

*/

SELECT	*
FROM	employees
WHERE	(department_id, salary)= ANY (
									SELECT	department_id AS did,	MAX(salary) AS max_sal
                                    FROM	employees
                                    GROUP BY department_id
									)
                                    
                                    
4) Derived Table:
------------------
/*
SELECT	...
FROM	(select query - multiple row, multiple column) AS derived_table
WHERE 	...

Aggregate fn: max, sum, min, avg, count; can't be nested
max(avg()) - x, error

Single row fn: concat, abs, left, substr, date, month etc. etc. can be nested 

SELECT	CONCAT(
			LEFT( LPAD() ),
            ...
            ...
		)


Find out the maximum average salary of any department.

dtable
-------
did 	d_avg
--------------
1		100
2		20.5
3		30.67

*/
SELECT	MAX(d_avg) AS 'maximum average salary of any department'
FROM 	(
            SELECT	department_id AS did, AVG(salary) AS d_avg
            FROM	employees
            GROUP BY department_id
    	) AS dtable
        




