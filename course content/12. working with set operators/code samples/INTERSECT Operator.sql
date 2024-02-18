/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : INTERSECT Operator                             *
 ************************************************************/

SELECT first_name, last_name, email, hire_date, salary, job_id  FROM retired_employees
INTERSECT
SELECT first_name, last_name, email, hire_date, salary, job_id FROM employees;