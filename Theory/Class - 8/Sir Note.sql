MySQL:
------

Primary Key = (Unique + Not Null)

UNIQUE
-------

id      email       name
(pk)    unique
--------------------------------
1       abc@gmail.com
2       abc@gmail.com   -- error


CHECK(expr)
------------

acc_no      balance 
            CHECK (balance>500)
---------------------------
1           200


Primary Key:
------------


id
(PRIMARY KEY)
-----------------------------------------



Foreign key
---------------------------------


id      name
(pk)
-------------
1       abc
2       def


acc_no   balance   holder_id (fk refer user id column)
-----------------------------
a1       1000       1000  x


AUTO_INCREMENT
-------------------------------------

1 table , 1 auto_increment column exists (not more than that) --- PK



ID                          name
(PK)
(AUTO_INCREMENT)
-----------------------------------------
1                        abc
2                        def                   


----------------------------------------------------------------

1. Database Schema

create database dbname;
- dbname duplicate error generate.

create database if not exists dbname;
- dbname duplicate no error will be generated.


2. Delete an existing database

drop database dbname;
- if no database found will generate error

drop database if exists dbname;
- if no database found won't generate any error.


3. Database table creation:

