/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : LISTAGG Function 								*
 ************************************************************/

SELECT first_name FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(first_name,',') WITHIN GROUP (ORDER BY first_name) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(first_name,',') WITHIN GROUP (ORDER BY first_name DESC) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(first_name,',') WITHIN GROUP (ORDER BY last_name, salary DESC) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(salary,',') WITHIN GROUP (ORDER BY salary DESC) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(distinct salary,',') WITHIN GROUP (ORDER BY salary DESC) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT listagg(distinct salary,' - ') WITHIN GROUP (ORDER BY salary DESC) "Employees" FROM employees
WHERE job_id = 'ST_CLERK';

SELECT * FROM locations;

SELECT listagg(city,',') WITHIN GROUP (ORDER BY city) AS CITIES FROM locations
WHERE country_id = 'US';

SELECT listagg(city,',') WITHIN GROUP (ORDER BY city) AS CITIES FROM locations
WHERE country_id = 'UK';

SELECT listagg(city,',') WITHIN GROUP AS CITIES FROM locations
WHERE country_id = 'UK';

SELECT listagg(city,',') AS CITIES FROM locations
WHERE country_id = 'UK';

SELECT listagg(city) AS CITIES FROM locations
WHERE country_id = 'UK';

SELECT j.job_title,
  LISTAGG (e.first_name,', ') WITHIN GROUP (ORDER BY e.first_name) AS employees_list
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.job_title;