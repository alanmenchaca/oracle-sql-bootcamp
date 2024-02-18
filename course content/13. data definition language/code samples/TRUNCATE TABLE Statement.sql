/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : TRUNCATE TABLE Statement                       *
 ************************************************************/

SELECT * FROM employees_copy;
DELETE FROM employees_copy;
TRUNCATE TABLE employees_copy;
DROP TABLE employees_copy;

CREATE TABLE employees_performance_test AS SELECT e1.first_name, e1.last_name, e1.department_id, e1.salary 
FROM employees e1 CROSS JOIN employees e2 CROSS JOIN employees e3; 

SELECT COUNT(*) FROM employees_performance_test;

DELETE FROM employees_performance_test;

TRUNCATE TABLE employees_performance_test;

DROP TABLE employees_performance_test;