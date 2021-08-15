
INSERT INTO Student VALUES('01112', 'AAA', '2020-12-30', 20, 55.5, '123456');
INSERT INTO Student VALUES('01113', 'BBB', '2020-12-12', 22, 57.5, '123457');
INSERT INTO Student VALUES('01114', 'CCC', '2020-12-32', 24, 88.5, '123458'); */

INSERT INTO Student(studentId, name, date_of_admission) VALUES ('01115', 'DDD', '2020-03-30');
INSERT INTO Student(studentId, name, nid) VALUES ('01116', 'EEE', '123459');
INSERT INTO Student(studentId, name) VALUES ('01117', 'FFF');

# Update

UPDATE Student SET name = 'GGG' WHERE studentId = '01116';
UPDATE Student SET age = NULL WHERE studentId = '01112';


# Delete
DELETE FROM Student WHERE studentId = '01116';

DELETE FROM Student WHERE nid IS NULL;

SELECT * FROM Student;