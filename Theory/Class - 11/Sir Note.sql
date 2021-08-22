MySQL:
--------

Aggregate Function/Groupwise Function:
--------------------------------------

SUM(colname)
MIN()
MAX()
AVG()
COUNT()


table1
-------
col1    col2
------------
10      100
20      200
30      300
40      400

SUM(col2)=100+200+300+400=
MIN(col2)=100
MAX(col2)=400
AVG(col2)=(100+200+300+400)/4=
COUNT(col2)=4

output no of rows = no of groups

------------------------------------------------

table1
-------
col1    col2   col1+col2
------------
10      100   = 110
20      100   = 120
NULL    400   = NULL
40      400   = 440

SELECT  COUNT(*), SUM(col2), MIN(col2), MAX(col2), AVG(col2), SUM(DISTINCT col2)
FROM    table1;

default = all row
default = full table 1 group (you can't call individual columns)

Output:
--------

COUNT(col1) SUM(col2)   MIN(col2)   MAX(col2)   AVG(col2)   SUM(DISTINCT col2)
------------------------------------------------------------------------------
4           1000        100         400         250             500

SELECT  SUM(col2), MAX(col1+col2), col1 x
FROM table;

Output:
--------
SUM(col2)   MAX(col1+col2)   col1(invalid operation)
---------------------------
1000        440             garbage value, 10/20/NULL/40


------------------------------------------------------------------------------


Group formation:
-----------------

SELECT 
FROM    tablename
[WHERE  condition]

GROUP BY colname, col1+col2, ... ... 

[ORDER BY col1 ASC|DESC, col2 ASC|DESC, ... ...]
[LIMIT  offset, rowcount];


table1
-------
col1    col2   col1%3
------------
10      100     1  ---- G1
20      200     2  ----------G2
30      300     0  ---------------G3
40      400     1  ---- x -------------------- col1!=40
50      500     2  ----------G2
60      600     0  ---------------G3

SELECT  COUNT(*), SUM(col2), MAX(col1), col1%3
FROM    table1
WHERE   col1!=40
GROUP BY col1%3

(you can't use individual rows after grouping)
(you can't call individual columns after grouping, you must use aggregate functions for different columns)


Output:
-------
    COUNT(*)    SUM(col2)   MAX(col1)       col1%3
---------------------------------------------------
G1-  1          100         10               1
G2-  2          700         50               2             
G3-  2          900         60               0


table2
-------
col1        col2        col3
-----------------------------
abc         10          100     --- G1
abc         20          200     --- G1
def         30          300     ------ G2
ghi         40          400     ---------- G3
def         50          500     ------ G2
abc         10          300     --- G1
def         50          400     ------ G2
ghi         40          1000    ---------- G3


SELECT  COUNT(*), SUM(col3), col1
FROM    table2

GROUP BY    col1;

OUTPUT:
-------
    COUNT(*)        SUM(col3)       col1
-----------------------------------------
G1-  3              600             abc
G2-  3              1200            def
G3-  2              1400            ghi


table2
-------
col1        col2        col3
-----------------------------
abc         10          100      ---- G1  
abc         20          200      ------- G2
def         30          300      ---------- x
ghi         40          400      ---------------G4
def         50          500      --------------------G5
abc         10          300      ---- G1 
def         50          400      --------------------G5
ghi         40          1000     ---------------G4

SELECT      COUNT(*), SUM(col3), col1, col2
FROM        table2
WHERE       col1!=def and col2!=30   #single column condition WHERE
GROUP BY    col1, col2
HAVING      SUM(col3)>500            #aggregate function condition HAVING

Output:
-------
    COUNT(*)    SUM(col3)   col1    col2
----------------------------------------
G1- 2           400         abc     10     - x
G2- 1           200         abc     20     - x

G4- 2           1400        ghi     40  
G5- 2           900         def     50  




condition: COUNT(*)>5 -- having

hire_date>'2021-01-01' -- where


--------------------------------------------------------------------------

/*count department wise employee number*/

SELECT		COUNT(*) AS 'department wise employee count',
			department_id
            
FROM		employees

GROUP BY 	department_id

/*count total number of employees joined per year and their total salary value */
/*
2021-01-01  -- g1
2021-01-02  -- g2

2021  -- g1
2021  -- g1

*/

SELECT		COUNT(*) AS 'year wise employee count',
			SUM(salary),
			YEAR(hire_date)
            
FROM		employees

GROUP BY 	YEAR(hire_date)




dept_id             job_id
---------------------------
d1                  j1  - g1
d1                  j2  ------g2
d1                  j1  - g1
d1                  j2  ------g2
d1                  j2  ------g2

d2                  j3
d2                  j4
d2                  j4
d2                  j3
d2                  j3


/*
For each department and for each job type, count the total number of employees.
*/

SELECT		COUNT(*) AS 'year wise employee count',
			SUM(salary),
			department_id,
            job_id
            
FROM		employees

GROUP BY 	department_id, job_id;


/*
Count region wise total number of countries.
or,
For each region, count number of countries.
*/

SELECT		COUNT(*),
			region_id
            
FROM		countries

GROUP BY 	region_id





hire_date:
----------
(2018-01)-01    --->    g1
2018-02-01      -------------> g2      
(2018-01)-12    --->    g1   
2018-10-10
2018-02-10      -------------> g2

(2019-01)-01


YEAR(date), MONTH(date)



/*
For each year and each month, calculate the average salary of that year and that month.
*/

SELECT		AVG(salary),
			YEAR(hire_date), MONTH(hire_date)
            
FROM		employees

GROUP BY 	YEAR(hire_date), MONTH(hire_date)












