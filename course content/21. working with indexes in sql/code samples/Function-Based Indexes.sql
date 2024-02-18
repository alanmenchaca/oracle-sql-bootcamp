/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Function-Based Indexes                         *
 ************************************************************/
--Creates the employees_copy table from scratch 
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;

--Creates a b-tree (normal) index on the last_name column of the employees_copy table
CREATE INDEX emp_cpy_lname_idx ON employees_copy (last_name);

SELECT * FROM employees_copy WHERE last_name = 'KING';
SELECT * FROM employees_copy WHERE upper(last_name) = 'KING';

DROP INDEX emp_cpy_lname_idx;

--Creates a function based index on the last_name column of the employees_copy table
CREATE INDEX emp_cpy_fname_idx ON employees_copy (upper(last_name));


SELECT * FROM employees_copy WHERE lower(last_name) = 'KING';
SELECT * FROM employees_copy WHERE last_name ='KING';
