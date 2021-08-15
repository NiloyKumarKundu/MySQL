DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student(
    
);


INSERT INTO Student(studentId, name, age) VALUES ('123', 'xyz', 1);

RENAME TABLE Student to StudentInfo;


#Column delete
ALTER TABLE Student DROP COLUMN cgpa;

# Add column to the table
ALTER TABLE Student ADD (
    cgpa decimal(3, 2),
    hobby varchar(30)
);

FOREIGN KEY (studentId, name) REFERENCES Student(studentId, name) ON DELETE CASCADE

date_of_admission date DEFAULT sysdate(),

SELECT * FROM Student;
