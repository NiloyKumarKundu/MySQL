# JOIN = INNER JOIN = CROSS JOIN = same for mysql
# LEFT JOIN = LEFT OUTER JOIN
# RIGHT JOIN = RIGHT OUTER JOIN
# NATURAL JOIN = NATURAL INNER JOIN = NATURAL INNER JOIN = NATURAL OUTER JOIN

# we can join max 61 tables

/* JOIN operation */

SELECT t1.*, t2.* -> t1 table all column, t2 table all column
SELECT * -> All table all column 

SELECT t1.*, t2.*
FROM table1 AS t1           #left table
     JOIN 
     table2 AS t2           #right table
     ON condition (jora laganor condition)





/* LEFT JOIN */
Left table er kichu dara unused roye gese, left table er unused data gulo k output e dekhate chaile LEFT JOIN use korbo.



SELECT t1.*, t2.*
FROM table1 AS t1           #left table
     LEFT JOIN 
     table2 AS t2           #right table
     ON condition (jora laganor condition)



/* RIGHT JOIN */
Right table er kichu dara unused roye gese, right table er unused data gulo k output e dekhate chaile RIGHT JOIN use korbo.


SELECT t1.*, t2.*
FROM table1 AS t1           #left table
     RIGHT JOIN 
     table2 AS t2           #right table
     ON condition (jora laganor condition)