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



-- Show all the country name and coresponding region name from region table

SELECT    r.region_name, 
          c.country_name
FROM      regions AS r

          JOIN
          countries AS c
          ON r.region_id = c.region_id;




SELECT r.region_name, c.country_name, l.city
FROM regions AS r
JOIN
countries AS c
ON r.region_id = c.region_id
JOIN
locations AS l
ON l.country_id = c.country_id;



SELECT    r.region_name,
          c.country_name,
          l.city,
          d.department_name
FROM      regions AS r

          JOIN
          countries AS c
          ON r.region_id = c.region_id

          JOIN
          locations AS l
          ON l.country_id = c.country_id

          JOIN
          departments AS d
          ON d.location_id = l.location_id;



-- Show the employee id, salary and his colleagues id, salary who receives heigher salary than him

SELECT    myself.employee_id,
          myself.salary,

          colleague.employee_id,
          colleague.salary
          
FROM      employees AS myself

          JOIN
          employees AS colleague
          ON myself.salary < colleague.salary;

