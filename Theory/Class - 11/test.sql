/* Aggregate Function / Groupwise Function */
/* 
    SUM()   -> full column sum return kore
    MIN()   -> return minimum value of a column
    MAX()   -> return maximum value of a column
    AVG()   -> return the calculated avg value of a column
    COUNT() -> count the total data (without null value) and return it
    COUNT() -> ekhane parameter hisebe column name pathale null bad jabe, null soho gunte chaile parameter hisebe (*) pathate hobe.
*/

/* Ei function gulo group kore kaj kore */

SELECT COUNT(col1), SUM(col2), MIN(col2), MAX(col2), AVG(col2)
FROM table_name;

# default row = all row
# deafult group = full table 1 group


/* ekhane group kotogulo eita matter kore */

/* Ekhane output e no of rows = number of groups */

/* Restrictions */
/* 
    Jokhon full table mile 1 ta group tokhon, Aggregate function er pashe kono column k direct call kora jabe na
 */

 /* Group formation */
 SELECT 
 FROM table_name
 [WHERE   condition] 
 GROUP BY col1, col2, ...., coln
 [ORDER BY column_name order]
 [LIMIT offset, row_number]