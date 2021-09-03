UNION -> A, B jodi duita set hoi, tahole emon ekta set C toiri korbe jader protita item either A or B or Both set e belong kore. UNION korle repeat gulo 1 bar e asbe. duita table er data gulo same type hote hobe


UNION ALL -> sob repeat soho asbe.

INTERSECT -> duita set er moddhe common elemnet print kora

EXCEPT (A\B) -> A - B kore ja paoa jai seita




SELECT employee_id, job_id
FROM employees
UNION (
        SELECT employee_id, job_id
        FROM job_history
    )
ORDER BY employee_id;


SELECT employee_id, job_id
FROM employees
UNION ALL (
        SELECT employee_id, job_id
        FROM job_history
    )  
ORDER BY employee_id ASC;



-- age j job e kaj korto job switch korar por o ekhono same job e kaj kore.

SELECT employee_id, job_id
FROM employees
INTERSECT (
        SELECT employee_id, job_id
        FROM job_history
    )  
ORDER BY employee_id ASC



-- employees table er theke job_history table er data match jader sathe hobe tara bad e bakira print hbe
SELECT employee_id, job_id
FROM employees
EXCEPT  (
            SELECT employee_id, job_id
            FROM job_history
        )  
ORDER BY employee_id ASC




SUBQUERY AND JOIN
-----------------
Already have idea from theory.