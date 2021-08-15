CREATE DATABASE IF NOT EXISTS demosecbdb;


/* 

ON DELETE RESTRICT -> USER jodi onno kono table e reffer hoi, then ueser er data delete korte chaile korte dibe na
ON DELTE SET NULL -> USER jodi onno table e reffer hoi, tahole tar data delete kore felle, tar exixting sokol copy k NULL set kore dibe
ON DELTE CASCADE -> USER jodi onno table e reffer hoi, tahole tar data delete kore felle, tar exixting sokol copy k auto delet kore dibe.

ON UPDATE RESTRICT, ON UPDATE SET NULL, ON UPDATE CASCASE -> same kaj kore.
 */



CREATE TABLE IF NOT EXISTS table1 (
    colA INT AUTO_INCREMENT,
    colB VARCHAR(40),
    colC DATETIME DEFAULT '2020-01-01 00:00:00',
    foreign_colA INT,
    foreign_colP VARCHAR(30),       #pending

    CONSTRAINT pk PRIMARY KEY(colA),
    CONSTRAINT fk FOREIGN KEY(foreign_colA) REFERENCES table1(colA) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS table2 (
    colP VARCHAR(30),
    colQ CHAR(10),
    colR DOUBLE NOT NULL,
    foreign_colA INT,

    CONSTRAINT pk1 PRIMARY KEY(colP),
    CONSTRAINT uq  UNIQUE(colQ),
    CONSTRAINT fk1 FOREIGN KEY(foreign_colA) REFERENCES table1(colA) ON DELETE CASCADE
);

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

ALTER TABLE table1
ADD CONSTRAINT fk3 FOREIGN KEY(foreign_colP) REFERENCES table2(colP) ON DELETE SET NULL;


/*
DML -> DATA MANIPULATION LANGUAGE
----------------------------------
1. Data Insert
2. Data Update 
3. Data Delete
*/


DATA INSERT
-----------
--> All column value insertion
INSERT INTO tableName VALUES(colOneValue, colTwoValue, colThreeValue);

--> specific column value insertion
INSERT INTO tableName(colOne, colTen, colEleven) VALUES(colOneValue, colTenValue, colElevenValue)





INSERT INTO table1 VALUES (NULL, "dbms", "2021-10-01 12:10:20", NULL, NULL),
                          (NULL, "dbms1", "2021-10-01 12:10:20", NULL, NULL),

INSERT INTO table1(colB, colA, colC) VALUES("new data", 3, '2022-01-01 23:59:59');
INSERT INTO table1(colB, foreign_colA, colC) VALUES("new data 1", 8, '2022-01-01 23:59:59'); -> invalid refere error


UPDATE
------
UPDATE tableName 
SET colmnName = value, colmnName = value
WHERE condition


UPDATE table1
SET colB = "new colB value", colC = "2020-01-01 12:00:00"
WHERE colA > 2;


DELETE FROM tableName
WHERE condition


MySQL eqality check = insted of ==

DELETE FROM table1
WHERE foreign_colA = 1;


