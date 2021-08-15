DROP TABLE IF EXISTS Student;

CREATE TABLE Student(
    studentId varchar(9),
    name varchar(25),
    bdate date,
    age int,
    weight decimal(5, 2),
    nid varchar(16)
);

SELECT * FROM Student;


# Add column to the table
ALTER TABLE Student ADD (
    cgpa decimal(3, 2),
    hobby varchar(30)
);


# Delete column 
ALTER TABLE Student DROP COLUMN cgpa; 
SELECT * FROM Student;


ALTER TABLE Student MODIFY hobby varchar(50);
SELECT * FROM Student;


# table rename
RENAME TABLE Student to StudentInfo;




# Apply Constrains
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    studentId varchar(9) NOT NULL,
    name varchar(25) ,
    #date_of_admission date DEFAULT '2021-07-01',
    date_of_admission date DEFAULT sysdate(),
    age int CHECK(age > 0),
    weight decimal(5, 2),
    nid varchar(16) UNIQUE,
    PRIMARY KEY(studentId)
);

INSERT INTO Student(studentId, name, age) VALUES ('123', 'xyz', 1);
INSERT INTO Student(studentId, name, age) VALUES ('456', 'ABC', 10);

SELECT * FROM Student;


# New Tabel
DROP TABLE IF EXISTS Result;
CREATE TABLE Result(
    studentId varchar(9) UNIQUE,
    cgpa decimal(3, 2),
    FOREIGN KEY (studentId) REFERENCES Student(studentId)
);

#INSERT INTO Result(studentId, cgpa) VALUES('789', 8.5);
INSERT INTO Result(studentId, cgpa) VALUES('456', 8.5);
SELECT * FROM Result;




DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    studentId varchar(9) NOT NULL,
    name varchar(25) NOT NULL,
    date_of_admission date DEFAULT sysdate(),
    age int CHECK(age > 0),
    weight decimal(5, 2),
    nid varchar(16) UNIQUE,
    PRIMARY KEY(studentId, name)
);

INSERT INTO Student(studentId, name, age) VALUES ('123', 'xyz', 1);
INSERT INTO Student(studentId, name, age) VALUES ('456', 'ABC', 10);

CREATE TABLE Result(
    studentId varchar(9),
    name varchar(25),
    cgpa decimal(3, 2),
    FOREIGN KEY (studentId, name) REFERENCES Student(studentId, name) ON DELETE CASCADE
);

INSERT INTO Result VALUES('456', 'ABC', 8.5);

SELECT * FROM Result;


ON DETETE CASCADE -> Originally 
