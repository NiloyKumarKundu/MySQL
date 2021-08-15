DROP DATABASE IF EXISTS Sample_University;
CREATE DATABASE Sample_University;

CREATE TABLE classroom (
    building varchar(50),
    room_number int,
    capacity int DEFAULT 0,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name varchar(50),
    building varchar(50),
    budget int NOT NULL,
    PRIMARY KEY (dept_name),
    FOREIGN KEY (building) REFERENCES classroom(building) ON DELETE CASCADE
);

CREATE TABLE course (
    course_id int,
    title varchar(50),
    dept_name varchar(50),
    credits int,
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name) ON DELETE CASCADE
);

CREATE TABLE instructor (
    ID int,
    name varchar(50),
    dept_name varchar(50),
    salary int,
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE CASCADE
);

CREATE TABLE section (
    course_id int,  # course
    sec_id int,
    semester int,
    year int,
    building varchar(50), # classroom
    room_number int,    # classroom
    time_slot_id int,
    PRIMARY KEY (sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
    FOREIGN KEY (building, room_number) REFERENCES classroom (building, room_number) ON DELETE CASCADE
);

CREATE TABLE teaches (
    ID int, # instructor
    course_id int, # course
    sec_id int, # section
    semester int, # section
    year int, # section
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor (ID) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
    FOREIGN KEY (sec_id, semester, year) REFERENCES section (sec_id, semester, year) ON DELETE CASCADE
);

CREATE TABLE student (
    ID int PRIMARY KEY,
    name varchar(50),
    dept_name varchar(50),  #department
    tot_cred int, 
    FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE CASCADE
);

CREATE TABLE takes (
    ID int, # STUDENT
    course_id int, # course
    sec_id int, # section
    semester int, # section
    year int, # section
    grade int,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES student (ID) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
    FOREIGN KEY (sec_id, semester, year) REFERENCES section (sec_id, semester, year) ON DELETE CASCADE
);

CREATE TABLE advisor (
    s_ID int,
    i_ID int,
    PRIMARY KEY (s_ID, i_ID)
);

CREATE TABLE time_slot (
    time_slot_id int,
    day varchar(20),
    start_time varchar(20),
    end_time varchar(20),
    PRIMARY KEY (time_slot_id, day, start_time)
);

CREATE TABLE prereq (
    course_id int, # course
    prereq_id int, 
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE
);