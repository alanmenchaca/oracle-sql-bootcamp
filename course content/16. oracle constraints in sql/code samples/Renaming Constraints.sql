/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Renaming Constraints                           *
 ************************************************************/

CREATE TABLE employees_copy AS SELECT * FROM employees;

ALTER TABLE employees_copy RENAME CONSTRAINT SYS_C008743 TO email_nn;