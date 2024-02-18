/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Status of Constraints                          *
 ************************************************************/

DROP TABLE departments_copy;
CREATE TABLE departments_copy AS SELECT * FROM departments;
ALTER TABLE departments_copy ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id);

ALTER TABLE departments_copy DISABLE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy DISABLE NOVALIDATE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy DISABLE VALIDATE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy ENABLE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy ENABLE NOVALIDATE CONSTRAINT dept_cpy_id_pk;

UPDATE departments_copy SET department_id = 10 WHERE department_id = 20;
SELECT * FROM departments_copy;
DELETE FROM departments_copy WHERE department_id = 10;
UPDATE departments_copy SET department_name ='Temp' WHERE department_id = 30;
UPDATE departments_copy SET department_id = NULL WHERE department_id = 40;
UPDATE departments_copy SET department_id = NULL WHERE department_id = 50;