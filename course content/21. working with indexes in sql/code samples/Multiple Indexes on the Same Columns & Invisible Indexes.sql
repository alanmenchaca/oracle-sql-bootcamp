/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Multiple Indexes on the Same Columns           *
             and Invisible Indexes                          *
 ************************************************************/

DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE INDEX emp_cpy_dpt_id_idx ON employees_copy (department_id);
CREATE INDEX emp_cpy_dpt_id_idx2 ON employees_copy (department_id) INVISIBLE;
CREATE BITMAP INDEX emp_cpy_dpt_id_idx2 ON employees_copy (department_id);
CREATE BITMAP INDEX emp_cpy_dpt_id_idx2 ON employees_copy (department_id) INVISIBLE;
SELECT * FROM employees_copy WHERE department_id = 20;
SELECT /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_dpt_id_idx2) */* 
    FROM employees_copy WHERE department_id = 20;
DROP INDEX emp_cpy_dpt_id_idx2;
ALTER INDEX emp_cpy_dpt_id_idx INVISIBLE;

CREATE UNIQUE INDEX emp_cpy_empid_idx ON employees_copy (employee_id) INVISIBLE;
SELECT * FROM employees_copy WHERE employee_id = 102;
SELECT /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy EMP_CPY_EMPID_IDX) */* 
    FROM employees_copy WHERE employee_id = 103;

ALTER SESSION SET optimizer_use_invisible_indexes = TRUE;



