MySQL:
------
1. create database (schema):
--------------------
create database dbname; 
- duplicate dbname, error show 

create database if not exists dbname;
- duplicate dbname ignore


2. delete database:
--------------------
drop database dbname;
- dbname doesn't exist, error show

drop database if exists dbname;
- dbname doesn't exists, no error

------------------------------------------------

3. Table creation:
-------------------

user
id      name
------------
1       abc
2       def - x
3       ghi


order
o_id       amount   user_id - foreign key(user_id) references user(id)
                                ON DELETE SET NULL
                                ON UPDATE RESTRICT|SET NULL|CASCADE
---------------------------
1           1000$       1
2           2000$       NULL
3           3000$       1
4           1500$       NULL




table 1 code:
--------------

CREATE TABLE  IF NOT EXISTS table1(
	colA INT AUTO_INCREMENT,
    colB VARCHAR(40),
    colC DATETIME DEFAULT '2020-01-01 00:00:00',
    foreign_colA int,
    foreign_colP VARCHAR(30), #pending
    
    CONSTRAINT pk PRIMARY KEY(colA),
    CONSTRAINT fk FOREIGN KEY(foreign_colA)
    				REFERENCES table1(colA)
    				ON DELETE  SET NULL
);

CREATE TABLE IF NOT EXISTS table2(
	colP VARCHAR(30),
    colQ CHAR(10),
    colR DOUBLE NOT NULL,
    foreign_colA INT,
    
    CONSTRAINT pk1 PRIMARY KEY(colP),
    CONSTRAINT uq  UNIQUE(colQ),
    CONSTRAINT fk1 FOREIGN KEY(foreign_colA) 
    				REFERENCES table1(colA)
    				ON DELETE  CASCADE
);

foreign key declare:
--------------------
ALTER TABLE table1
ADD CONSTRAINT fk3 FOREIGN KEY(foreign_colP)
					REFERENCES table2(colP)
                    ON DELETE SET NULL;
                    
                    
                    

ALTER TABLE table2
ADD COLUMN colS DATETIME NOT NULL DEFAULT '2021-12-31 00:00:00';

ALTER TABLE table2
DROP COLUMN colS;

ALTER TABLE table2
DROP PRIMARY KEY;

ALTER TABLE table2
ADD CONSTRAINT pk2 PRIMARY KEY(colR);

ALTER TABLE table2
DROP INDEX uq;

DROP TABLE IF EXISTS table2;

---------------------------------------------------------------------------


DML - Data Manipulation Language:
---------------------------------

1) Data Insert

INSERT INTO tablename VALUES(col1value, col2value, col3value, ... colnvalue);
- all column value insertion


INSERT INTO tablename(col1, col10, col5) VALUES(col1value, col10value, col5value);
- value insertion to some specific columns


example:

INSERT INTO table1 VALUES(NULL, "dbms", "2021-10-01 12:10:20",NULL,NULL),
                         (NULL, "dbms1", "2021-12-01 12:10:20",NULL,NULL)
                         
INSERT INTO table1(colB, foreign_colA, colC) VALUES("new data",3,'2022-01-01 23:59:59');


2) Data Update

UPDATE  tablename
SET     col1=col1value, col2=col2value, col10=col10value, ... ...
WHERE   condition;

example:
--------
UPDATE 	table1
SET 	colB="new colB value", colC="2025-01-01 12:00:00"
WHERE	colA>2;


3) Data Delete

DELETE FROM tablename
WHERE   condition;

example:
--------
DELETE FROM table1
WHERE foreign_colA=1

MySQL: equality check = instead of ==










