DROP DATABASE IF EXISTS Paediatrician_Clinic;
CREATE DATABASE Paediatrician_Clinic;
USE Paediatrician_Clinic;

CREATE TABLE Patients (
    p_id varchar(9),
    p_name varchar(20),
    age int check (age >= 1 && age < 15),
    dob date,
    PRIMARY KEY (p_id, p_name, age)
);


CREATE TABLE Doctors (
    doc_id varchar(9),
    doc_name varchar(20),
    nid varchar(16),
    join_date date DEFAULT sysdate(),
    PRIMARY KEY (doc_id, doc_name)
);


CREATE TABLE Rooms (
    doc_id varchar(9),
    doc_name varchar(20),
    r_floor int DEFAULT 1,
    wing varchar(20),
    room_number varchar(9),
    PRIMARY KEY (doc_id, doc_name),
    FOREIGN KEY (doc_id, doc_name) REFERENCES Doctors (doc_id, doc_name) ON DELETE CASCADE
);

CREATE TABLE Treatment_table (
    p_id varchar(9),
    p_name varchar(20),
    age int,
    doc_id varchar(9),
    doc_name varchar(20),
    PRIMARY KEY (p_id, p_name, doc_id, doc_name),
    FOREIGN KEY (p_id, p_name, age) REFERENCES Patients (p_id, p_name, age) ON DELETE CASCADE,
    FOREIGN KEY (doc_id, doc_name) REFERENCES Doctors (doc_id, doc_name) ON DELETE CASCADE
);


# Status 1

INSERT INTO Doctors (doc_id, doc_name) VALUES ('1', 'Dr. Kennedy');
INSERT INTO Doctors (doc_id, doc_name) VALUES ('2', 'Dr. Bennington');

SELECT * FROM Doctors;

INSERT INTO Rooms (doc_id, doc_name, room_number, wing) VALUES ('1', 'Dr. Kennedy', '101', 'North');
INSERT INTO Rooms (doc_id, doc_name, room_number, wing) VALUES ('2', 'Dr. Bennington', '105', 'South');

SELECT * FROM Rooms;

# Status 2

INSERT INTO Patients (p_id, p_name, age) VALUES ('1', 'Mark', 12);
INSERT INTO Patients (p_id, p_name, age) VALUES ('2', 'Myles', 14);
INSERT INTO Patients (p_id, p_name, age) VALUES ('3', 'Adele', 8);
INSERT INTO Patients (p_id, p_name, age) VALUES ('4', 'Mark', 12);

SELECT * FROM Patients;

INSERT INTO Treatment_table (p_id, p_name, age, doc_id, doc_name) VALUES ('1', 'Mark', 12, '1', 'Dr. Kennedy');
INSERT INTO Treatment_table (p_id, p_name, age, doc_id, doc_name) VALUES ('2', 'Myles', 14, '2', 'Dr. Bennington');
INSERT INTO Treatment_table (p_id, p_name, age, doc_id, doc_name) VALUES ('3', 'Adele', 8, '2', 'Dr. Bennington');
INSERT INTO Treatment_table (p_id, p_name, age, doc_id, doc_name) VALUES ('4', 'Mark', 12, '1', 'Dr. Kennedy');

SELECT * FROM Treatment_table;


# Status 3
UPDATE Rooms SET room_number = '103' WHERE room_number = '101';
SELECT * FROM Rooms;


# Status 4
DELETE FROM Patients WHERE p_name = 'Mark';

SELECT * FROM Patients;
SELECT * FROM Treatment_table;

# Status 5
UPDATE Rooms SET room_number = '101' WHERE wing = 'South';
UPDATE Rooms SET wing = 'North' WHERE wing = 'South';

SELECT * FROM Rooms;


# Status 6
INSERT INTO Patients (p_id, p_name, age) VALUES ('5', 'Adele', 8);
INSERT INTO Treatment_table (p_id, p_name, age, doc_id, doc_name) VALUES ('5', 'Adele', 8, '2', 'Dr. Bennington');

SELECT * FROM Treatment_table;

# Status 7
DELETE FROM Patients WHERE p_id = '3';

SELECT * FROM Patients;