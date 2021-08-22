MySQL:
------

JOIN practice:
--------------

/* 
show the employee first name and his manager first name 

employees-myself					employees-manager
----------							----------
id	name	manager_id				id	name	manager_id
----------------------				-----------------------
1	abc		3						1	abc		3
2	ghi		5						2	ghi		5
3	def		2						3	def		2
4	jkl		4						4	jkl		4
5	mno		NULL					5 	mno		NULl	
*/

SELECT 	myself.first_name,
		manager.first_name

FROM	employees AS myself

		JOIN
        employees AS manager
        ON myself.manager_id=manager.employee_id


/* 
show the employee first name, his manager first name, his manager's manager name. 

employees-myself					employees-manager				employees-manofman
----------							----------						-------------------
id	name	manager_id				id	name	manager_id			id	name	manager_id
----------------------				-----------------------			----------------------
1	abc		3						1	abc		3					1	abc		3
2	ghi		5						2	ghi		5					2	ghi		5
3	def		2						3	def		2					3 	def		2
4	jkl		4						4	jkl		4					4 	jkl		4	
5	mno		NULL					5 	mno		NULL				5 	mno		NULL
*/

SELECT 	myself.first_name,
		manager.first_name,
        manofman.first_name

FROM	employees AS myself

		JOIN
        employees AS manager
        ON myself.manager_id=manager.employee_id
        
        JOIN 
        employees AS manofman
        ON manager.manager_id=manofman.employee_id
        
        
/* 
show the manager first name who manages more than 5 employees

employees-myself					employees-manager				
----------							----------						
id	name	manager_id				id	name	manager_id			
----------------------				-----------------------			
1	abc		3						1	abc		3					
2	ghi		5						2	ghi		5					
3	def		2						3	def		2					
4	jkl		4						4	jkl		4					
5	mno		NULL					5 	mno		NULL
6	xyz		2						6 	xyz		2	

Output:
-------
id	name	manager_id		-  	id 	name	manager_id
------------------------------------------------------
1	abc		3					(3	def)		2
2 	ghi		5					(5 	mno)		NULL
3	def		2					(2	ghi)		5
4	jkl		4					(4	jkl)		4
6	xyz		2					(2	ghi)		5

COUNT(*)>5
*/

SELECT 	manager.first_name,
		COUNT(*)

FROM	employees AS myself

		JOIN
        employees AS manager
        ON myself.manager_id=manager.employee_id
        
GROUP BY manager.employee_id, manager.first_name
HAVING 	COUNT(*)>5

---------------------------------------------------------------------------------------

/* Show all those employee info who have joined the year from 1990 to 2000 inclusive */

SELECT	*
FROM	employees
#WHERE 	hire_date>='1990-01-01' AND hire_date<='2000-12-31'
WHERE	hire_date BETWEEN '1990-01-01' AND '2000-12-31'


/* Show all those employee info who either works in department id 90/50/110 */

SELECT	*
FROM	employees
#WHERE	department_id=90 || department_id=50 || department_id=110
WHERE	department_id IN (90,50,110)

/*
string exact match: = operator, for example: WHERE	colname = 'messi'
													messia

string pattern match: LIKE opeartor.
						% = 0 to infinite characters
                        _ = exactly 1 character

1) name starts with m. WHERE name='mobin' || name="mobarak" || name="mahi"
WHERE firstname LIKE 'm%'

2) ends with m
WHERE firstname LIKE '%m'

3) contains m
WHERE firstname LIKE '%m%'

4) name contains exactly 3 characters
WHERE firstname LIKE '_ _ _'

5) name contains at least 3 characters
WHERE firstname LIKE '_ _ _%'

*/

SELECT 	*
FROM 	employees
WHERE 	(first_name LIKE 'L%') IS TRUE

/*
5+10*NULL -> NULL

10>NULL   -> NULL (false)

Show all those employee data who receive any commission.
*/

SELECT	*
FROM	employees
WHERE 	commission_pct IS NOT NULL

/*
COALESCE(val1=10,val2,val3,...) - first not null value = 10
COALESCE(val1=NULL,val2=10,val3,...) - first not null value = 10
COALESCE(val1=NULL,val2=NULL,val3=30,...) - first not null value = 30
*/

SELECT	employee_id,
		salary+salary*COALESCE(commission_pct, 0) AS 'total salary'
FROM	employees

/*
show all those employee info whose first name is a palindrome.

madam

WHERE	first_name=REVERSE(first_name)

*/

SELECT	*
FROM	employees
WHERE 	first_name=REVERSE(first_name)

/*
show the full name of all employess.
full name format: first_name <space> last_name

*/

SELECT	CONCAT(first_name,' ',last_name) AS 'Full Name'
        
FROM	employees

/*
show all the employees first name and his phone number in the following format.

format:

first 3 characters of his phone number
followed by 5 *
followed by last 2 characters

*/

SELECT	CONCAT(
			LEFT(phone_number,3),
			'*****',
        	RIGHT(phone_number,2)
        ) AS 'formatted phone number'
        
FROM	employees

/*
show all the employees first name and his salary in the following format:

format:

xxxx thousand yyy hundreds zz taka only.

12345 DIV 1000 = 12, LPAD(12,4,'0')
12345 % 1000   = 345

(12345 % 1000) DIV 100 = 3, LPAD(3,3,'0')
12345 % 100   = 45, LPAD(45,2,'0')

*/

SELECT	first_name,
		CONCAT(	
			LPAD(salary DIV 1000, 4, '0'),
            'thousand',
            LPAD( (salary % 1000) DIV 100, 3,'0'),
            'hundred',
            LPAD(salary % 100, 2, '0'),
            'taka only'
        ) AS 'formatted salary'
        
FROM	employees

/*
Show all the employees first_name and total number of days he is serving the company.

*/

SELECT	first_name,
		DATEDIFF(NOW(), hire_date) DIV 30 AS 'No of months'
        
FROM	employees






