/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Non-Equijoins (Joining Unequal Tables)			*
 ************************************************************/

SELECT * FROM employees;
SELECT * FROM jobs;

--Example 1: 
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, e.salary,
       j.min_salary, j.max_salary, j.job_id   
FROM employees e JOIN jobs j
ON e.salary > j.max_salary
AND j.job_id = 'SA_REP';

--Example 2:
SELECT e1.employee_id, e1.first_name, e1.last_name
FROM employees e1 INNER JOIN employees e2
ON e1.employee_id <> e2.employee_id
AND e1.first_name = e2.first_name;

--Example 3:
SELECT e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary 
FROM employees e JOIN jobs j 
ON e.salary BETWEEN j.min_salary AND j.max_salary;