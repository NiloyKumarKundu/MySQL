SELECT      COUNT(*) AS total
FROM        employees e1    
GROUP BY    e1.manager_id

SELECT   MAX(man1.total)
FROM    (
        SELECT      COUNT(*) AS total
        FROM        employees e1    
        GROUP BY    e1.manager_id
    )   AS man1



SELECT      man.manager_id, COUNT(man.employee_id) AS maxcnt
FROM        employees man
GROUP BY    man.manager_id
HAVING      COUNT(man.manager_id) = (
                SELECT   MAX(man1.total)
                FROM    (
                        SELECT      COUNT(*) AS total, e1.manager_id
                        FROM        employees e1    
                        GROUP BY    e1.manager_id
                    )   AS man1
            )





SELECT      MIN(hire_date), department_id
FROM        employees
GROUP BY    department_id


SELECT  department_id, DATEDIFF(CURDATE(), senior_employee) AS "no_of_days"
FROM    (
    SELECT      MIN(hire_date) AS senior_employee, department_id
    FROM        employees
    GROUP BY    department_id
) AS dtable




