/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : How to Create Indexes (Part 2)                 *
 ************************************************************/


SELECT * FROM employees_copy WHERE last_name = 'King';
 
CREATE UNIQUE INDEX emp_cpy_lname_idx ON employees_copy (last_name);
CREATE INDEX emp_cpy_lname_idx ON employees_copy (last_name);
CREATE INDEX emp_cpy_name_idx  ON employees_copy (last_name, first_name);
 
SELECT * FROM employees_copy WHERE last_name = 'King' AND first_name = 'Steven';
 
CREATE BITMAP INDEX emp_cpy_comm_idx ON employees_copy (commission_pct);
SELECT * FROM employees_copy WHERE commission_pct = 0.4;