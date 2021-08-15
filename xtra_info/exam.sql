DROP DATABASE IF EXISTS Real_Estate_Agency;
CREATE DATABASE Real_Estate_Agency;
USE Real_Estate_Agency;

DROP TABLE IF EXISTS Owner;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Tenant;
DROP TABLE IF EXISTS Owns;
DROP TABLE IF EXISTS Rents;

CREATE TABLE Owner (
    owner_id varchar(9),
    owner_name varchar(20),
    owner_address varchar(20),
    PRIMARY KEY (owner_id)
);

CREATE TABLE Property (
    building_no varchar(9),
    address varchar(50),
    value decimal(10, 2),
    PRIMARY KEY (building_no)
);

CREATE TABLE Tenant (
    tenant_id varchar(9),
    first_name varchar(20),
    family_name varchar(20),
    address varchar(50),
    phone_no varchar(11),
    PRIMARY KEY (tenant_id)
);

CREATE TABLE Owns (
    owner_id varchar(9) UNIQUE,
    building_no varchar(9) UNIQUE,
    PRIMARY KEY (owner_id, building_no),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id) ON DELETE CASCADE,
    FOREIGN KEY (building_no) REFERENCES Property (building_no) ON DELETE CASCADE
);

CREATE TABLE Rents (
    tenant_id varchar(9),
    building_no varchar(9),
    lease_period date DEFAULT sysdate(),
    bond decimal(10, 2),
    PRIMARY KEY(building_no),
    FOREIGN KEY (tenant_id) REFERENCES Tenant(tenant_id) ON DELETE CASCADE,
    FOREIGN KEY (building_no) REFERENCES Property (building_no) ON DELETE CASCADE
);



INSERT INTO Owner VALUES ('011', 'AAA', 'ABCD');
INSERT INTO Owner VALUES ('012', 'BBB', 'ABCD');
INSERT INTO Owner VALUES ('013', 'CCC', 'ABCD');

INSERT INTO Property VALUES ('011', 'P', 100074.23);
INSERT INTO Property VALUES ('012', 'Q', 100085.23);
INSERT INTO Property VALUES ('013', 'R', 1000034.90);

INSERT INTO Tenant (tenant_id, first_name) VALUES ('011', 'X');
INSERT INTO Tenant (tenant_id, first_name) VALUES ('012', 'Y');
INSERT INTO Tenant (tenant_id, first_name) VALUES ('013', 'Z');


INSERT INTO Owns VALUES ('011', '012');
INSERT INTO Owns VALUES ('012', '011');
INSERT INTO Owns VALUES ('012', '013');
INSERT INTO Owns VALUES ('011', '013');     #

INSERT INTO Rents (tenant_id, building_no, bond) VALUES ('011', '011', 100074.23);
INSERT INTO Rents (tenant_id, building_no, bond) VALUES ('011', '012', 100085.23);

