/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : PURGE Operations                               *
 ************************************************************/

SELECT * FROM recyclebin;
PURGE RECYCLEBIN; 
DROP TABLE employees_copy;

SELECT * FROM employees_copy;
FLASHBACK TABLE employees_copy TO BEFORE DROP; 
DROP TABLE employees_copy PURGE;

CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE TABLE employees_copy2 AS SELECT * FROM employees;
CREATE TABLE employees_copy3 AS SELECT * FROM employees;

DROP TABLE employees_copy;
DROP TABLE employees_copy2;
DROP TABLE employees_copy3;

PURGE TABLE employees_copy2;
PURGE TABLE employees_copy3;




