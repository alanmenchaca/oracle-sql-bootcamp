/************* The Complete Oracle SQL Bootcamp *****************
 * Author  : Oracle Master Training                             *
 * Course  : The Complete Oracle SQL Bootcamp                   *
 * Lecture : Combining Multiple Queries Using the SET Operators *
 ****************************************************************/

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
MINUS
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
MINUS
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
MINUS
(SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees)
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
MINUS
(SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary);

(SELECT first_name, last_name, salary, department_id FROM employees
MINUS
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees)
ORDER BY salary);