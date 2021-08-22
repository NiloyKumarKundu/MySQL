CT Monday 
- 09:00 AM

Syllabus
- MySQL DDL, Basic SELECT, Aggregate, JOIN 
(upto today's lecture)

Extra Class (no attendance)
- Saturday# 07:00PM

Saturday other section: 09:00 AM

-------------------------------------------------

MySQL:
-------

SELECT      col1, col2, col3+col4, ...
FROM        tablename


JOIN operation:
----------------

table1 AS t1     
------
col1    col2
------------
1       abc
2       def
3       ghi
4       jkl

table2 AS t2      
------
col3        col1    fk_col1
---------------------------
100         a       3 - x
200         b       2 - X
500         c       1 - X
600         d       2 - X
700         e       1 - X
800         f       NULL - x

* = all table all column
t1.*=table1 all column
t2.*=table2 all column
t1.col1=table1 col1

Show all the data from table1 and table2.

SELECT  *
FROM    table1 AS t1
        
        JOIN
        table2 AS t2
        ON t2.fk_col1=t1.col1

WHERE   t1.col2!='ghi' and t2.col1!='d'
GROUP BY t1.col1
[HAVING ...]
[ORDER BY ...]
[LIMIT ... ...]

Output:
-------
t1.col1    t1.col2   -    t2.col3    t2.col1    t2.fk_col1
------------------------------------------------------------
1           abc             500         c       1   ---------G1
1           abc             700         f       1   ---------G1

2           def             200         b       2   ----------------G2
2           def             600         d       2    - hide

3           ghi             100         a       3    - hide


table1 AS t1     
------
col1    col2
------------
1       abc
2       def 
3       ghi
4       jkl

table2 AS t2      
------
col3        col1    fk_col1
---------------------------
100         a       3 - ok
200         b       2 - ok
500         c       1 - ok
600         d       2 - ok
700         e       1 - ok
800         f       NULL - null(false) x

SELECT  *
FROM    table1 AS t1

        JOIN
        table2 AS t2
        ON t1.col1>t2.fk_col1
        
Output:
-------
t1.col1    t1.col2   -    t2.col3    t2.col1    t2.fk_col1
------------------------------------------------------------
2           def             500         c       1
2           def             700         e       1

3           ghi             200         b       2
3           ghi             500         c       1
3           ghi             600         d       2
3           ghi             700         e       1

4           jkl             100         a       3
4           jkl             200         b       2
4           jkl             500         c       1
4           jkl             600         d       2 
4           jkl             700         e       1


LEFT JOIN:
----------
table1 AS t1     
------
col1    col2
------------
1       abc
2       def
3       ghi
4       jkl - unused

table2 AS t2      
------
col3        col1    fk_col1
---------------------------
100         a       3 
200         b       2 
500         c       1 
600         d       2 
700         e       1 
800         f       NULL  - unused
 
 
SELECT  *
FROM    table1 AS t1    #left table
        
        LEFT JOIN       
        table2 AS t2    #right table
        ON t2.fk_col1=t1.col1
        
Output:
-------
t1.col1    t1.col2   -    t2.col3    t2.col1    t2.fk_col1
-----------------------------------------------------------
1           abc             500         c       1  
1           abc             700         f       1  

2           def             200         b       2  
2           def             600         d       2  

3           ghi             100         a       3  

4           jkl             NULL        NULL    NULL



Practice:
---------
/* show all the country name and corresponding region name */

SELECT	r.region_name,
		c.country_name
        
FROM	regions AS r
		
		JOIN
        countries AS c
        ON r.region_id=c.region_id
        
        
/* show all the city, corresponding country name and corresponding region name */

SELECT	r.region_name,
		c.country_name,
        l.city
        
FROM	regions AS r
		
		JOIN
        countries AS c
        ON r.region_id=c.region_id
        
        JOIN
        locations AS l
        ON	l.country_id=c.country_id
        
/* show all the deparmtent name, corresponding city name, corresponding country name and corresponding region name */

SELECT	r.region_name,
		c.country_name,
        l.city,
        d.department_name
        
FROM	regions AS r
		
		JOIN
        countries AS c
        ON r.region_id=c.region_id
        
        JOIN
        locations AS l
        ON	l.country_id=c.country_id
        
        JOIN
        departments AS d
        ON d.location_id=l.location_id
        

/* show the employee id, salary and his colleagues id, salary who receives higher salary than him 

employees AS myself                     employees AS colleague
----------
id      salary                          id      salary
--------------                          --------------
1       1000                            1       1000 - x
2       2000                            2       2000 - x
3       3000                            3       3000 - ok

output:
-------
myself          colleague
-------------------------
1               2
1               3
2               3

*/

SELECT  myself.employee_id,
        myself.salary,
        
        colleague.employee_id,
        colleague.salary
        
FROM    employees AS myself

        JOIN
        employees AS colleague 
        ON  myself.salary < colleague.salary
        
        
