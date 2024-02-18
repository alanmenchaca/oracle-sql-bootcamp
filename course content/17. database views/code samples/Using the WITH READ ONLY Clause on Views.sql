/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using the WITH READ ONLY Clause on Views       *
 ************************************************************/

CREATE OR REPLACE VIEW empvw80 AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id, department_id
FROM employees_copy
WHERE department_id = 80
AND job_id = 'SA_MAN'
WITH READ ONLY;

SELECT * FROM empvw80;

INSERT INTO empvw80 VALUES (219,'John3','Brown3','JBROWN3',sysdate,'IT_PROG', 80);
UPDATE empvw80 SET first_name = 'Steve' WHERE employee_id = 217;
DELETE FROM empvw80 WHERE employee_id = 217;