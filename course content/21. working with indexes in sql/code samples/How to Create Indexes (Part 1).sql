/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : How to Create Indexes (Part 1)                 *
 ************************************************************/


DROP TABLE employees_copy;

CREATE TABLE employees_copy AS SELECT * FROM employees;



CREATE UNIQUE INDEX emp_cpy_eid_idx ON employees_copy (employee_id);

SELECT * FROM employees_copy WHERE employee_id = 103;