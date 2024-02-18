/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Deferring Constraints                          *
 ************************************************************/

DROP TABLE departments_copy;
CREATE TABLE departments_copy AS SELECT * FROM departments;

ALTER TABLE departments_copy 
ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id) DEFERRABLE INITIALLY DEFERRED;
INSERT INTO departments_copy VALUES (10, 'Temp Department', 200, 1700);
SET CONSTRAINT dept_cpy_id_pk IMMEDIATE;
SET CONSTRAINT dept_cpy_id_pk DEFERRED;
SET CONSTRAINTS ALL IMMEDIATE;
ALTER SESSION SET CONSTRAINTS = IMMEDIATE;

ALTER TABLE departments_copy DROP CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy 
ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id) NOT DEFERRABLE;