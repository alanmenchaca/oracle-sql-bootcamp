/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : DELETE Statement                               *
 ************************************************************/

SELECT * FROM employees_copy;

DELETE FROM employees_copy;

DELETE employees_copy;

DELETE employees_copy
WHERE job_id = 'IT_PROG';

DELETE employees_copy
WHERE department_id IN (SELECT department_id 
                        FROM departments 
                        WHERE upper(department_name) LIKE'%SALES%');