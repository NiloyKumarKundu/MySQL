CREATE DATABASE IF NOT EXISTS MidThree;
USE MidThree;

CREATE TABLE IF NOT EXISTS Player (
    id VARCHAR(20),
    salary INT,
    club_id VARCHAR(20),
    rank    INT,
    CONSTRAINT pk PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Club (
    club_id         VARCHAR(20),
    country_name    VARCHAR(30),
    coach_id        VARCHAR(20),
    budget          INT,
    CONSTRAINT pk1  PRIMARY KEY(club_id)
);

ALTER TABLE Player
DROP FOREIGN KEY fk;


ALTER TABLE Player
ADD CONSTRAINT fk FOREIGN KEY(club_id) REFERENCES Club(club_id) ON DELETE  SET NULL;



INSERT INTO Club VALUES('1', 'Bangladesh', '2', 30000);
INSERT INTO Club VALUES('5', 'Brazil', '3', 20000);
INSERT INTO Club VALUES('10', 'France', '6', 20000);
INSERT INTO Club VALUES('6', 'Brazil', '10', 50000);
INSERT INTO Club VALUES('7', 'Brazil', '3', 50000);


INSERT INTO Player VALUES('2', 20000, '5', 1);
INSERT INTO Player VALUES('3', 6000, '3', 3);
INSERT INTO Player VALUES('1', 15000, '6', 2);
INSERT INTO Player VALUES('5', 9000, '5', 3);
