/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : UNION and UNION ALL Operators                  *
 ************************************************************/

SELECT * FROM retired_employees
UNION
SELECT * FROM employees;

SELECT * FROM retired_employees
UNION
SELECT * FROM employees WHERE job_id = 'IT_PROG';

SELECT first_name, last_name, email, hire_date, salary  FROM retired_employees
UNION
SELECT first_name, last_name, email, hire_date, salary FROM employees;

SELECT first_name, last_name, email, hire_date, salary  FROM retired_employees
UNION
SELECT first_name, last_name, email, hire_date, department_id FROM employees;

SELECT first_name, last_name, email, hire_date, salary, job_id FROM retired_employees
UNION ALL
SELECT first_name, last_name, email, hire_date, salary, job_id FROM employees;
