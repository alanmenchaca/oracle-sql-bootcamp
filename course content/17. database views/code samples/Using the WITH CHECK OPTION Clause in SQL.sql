/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using the WITH CHECK OPTION Clause in SQL      *
 ************************************************************/

DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;

CREATE OR REPLACE VIEW empvw80 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees_copy
    WHERE department_id = 80;

SELECT * FROM empvw80;

INSERT INTO empvw80 VALUES (215,'John','Brown','JBROWN',sysdate,'SA_MAN');

SELECT * FROM employees_copy;

CREATE OR REPLACE VIEW empvw80 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees_copy
    WHERE department_id = 80
WITH CHECK OPTION CONSTRAINT emp_dept80_chk;

INSERT INTO empvw80 VALUES (216,'John2','Brown2','JBROWN2',sysdate,'SA_MAN');

CREATE OR REPLACE VIEW empvw80 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees_copy
    WHERE department_id = 80
WITH CHECK OPTION;

INSERT INTO empvw80 VALUES (217,'John3','Brown3','JBROWN3',sysdate,'SA_MAN', 80);
INSERT INTO empvw80 VALUES (218,'John4','Brown4','JBROWN4',sysdate,'SA_MAN', 60);

CREATE OR REPLACE VIEW empvw80 AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees_copy
    WHERE department_id = 80
    AND job_id = 'SA_MAN'
WITH CHECK OPTION;

INSERT INTO empvw80 VALUES (219,'John3','Brown3','JBROWN3',sysdate,'IT_PROG', 80);
UPDATE empvw80 SET first_name = 'Steve' WHERE employee_id = 217;
UPDATE empvw80 SET department_id = 70 WHERE employee_id = 217;

SELECT * FROM user_constraints WHERE table_name = 'EMPVW80';