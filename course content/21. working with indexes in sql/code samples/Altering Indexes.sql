/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Altering Indexes                               *
 ************************************************************/

DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy ADD PRIMARY KEY (employee_id);
SELECT * FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX SYS_C008587 RENAME TO emp_cpy_eid_idx;
SELECT * FROM employees_copy WHERE employee_id = 104;
ALTER INDEX emp_cpy_eid_idx UNUSABLE;
SELECT index_name, status FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX emp_cpy_eid_idx COMPILE;
ALTER INDEX emp_cpy_eid_idx REBUILD;
ALTER INDEX emp_cpy_eid_idx DISABLE;
CREATE INDEX emp_cpy_name_idx ON employees_copy(upper(last_name),first_name);
SELECT index_name, index_type, status, funcidx_status FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
SELECT * FROM employees_copy WHERE upper(last_name) = 'STEVEN';
ALTER INDEX emp_cpy_name_idx DISABLE;
ALTER INDEX emp_cpy_name_idx ENABLE;
ALTER INDEX emp_cpy_name_idx INVISIBLE;
SELECT index_name, index_type, status, funcidx_status, visibility FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX emp_cpy_name_idx VISIBLE;

