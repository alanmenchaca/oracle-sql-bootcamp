-- WORKING WITH SET OPERATORS
-- UNION Operator
SELECT * FROM retired_employees
UNION
SELECT * FROM employees
WHERE job_id = 'IT_PROG';

SELECT first_name, last_name, email, hire_date, salary FROM retired_employees
UNION
SELECT first_name, last_name, email, hire_date, salary FROM employees;

SELECT job_id FROM job_history
UNION
SELECT job_id FROM employees WHERE department_id = 80;


-- UNION ALL Operator
SELECT first_name, last_name, email, hire_date, salary FROM retired_employees
UNION ALL
SELECT first_name, last_name, email, hire_date, salary FROM employees;

SELECT job_id FROM job_history
UNION ALL
SELECT job_id FROM employees WHERE department_id = 80;


-- INTERSECT Operator
SELECT * FROM retired_employees
INTERSECT
SELECT * FROM employees;

SELECT job_id FROM job_history
INTERSECT
SELECT job_id FROM employees WHERE department_id = 80;


-- MINUS Operator
SELECT * FROM retired_employees
MINUS
SELECT * FROM employees;

SELECT job_id FROM job_history
MINUS
SELECT job_id FROM employees WHERE department_id = 80;


-- Matched Unmatched Queries in SET Operations
SELECT job_id, null AS department_id, first_name, last_name FROM employees
UNION ALL
SELECT job_id, department_id, null, null FROM job_history;

-- Using a static value instead of a NULL value.
SELECT job_id, 0 AS department_id, first_name, last_name FROM employees
UNION ALL
SELECT job_id, department_id, null, null FROM job_history;

SELECT job_id, null, first_name FROM employees WHERE department_id = 80
UNION
SELECT job_id, department_id, null FROM job_history;


-- Using ORDER BY with SET Operators
SELECT first_name, last_name, salary, department_id FROM employees
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary DESC;

-- It recognizes the columns and aliases that only exist in the first query.
SELECT first_name, last_name, salary s, department_id FROM employees
UNION
SELECT first_name, last_name, salary s, department_id FROM retired_employees
ORDER BY s DESC;

SELECT job_id, department_id, first_name FROM employees 
WHERE department_id = 80
UNION 
SELECT job_id, department_id, null FROM job_history
ORDER BY department_id;


-- Combining Multiple Queries with SET Operators
SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees
    WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

SELECT first_name, last_name, salary, department_id FROM employees
MINUS
SELECT first_name, last_name, salary, department_id FROM employees
    WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;
