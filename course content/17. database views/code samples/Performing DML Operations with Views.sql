/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Performing DML Operations with Views           *
 ************************************************************/

DROP TABLE employees_copy CASCADE CONSTRAINTS;
CREATE TABLE employees_copy AS SELECT * FROM employees;

CREATE VIEW empvw60 AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id 
FROM employees_copy
WHERE department_id = 60;

SELECT * FROM employees_copy;
SELECT * FROM employees_copy WHERE department_id = 60;
SELECT * FROM empvw60;

INSERT INTO empvw60 VALUES (213,'Alex','Hummel','AHUMMEL',sysdate,'IT_PROG');

CREATE OR REPLACE VIEW empvw60 AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id, department_id 
FROM employees_copy
WHERE department_id = 60;

INSERT INTO empvw60 VALUES (214,'Alex','Hummel','AHUMMEL',sysdate,'IT_PROG',60);
UPDATE empvw60 SET job_id = 'SA_MAN' where employee_id = 214;
DELETE FROM empvw60;

CREATE OR REPLACE VIEW empvw60 AS
SELECT distinct employee_id, first_name, last_name, email, hire_date, job_id, department_id 
FROM employees_copy
WHERE department_id = 60;

CREATE OR REPLACE VIEW empvw60 AS
SELECT rownum rn, employee_id, first_name, last_name, email, hire_date, job_id, department_id 
FROM employees_copy
WHERE department_id = 60;

INSERT INTO empvw60 VALUES (1,214,'Alex','Hummel','AHUMMEL',sysdate,'IT_PROG',60);

CREATE OR REPLACE VIEW empvw60 AS
SELECT employee_id, first_name, last_name, email, hire_date, 
       job_id, department_id, salary*12 annual_salary 
FROM employees_copy
WHERE department_id = 60;

INSERT INTO empvw60 VALUES (214,'Alex','Hummel','AHUMMEL',sysdate,'IT_PROG',60, 120000);
UPDATE empvw60 SET job_id = 'SA_MAN' where employee_id = 107;
DELETE empvw60 WHERE employee_id = 107;