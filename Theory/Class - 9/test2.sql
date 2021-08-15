CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;

CREATE TABLE IF NOT EXISTS table1 (
    colA INT AUTO_INCREMENT,
    colB VARCHAR(40),
    colC DATETIME DEFAULT '2020-01-01 00:00:00',
    foreign_colA INT, 
    foreign_colP VARCHAR(30),

    CONSTRAINT pk PRIMARY KEY(colA),
    CONSTRAINT fk FOREIGN KEY(foreign_colA) REFERENCES table1(colA) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS table2 (
    colP VARCHAR(30),
    colQ CHAR(10),
    colR DOUBLE NOT NULL,
    foreign_colA INT,
    CONSTRAINT pk1 PRIMARY KEY(colP),
    CONSTRAINT uq UNIQUE(colQ),
    CONSTRAINT fk1 FOREIGN KEY(foreign_colA) REFERENCES table1(foreign_colA) ON DELETE CASCADE
)

ALTER TABLE table_name 
DROP INDEX unique_column_constrain_name;          # Unique drop korar jonno (Column delete hbe na)

ALTER TABLE table_name 
ALTER COLUMN column_name SET DEFAULT default_value;         #Default value set korar jonno.

ALTER TABLE table_name 
ALTER COLUMN column_name DROP DEFAULT;          # default value drop kore.

# Condition check
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK(expression);


ALTER TABLE table_name
DROP CONSTRAINT check_constraint_name;

ALTER TABLE table1
ADD CONSTRAINT fk2 FOREIGN KEY(foreign_colP) REFERENCES table2(colP) ON DELETE SET NULL;
