CREATE DATABASE IF NOT EXISTS MID;
USE MID;

CREATE TABLE IF NOT EXISTS Student (
    StudentID VARCHAR(20),
    Name VARCHAR(20),
    DOB DATETIME,
    UniversityName VARCHAR(20),
    CONSTRAINT pk PRIMARY KEY(StudentID)
);

CREATE TABLE IF NOT EXISTS Problem (
    ProblemName VARCHAR(20),
    Description VARCHAR(20),
    Difficulty INT,
    Category VARCHAR(20),
    CONSTRAINT pk PRIMARY KEY(ProblemName)
);

CREATE TABLE IF NOT EXISTS Solve (
    StudentID VARCHAR(20),
    ProblemName VARCHAR(20),
    SolveDate DATETIME,

    CONSTRAINT fk1 FOREIGN KEY(StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    CONSTRAINT fk2 FOREIGN KEY(ProblemName) REFERENCES Problem(ProblemName) ON DELETE CASCADE
);

INSERT INTO Student VALUES('111', 'abc', '1999-08-01', 'International');
INSERT INTO Student VALUES('112', 'def', '1997-07-02', 'Bangladesh');
INSERT INTO Student VALUES('113', 'ghi', '1988-05-25', 'International');
INSERT INTO Student VALUES('114', 'jkl', '1990-09-15', 'Bangladesh');
INSERT INTO Student VALUES('115', 'mno', '1991-03-02', 'International');
INSERT INTO Student VALUES('011204036', 'pqr', '1991-03-02', 'International');
INSERT INTO Student VALUES('0112040367', 'stu', '1991-03-02', 'International');
INSERT INTO Student VALUES('011204037', 'stu', '2020-03-02', 'Bangladesh');


INSERT INTO Problem VALUES('DBMS', 'Imam Sir', 10, 'CSE');
INSERT INTO Problem VALUES('OOP', 'Name vule gesi :-p', 5, 'CSE');
INSERT INTO Problem VALUES('WEB PROG', 'Ekhono kori nai :-p', 6, 'CSE');


INSERT INTO Solve VALUES('011204036', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('011204036', 'DBMS', '2020-08-22');
INSERT INTO Solve VALUES('011204036', 'DBMS', '2019-08-22');
INSERT INTO Solve VALUES('011204036', 'OOP', '2019-08-22');
INSERT INTO Solve VALUES('011204036', 'OOP', '2012-07-04');
INSERT INTO Solve VALUES('011204036', 'WEB PROG', '2021-07-22');

/* 1(A) */

/* i. Show the Name of Students of 'International' University */

SELECT  *
FROM    Student
WHERE   UniversityName LIKE 'International';

/* ii. Show the last one month solved ProblemName list for Student having StudentID '011204036' */

SELECT  *
FROM    Solve
WHERE   StudentID = '011204036' AND MONTH(SolveDate) = MONTH(CURRENT_DATE) - 1 AND YEAR(SolveDate) = YEAR(CURRENT_DATE);


/* 
    iii. Show the StudentID, Name, Age of those Students whose Name contains the characters 'b' and
    'c'. Represent the Age column in 'y years, m months and d days' format. [Consider each year =
    365 days , each month = 30 days and y, m, d represent integers]
*/

SELECT  StudentID,
        Name,
        CONCAT(
            DATEDIFF(CURRENT_DATE, DOB) DIV 365,
            ' years ',
            (DATEDIFF(CURRENT_DATE, DOB) % 365) DIV 30,
            ' months ',
            (DATEDIFF(CURRENT_DATE, DOB) % 365) % 30,
            ' days'
        ) AS Age

FROM Student;


UPDATE Problem
SET Category = 'Math'
WHERE Category = 'CSE';


UPDATE Problem
SET Category = 'CSE'
WHERE ProblemName = 'OOP'

/* 1(B) */

/* i. Show ID of students who have solved problems of 'Math' Category. */

SELECT  StudentID
FROM    Solve
WHERE   ProblemName = ANY (
    SELECT ProblemName
    FROM Problem
    WHERE Category = 'Math'
)



UPDATE  Student
SET     UniversityName = 'National'
WHERE   UniversityName = 'Bangladesh';

UPDATE  Problem 
SET     Category = 'Programming'
WHERE   Category = 'CSE';


INSERT INTO Solve VALUES('112', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('112', 'DBMS', '2020-08-22');
INSERT INTO Solve VALUES('112', 'OOP', '2019-08-22');
INSERT INTO Solve VALUES('112', 'OOP', '2019-08-22');
INSERT INTO Solve VALUES('112', 'OOP', '2012-07-04');
INSERT INTO Solve VALUES('112', 'WEB PROG', '2021-07-22');

INSERT INTO Solve VALUES('011204037', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('011204037', 'DBMS', '2020-08-22');

INSERT INTO Solve VALUES('114', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('114', 'OOP', '2020-08-22');
INSERT INTO Solve VALUES('114', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('114', 'OOP', '2020-08-22');
INSERT INTO Solve VALUES('114', 'DBMS', '2021-07-22');
INSERT INTO Solve VALUES('114', 'DBMS', '2020-08-22');


SELECT StudentID
FROM    Solve
GROUP BY StudentID
HAVING COUNT(*) > 5;


/* ii. Show name of the students of 'National' University who have solved more than 5 problems. */

SELECT  StudentID, Name
FROM    Student
WHERE   StudentID = ANY (
            SELECT StudentID
            FROM    Solve
            GROUP BY StudentID
            HAVING COUNT(*) > 5
        )
        AND
        UniversityName = 'National';





SELECT  ProblemName
FROM    Problem
WHERE   Category = 'Programming';

SELECT  StudentID
FROM    Solve
WHERE   ProblemName = (
            SELECT  ProblemName
            FROM    Problem
            WHERE   Category = 'Programming'
        )



/* iii. Show name of universities having students who solved a problem of 'Programming' Category. */

SELECT  UniversityName
FROM    Student
WHERE   StudentID = ANY (
            SELECT  StudentID
            FROM    Solve 
            WHERE   ProblemName = (
                        SELECT  ProblemName
                        FROM    Problem
                        WHERE   Category = 'Programming'
                    )
        )





/* 1(C) */


/* i. Show name of the students who have solved maximum number of problems. */
SELECT  COUNT(StudentID) AS count_st
FROM    Solve
GROUP BY StudentID

SELECT  StudentID, MAX(count_st)
FROM    (
            SELECT  StudentID,  COUNT(StudentID) AS count_st
            FROM    Solve
            GROUP BY StudentID
        ) AS cTable


SELECT  StudentID, count_st
FROM    (
            SELECT  StudentID,  COUNT(StudentID) AS count_st
            FROM    Solve
            GROUP BY StudentID
        ) AS cTable


/* ----------------------- */
SELECT  *
FROM    Solve
GROUP BY StudentID
HAVING COUNT(StudentID) = ANY (
    	SELECT COUNT(StudentID) AS count_st
            FROM    Solve
            GROUP BY StudentID
    )   AND COUNT(StudentID) = MAX(StudentID)




SELECT  StudentID
FROM    Solve
GROUP BY StudentID
WHERE   COUNT(StudentID) = (    
        SELECT  COUNT(StudentID)
        FROM    Solve
        GROUP BY StudentID
        HAVING COUNT(StudentID) = ANY (
                SELECT COUNT(StudentID) AS count_st
                    FROM    Solve
                    GROUP BY StudentID
            )
    ) AND MAX(StudentID) = COUNT(StudentID)






/* ii. Show name of the students who have solved the most difficult problem of 'Query' Category. */

INSERT INTO Problem VALUES('SAD', 'Mejaj kharap', 7, 'Query');
INSERT INTO Problem VALUES('q1', 'Mejaj kharap', 5, 'Query');
INSERT INTO Problem VALUES('q2', 'Mejaj kharap', 8, 'Query');
INSERT INTO Problem VALUES('q3', 'Mejaj kharap', 4, 'Query');
INSERT INTO Problem VALUES('q4', 'Mejaj kharap', 9, 'Query');
INSERT INTO Problem VALUES('q5', 'Mejaj kharap', 3, 'Query');
INSERT INTO Problem VALUES('q6', 'Mejaj kharap', 4, 'Query');


INSERT INTO Solve VALUES('112', 'q1', '2021-07-22');
INSERT INTO Solve VALUES('114', 'q2', '2020-08-22');
INSERT INTO Solve VALUES('114', 'q3', '2021-07-22');
INSERT INTO Solve VALUES('011204037', 'q4', '2020-08-22');
INSERT INTO Solve VALUES('114', 'q2', '2021-07-22');
INSERT INTO Solve VALUES('112', 'q4', '2020-08-22');


SELECT  *
FROM    Problem
WHERE   Category = 'Query'

SELECT  MAX(Difficulty)
FROM    Problem
WHERE   Category = 'Query'



SELECT  ProblemName
FROM    Problem
WHERE   Category = 'Query'  AND Difficulty = (
            SELECT  MAX(Difficulty)
            FROM    Problem
            WHERE   Category = 'Query'
        )


SELECT  StudentID
FROM    Solve
WHERE   ProblemName = (
            SELECT  ProblemName
            FROM    Problem
            WHERE   Category = 'Query'  AND Difficulty = (
                        SELECT  MAX(Difficulty)
                        FROM    Problem
                        WHERE   Category = 'Query'
                    )
        )



/* Solution: */
select  StudentID, Name
FROM    Student
WHERE   StudentID = ANY (
            SELECT  StudentID
            FROM    Solve
            WHERE   ProblemName = (
                        SELECT  ProblemName
                        FROM    Problem
                        WHERE   Category = 'Query'  AND Difficulty = (
                                    SELECT  MAX(Difficulty)
                                    FROM    Problem
                                    WHERE   Category = 'Query'
                                )
                    )
        )



/* iii. Show name and description of the most difficult problem. */
SELECT  MAX(Difficulty)
FROM    Problem

/* Solution */
SELECT  ProblemName, Description
FROM    Problem
WHERE   Difficulty = (
            SELECT  MAX(Difficulty)
            FROM    Problem
        )


/* d */
/* 
    i. For each Category, show the Problem Name and Description of the most difficult problem in
    that category.
 */

SELECT  Category, MAX(Difficulty)
FROM    Problem
GROUP BY Category


/* Solution */
SELECT  ProblemName, Description
FROM    Problem
WHERE   (Category, Difficulty) = ANY (
            SELECT  Category, MAX(Difficulty)
            FROM    Problem
            GROUP BY Category
        )




/* 
    ii. For each University, show the name of the student of that University who have solved most
    number of problems.
 */

SELECT  StudentID
FROM    Student
GROUP BY StudentID, UniversityName


SELECT  *
FROM    Solve
WHERE   StudentID = ANY (
            SELECT  StudentID
            FROM    Student
            GROUP BY StudentID, UniversityName
        )
GROUP BY StudentID, ProblemName
HAVING  COUNT(ProblemName) > 1



/* Solution */
SELECT  Name, UniversityName
FROM    Student
WHERE   StudentID = ANY (
            SELECT  StudentID
            FROM    Solve
            WHERE   StudentID = ANY (
                        SELECT  StudentID
                        FROM    Student
                        GROUP BY StudentID, UniversityName
                    )
            GROUP BY StudentID, ProblemName
            HAVING  COUNT(ProblemName) > 1 
        )




SELECT  ProblemName
FROM Problem
WHERE Category = 'Math'


