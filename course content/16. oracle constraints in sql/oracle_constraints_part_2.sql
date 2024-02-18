-- Dropping (Removing) Constraints
CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER CONSTRAINT did_nn NOT NULL,
    phone_number   VARCHAR2(11) CONSTRAINT pnum_uk UNIQUE 
                                CONSTRAINT pnum_nn NOT NULL,
    email          VARCHAR2(100) CONSTRAINT email_uk UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) 
        REFERENCES employees_copy (employee_id)
);

-- While dropping a PRIMARY KEY constraint, we can use the CASCADE
-- option to drop all the associated FOREIGN KEY constraints.
ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk CASCADE;
ALTER TABLE employees_copy DROP PRIMARY KEY CASCADE;
ALTER TABLE employees_copy DROP CONSTRAINT SYS_C008315 ONLINE;


-- Cascading Constraints
DROP TABLE employees_copy;
DROP TABLE departments_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE TABLE departments_copy AS SELECT * FROM departments;

-- 02264. 00000 -  "name already used by an existing constraint" -> dept_id_pk
-- Every Object name must be unique in a schema!
ALTER TABLE departments_copy ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id);

ALTER TABLE employees_copy
ADD CONSTRAINT emp_dept_cpy_fk FOREIGN KEY (department_id) 
REFERENCES departments_copy (department_id);

-- 12992. 00000 -  "cannot drop parent key column"
ALTER TABLE departments_copy DROP COLUMN department_id;
ALTER TABLE departments_copy DROP COLUMN department_id CASCADE CONSTRAINTS;

ALTER TABLE employees_copy ADD UNIQUE (first_name, last_name);
-- 12991. 00000 -  "column is referenced in a multi-column constraint"
ALTER TABLE employees_copy DROP COLUMN last_name;
ALTER TABLE employees_copy DROP COLUMN last_name CASCADE CONSTRAINTS;


-- Renaming Constraints
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy RENAME CONSTRAINT SYS_C008342 TO email_nn;


-- Disable Constraints
DROP TABLE employees_copy;
DROP TABLE departments_copy;

CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE TABLE departments_copy AS SELECT * FROM departments;

ALTER TABLE departments_copy
ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id) DISABLE;

ALTER TABLE employees_copy
ADD CONSTRAINT emp_dept_copy_fk FOREIGN KEY (department_id)
REFERENCES departments_copy (department_id);

UPDATE departments_copy 
SET department_name = null 
WHERE department_id = 10;

ALTER TABLE departments_copy DISABLE CONSTRAINT SYS_C008356;

UPDATE departments_copy 
SET department_id = 5 
WHERE department_id = 80;

-- ORA-02297: cannot disable constraint (HR.DEPT_CPY_ID_PK) - dependencies exist
ALTER TABLE departments_copy DISABLE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy DISABLE CONSTRAINT dept_cpy_id_pk CASCADE;


-- Enable Constraints
SELECT * FROM departments_copy ORDER BY department_id;
INSERT INTO departments_copy VALUES(10, 'TempDept', 100, 1700);
-- 02437. 00000 -  "cannot validate (%s.%s) - primary key violated"
ALTER TABLE departments_copy ENABLE CONSTRAINT dept_cpy_id_pk;
DELETE FROM departments_copy WHERE department_name = 'TempDept';


-- Status of Constraints
DROP TABLE departments_copy;
CREATE TABLE departments_copy AS SELECT * FROM departments;
ALTER TABLE departments_copy 
    ADD CONSTRAINT dept_cpy_id_pk PRIMARY KEY (department_id);
    
ALTER TABLE departments_copy DISABLE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy DISABLE NOVALIDATE CONSTRAINT dept_cpy_id_pk;
-- With the DISABLE VALIDATE option the table behaves like a read-only table.
ALTER TABLE departments_copy DISABLE VALIDATE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy ENABLE CONSTRAINT dept_cpy_id_pk;
ALTER TABLE departments_copy ENABLE NOVALIDATE CONSTRAINT dept_cpy_id_pk;

UPDATE departments_copy SET department_id = 10 WHERE department_id = 20;
SELECT * FROM departments_copy;
DELETE FROM departments_copy WHERE department_id = 10;
-- *Cause: Try to insert/update/delete on table with DISABLE VALIDATE constraint.
UPDATE departments_copy SET department_name = 'Temp' WHERE department_id = 10;
UPDATE departments_copy SET department_id = NULL WHERE department_id = 50;


-- DEFERRING CONSTRAINTS
DROP TABLE departments_copy;
CREATE TABLE departments_copy AS SELECT * FROM departments;

ALTER TABLE departments_copy ADD CONSTRAINT dept_copy_id_pk 
    PRIMARY KEY (department_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE departments_copy ADD CONSTRAINT dept_copy_id_pk 
    PRIMARY KEY (department_id) NOT DEFERRABLE;
 
INSERT INTO departments_copy VALUES (10, 'Temp Department', 200, 1700);
SET CONSTRAINT dept_copy_id_pk IMMEDIATE;
SET CONSTRAINT dept_copy_id_pk DEFERRED;
SET CONSTRAINTS ALL IMMEDIATE; 

 ALTER SESSION SET CONSTRAINTS = IMMEDIATE;
 ALTER TABLE employees_copy DROP CONSTRAINT dept_copy_id_pk;
 