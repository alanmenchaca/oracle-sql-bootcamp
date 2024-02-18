/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using the ORDER BY Clause with SET Operators   *
 ************************************************************/

SELECT first_name, last_name, salary, department_id FROM employees
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary ASC;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary DESC;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary s, department_id FROM retired_employees
ORDER BY salary DESC;

SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary s, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary DESC;

SELECT first_name, last_name, salary s, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY s DESC;

SELECT first_name, last_name, salary s, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary s, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY s DESC;

SELECT first_name, last_name, salary s, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary s, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees;

SELECT first_name, last_name, salary s, department_id FROM employees
UNION ALL
SELECT NULL, last_name, salary s, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees;