CREATE DATABASE IF NOT EXISTS MidTwo;
USE MidTwo;

CREATE TABLE IF NOT EXISTS Category (
    id      VARCHAR(20),
    name    VARCHAR(50),
    CONSTRAINT pk PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS Post (
    id          VARCHAR(20),
    title       VARCHAR(20),
    category_id VARCHAR(20),
    writer_id   VARCHAR(20),
    post_date   DATE,
    editor_id   VARCHAR(20),

    CONSTRAINT pk2 PRIMARY KEY(id),
    CONSTRAINT fk1 FOREIGN KEY(category_id) REFERENCES Category(id)
);

CREATE TABLE IF NOT EXISTS Writer (
    id      VARCHAR(20),
    name    VARCHAR(50),
    dob     DATE,
    country VARCHAR(20),
    rating  INT,
    CONSTRAINT pk3 PRIMARY KEY(id)
);

ALTER TABLE Post
ADD CONSTRAINT fk2 FOREIGN KEY(writer_id) REFERENCES Writer(id);

ALTER TABLE Post
ADD CONSTRAINT fk3 FOREIGN KEY(editor_id) REFERENCES Writer(id);


INSERT INTO Category VALUES('101', 'CSE');
INSERT INTO Category VALUES('102', 'EEE');
INSERT INTO Category VALUES('103', 'Civil');
INSERT INTO Category VALUES('104', 'Programming');
INSERT INTO Category VALUES('105', 'Architechture');
INSERT INTO Category VALUES('106', 'Song');
INSERT INTO Category VALUES('107', 'Travel');



INSERT INTO Writer VALUES('201', 'abc', '1998-04-03', 'Bangladesh', 100);
INSERT INTO Writer VALUES('202', 'def', '1992-11-13', 'India', 80);
INSERT INTO Writer VALUES('203', 'ghi', '1988-03-19', 'Pakistan', 50);
INSERT INTO Writer VALUES('204', 'jkl', '2000-05-22', 'Nepal', 30);
INSERT INTO Writer VALUES('205', 'mno', '2004-06-17', 'Bhutan', 60);

INSERT INTO Writer VALUES('206', 'abir', '1998-04-03', 'Bangladesh', 5);
INSERT INTO Writer VALUES('207', 'monnaf', '1998-04-03', 'Bangladesh', 3);
INSERT INTO Writer VALUES('208', 'riya', '1998-04-03', 'Bangladesh', 2);
INSERT INTO Writer VALUES('209', 'bristy', '1998-04-03', 'Bangladesh', 6);


INSERT INTO Post VALUES('301', 'Tellivision', '102', '201', '2021-03-09', '205');
INSERT INTO Post VALUES('302', 'News', '103', '205', '2021-05-19', '205');
INSERT INTO Post VALUES('303', 'Movie', '105', '202', '2015-12-29', '205');
INSERT INTO Post VALUES('304', 'Study', '101', '204', '2017-11-09', '205');
INSERT INTO Post VALUES('305', 'status', '106', '203', '2017-09-09', '205');
INSERT INTO Post VALUES('306', 'News', '104', '203', '2017-07-09', '205');
INSERT INTO Post VALUES('307', 'Tellivision', '105', '205', '2017-08-25', '205');
INSERT INTO Post VALUES('308', 'status', '102', '202', '2017-01-29', '205');
INSERT INTO Post VALUES('309', 'Study', '101', '201', '2017-03-12', '205');

INSERT INTO Post VALUES('310', 'Tour', '107', '201', '2017-03-12', '205');
INSERT INTO Post VALUES('311', 'Fun', '107', '201', '2017-05-14', '205');
INSERT INTO Post VALUES('312', 'Tour', '107', '201', '2017-08-12', '205');
INSERT INTO Post VALUES('313', 'Tour', '107', '201', '2015-07-18', '205');
INSERT INTO Post VALUES('314', 'Tour', '107', '201', '2017-03-12', '205');


UPDATE Post
SET writer_id = '206'
WHERE id = '310' AND id = '314';


UPDATE Post
SET writer_id = '207'
WHERE id = '311';

UPDATE Post
SET writer_id = '208'
WHERE id = '312';

UPDATE Post
SET writer_id = '209'
WHERE id = '313';





/* 1(A) */
/* i. Show Title of all posts from year 2017. */
SELECT  title
FROM Post
WHERE YEAR(post_date) = 2017;



/* ii. Show Name of all writers from 'India' */
SELECT  name
FROM    Writer
WHERE   country = 'India';



/* B */
/*
    i. Show Name of the writers from 'Bangladesh' having a rating more than 5 who made a post in
    'Travel' category.
 */

SELECT  category_id
FROM    Category
WHERE   name = 'Travel'

SELECT  writer_id
FROM    Writer
WHERE   rating > 5

SELECT  writer_id
FROM    Writer
WHERE   country = 'Bangladesh'



SELECT  writer_id
FROM    Post
WHERE   writer_id = ANY (
            SELECT  writer_id
            FROM    Writer
            WHERE   rating > 5
        ) 
        AND category_id = ANY (
            SELECT  category_id
            FROM    Category
            WHERE   name = 'Travel'     
        )




/* Solution */
SELECT  name
FROM    Writer
WHERE   id = ANY (
            SELECT  writer_id
            FROM    Post
            WHERE   writer_id = ANY (
                        SELECT  id
                        FROM    Writer
                        WHERE   rating > 5
                    ) 
                    AND category_id = ANY (
                        SELECT  category_id
                        FROM    Category
                        WHERE   name = 'Travel'     
                    )
        ) AND country = 'Bangladesh'




/*
    ii. Show Name of the writers whose posts were edited by an editor having a rating less than the
    writer.
 */

writer          post            editor
----------------------------------------


SELECT  w.id AS writer_id, w.rating, p.id AS post_id, e.id AS edit_id, w.rating
FROM    Writer  AS w
        JOIN
        Post    AS p
        ON w.id = p.writer_id
        JOIN
        Writer  AS e
        ON p.editor_id = e.id

WHERE   w.rating > e.rating;






 

/* C */
/*
    i. Show name of the writer who made maximum number of posts in 'Horror' category.
*/

INSERT INTO Post VALUES('315', 'Tellivision', '108', '201', '2021-03-09', '205');
INSERT INTO Post VALUES('316', 'News', '108', '205', '2021-05-19', '205');
INSERT INTO Post VALUES('317', 'Movie', '108', '202', '2015-12-29', '205');
INSERT INTO Post VALUES('318', 'Study', '108', '204', '2017-11-09', '205');
INSERT INTO Post VALUES('319', 'status', '108', '203', '2017-09-09', '205');
INSERT INTO Post VALUES('320', 'News', '108', '203', '2017-07-09', '205');
INSERT INTO Post VALUES('321', 'Tellivision', '108', '205', '2017-08-25', '205');
INSERT INTO Post VALUES('322', 'status', '108', '202', '2017-01-29', '205');
INSERT INTO Post VALUES('323', 'Study', '108', '201', '2017-03-12', '205');


SELECT  *
FROM    Category
WHERE   name = 'Horror'


SELECT      category_id, writer_id, COUNT(*)
FROM        Post
WHERE       category_id = (
                SELECT  id
                FROM    Category
                WHERE   name = 'Horror'
            )
GROUP BY    writer_id


SELECT      d_count
FROM        (
                SELECT      COUNT(writer_id) AS d_count, writer_id
                FROM        Post
                WHERE       category_id = (
                                SELECT  id
                                FROM    Category
                                WHERE   name = 'Horror'
                            )
                GROUP BY    writer_id
            )   AS dtable


SELECT      writer_id
FROM        Post
WHERE       category_id = (
                SELECT  id
                FROM    Category
                WHERE   name = 'Horror'
            )
GROUP BY    writer_id
HAVING      COUNT(writer_id) = ALL (    
                SELECT      MAX(d_count)
                FROM        (
                                SELECT      COUNT(writer_id) AS d_count
                                FROM        Post
                                WHERE       category_id = (
                                                SELECT  id
                                                FROM    Category
                                                WHERE   name = 'Horror'
                                            )
                                GROUP BY    writer_id
                            )   AS dtable
            )


/* Solution */
SELECT  name
FROM    Writer
WHERE   id = ANY (
            SELECT      writer_id
            FROM        Post
            WHERE       category_id = (
                            SELECT  id
                            FROM    Category
                            WHERE   name = 'Horror'
                        )
            GROUP BY    writer_id
            HAVING      COUNT(writer_id) = ALL (    
                            SELECT      MAX(d_count)
                            FROM        (
                                            SELECT      COUNT(writer_id) AS d_count
                                            FROM        Post
                                            WHERE       category_id = (
                                                            SELECT  id
                                                            FROM    Category
                                                            WHERE   name = 'Horror'
                                                        )
                                            GROUP BY    writer_id
                                        )   AS dtable
                        )
        )





/*
    ii. Show name of the editor who edited more posts than the average number of posts made by
    writers from 'America'
*/

SELECT      id
FROM        Writer
WHERE       country = 'America'



SELECT      AVG(*)
FROM        Post
WHERE       writer_id = ANY (
                SELECT      id
                FROM        Writer
                WHERE       country = 'America' 
            )
GROUP BY    writer_id;




SELECT  AVG(d_cnt)
FROM    (
            SELECT      COUNT(writer_id) AS d_cnt
            FROM        Post
            WHERE       writer_id = ANY (
                            SELECT      id
                            FROM        Writer
                            WHERE       country = 'America' 
                        )
            GROUP BY    writer_id
        ) AS dtable


SELECT      *
FROM        Post
GROUP BY    writer_id
HAVING      COUNT(*) > (
                SELECT  AVG(d_cnt)
                FROM    (
                            SELECT      COUNT(writer_id) AS d_cnt
                            FROM        Post
                            WHERE       writer_id = ANY (
                                            SELECT      id
                                            FROM        Writer
                                            WHERE       country = 'America' 
                                        )
                            GROUP BY    writer_id
                        ) AS dtable
            )




/* Solution */
SELECT  name, id
FROM    Writer
WHERE   country = 'America' AND id = ANY (
            SELECT      writer_id
            FROM        Post
            GROUP BY    writer_id
            HAVING      COUNT(*) > (
                            SELECT  AVG(d_cnt)
                            FROM    (
                                        SELECT      COUNT(writer_id) AS d_cnt
                                        FROM        Post
                                        WHERE       writer_id = ANY (
                                                        SELECT      id
                                                        FROM        Writer
                                                        WHERE       country = 'America' 
                                                    )
                                        GROUP BY    writer_id
                                    ) AS dtable
                        )
        )





/*  
    i. For each category, show name of the category and name of the writer with maximum rating
    among all writers who made a post in that category 
*/

category        writer      ratting


SELECT 
FROM    Category    AS c
        JOIN
        Post    AS p
        ON  p.category_id = c.id
        JOIN
        Writer  AS w 
        ON  p.writer_id = w.id




SELECT dtable.cid AS cid1, dtable.rat AS rat1
FROM    (
            SELECT c.id AS cid, w.id AS wid, w.rating AS rat
            FROM    Category    AS c
                    JOIN
                    Post    AS p
                    ON  p.category_id = c.id
                    JOIN
                    Writer  AS w 
                    ON  p.writer_id = w.id
        )   AS dtable
GROUP BY dtable.cid



/* Solution */
SELECT c.name AS cname, w.name AS wname
            FROM    Category    AS c
                    JOIN
                    Post    AS p
                    ON  p.category_id = c.id
                    JOIN
                    Writer  AS w 
                    ON  p.writer_id = w.id
WHERE (c.id, w.rating) = ANY (
        SELECT dtable.cid AS cid1, dtable.rat AS rat1
        FROM    (
                    SELECT c.id AS cid, w.id AS wid, w.rating AS rat
                    FROM    Category    AS c
                            JOIN
                            Post    AS p
                            ON  p.category_id = c.id
                            JOIN
                            Writer  AS w 
                            ON  p.writer_id = w.id
                )   AS dtable
        GROUP BY dtable.cid
    )






/*
    ii. Show name of the editor(s) who edited a post made by the Fourth highest rated writer.
*/

SELECT  name
FROM    Writer  AS w1
WHERE   3 = (
            SELECT  COUNT(DISTINCT rating)
            FROM writer w2
            WHERE w2.rating > w1.rating
        )



