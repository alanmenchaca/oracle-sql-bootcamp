/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : SAVEPOINT Statement                            *
 ************************************************************/

SELECT * FROM employees_copy;
SELECT * FROM jobs_copy;

--DML 1
DELETE FROM employees_copy WHERE job_id = 'IT_PROG';
SAVEPOINT A; --> Creates SavePoint A
--DML 2
UPDATE employees_copy 
SET salary = 1.2 * salary;
SAVEPOINT B; --> Creates SavePoint B
--DML 3
INSERT INTO jobs_copy VALUES ('PY_DEV','Python Developer', 12000, 20000);
SAVEPOINT C; --> Creates SavePoint C
--DML 4
DELETE FROM employees_copy WHERE job_id = 'SA_REP';
SAVEPOINT D; --> Creates SavePoint D

--Rollbacks All
ROLLBACK;
--Rollbacks to SavePoint "B"
ROLLBACK TO B;

--Rollbacks to SavePoint "C"
ROLLBACK TO C;

--Rollbacks to SavePoint "A"
ROLLBACK TO SAVEPOINT A;
