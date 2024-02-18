-- DATABASE VIEWS
-- Creating Simple Views
CREATE VIEW emp_vw_90 AS
    SELECT * FROM employees WHERE department_id = 90;

CREATE VIEW emp_vw_20 AS
    SELECT employee_id, first_name, last_name 
    FROM employees WHERE department_id = 20;

CREATE VIEW emp_vw_30 AS
    SELECT employee_id e_id, first_name name, last_name surname
    FROM employees WHERE department_id = 30;

CREATE VIEW emp_vw_40 (e_id, name, surname, email) AS
    SELECT employee_id, first_name, last_name, email
    FROM employees WHERE department_id = 40;

SELECT * FROM emp_vw_90;
SELECT first_name, last_name FROM emp_vw_20;
SELECT * FROM emp_vw_30;
SELECT * FROM emp_vw_40;


-- Creating Complex Views
CREATE VIEW emp_cx_vw (DNAME, MIN_SAL, MAX_SAL) AS
    SELECT DISTINCT UPPER(department_name), MIN(salary), MAX(salary)
    FROM employees e INNER JOIN departments d USING (department_id)
    GROUP BY department_name;


-- Modifying Views
SELECT * FROM emp_vw_30;
CREATE OR REPLACE VIEW emp_vw_30  AS 
    SELECT employee_id e_id, first_name || ' ' || last_name name, job_id
    FROM employees WHERE department_id = 30;


-- Performing DML Operations with Views
-- DML operations with Simple Views
DROP TABLE employees_copy CASCADE CONSTRAINTS;
CREATE TABLE employees_copy AS SELECT * FROM employees;

CREATE VIEW emp_vw_60 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees_copy 
    WHERE department_id = 60;
    
INSERT INTO emp_vw_60 
    VALUES (213, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG');

--------------------------------------------------------

CREATE OR REPLACE VIEW emp_vw_60 AS
    SELECT employee_id, first_name, last_name, email, 
           hire_date, job_id, department_id
    FROM employees_copy 
    WHERE department_id = 60;

INSERT INTO emp_vw_60 
    VALUES (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);
UPDATE emp_vw_60 SET job_id = 'SA_MAN' WHERE employee_id = 214;
DELETE FROM emp_vw_60;

SELECT * FROM employees_copy;
SELECT * FROM employees_copy WHERE department_id = 60;
SELECT * FROM emp_vw_60;

-- DML operations with Complex Views
CREATE OR REPLACE VIEW emp_vw_60 AS
    SELECT DISTINCT employee_id, first_name, last_name, 
                    email, hire_date, job_id, department_id
    FROM employees_copy 
    WHERE department_id = 60;

-- SQL Error: ORA-01732: data manipulation operation not legal on this view
-- Complex views restrict DML operations based on how they were created.
INSERT INTO emp_vw_60 
    VALUES (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);
UPDATE emp_vw_60 SET job_id = 'SA_MAN' WHERE employee_id = 214;
DELETE FROM emp_vw_60;


-- Using the WITH CHECK OPTION Clause
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;

CREATE OR REPLACE VIEW emp_vw_80 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees_copy
    WHERE department_id = 80
WITH CHECK OPTION CONSTRAINT emp_dept_80_chk;

-- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation
INSERT INTO emp_vw_80 VALUES (216, 'John2', 'Brown2', 'JBROWN2', sysdate, 'SA_MAN');

CREATE OR REPLACE VIEW emp_vw_80 AS
    SELECT employee_id, first_name, last_name, 
           email, hire_date, job_id, department_id
    FROM employees_copy
    WHERE department_id = 80
WITH CHECK OPTION;

INSERT INTO emp_vw_80 VALUES (217, 'John3', 'Brown3', 'JBROWN3', sysdate, 'SA_MAN', 80);
-- 01402. 00000 -  "view WITH CHECK OPTION where-clause violation"
INSERT INTO emp_vw_80 VALUES (218, 'John4', 'Brown4', 'JBROWN4', sysdate, 'SA_MAN', 60);

CREATE OR REPLACE VIEW emp_vw_80 AS
    SELECT employee_id, first_name, last_name, 
           email, hire_date, job_id, department_id
    FROM employees_copy
    WHERE department_id = 80
        AND job_id = 'SA_MAN'
WITH CHECK OPTION;

-- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation
INSERT INTO emp_vw_80 VALUES (219, 'John5', 'Brown5', 'JBROWN5', sysdate, 'IT_PROG', 80);
UPDATE emp_vw_80 SET first_name = 'Steve' WHERE employee_id = 217;
-- 01402. 00000 -  "view WITH CHECK OPTION where-clause violation"
UPDATE emp_vw_80 SET department_id = 70 WHERE employee_id = 217;

SELECT * FROM user_constraints WHERE table_name = 'EMP_VW_80';

SELECT * FROM emp_vw_80;
SELECT * FROM employees_copy;


-- Preventing DMLs using WITH READ ONLY
CREATE OR REPLACE VIEW emp_vw_80 AS
    SELECT employee_id, first_name, last_name, 
           email, hire_date, job_id, department_id
    FROM employees_copy
    WHERE department_id = 80 AND job_id = 'SA_MAN'
    WITH READ ONLY;
    
SELECT * FROM emp_vw_80;    

-- SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
INSERT INTO emp_vw_80 VALUES (219, 'John3', 'Brown3', 'JBROWN3',
                              sysdate, 'IT_PROG', 80);
UPDATE emp_vw_80 SET first_name = 'Steve' WHERE employee_id = 217;
DELETE FROM emp_vw_80 WHERE employee_id = 217;


-- Dropping Views
-- Dropping a view invalidates all the objects based on this view.
SELECT * FROM user_constraints WHERE table_name = 'EMP_VW_80';
DROP VIEW emp_vw_90;
