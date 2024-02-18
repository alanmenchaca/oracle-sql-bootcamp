/************* The Complete Oracle SQL Bootcamp **********************************************
 * Author  : Oracle Master Training                         		                         *
 * Course  : The Complete Oracle SQL Bootcamp               		                         *
 * Lecture : The Differences Between The Inner Joins & Outer Joins, Equijoins & Non-Equijoins*
 *********************************************************************************************/
 
------------- INNER EQUIJOIN EXAMPLES ---------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id
    AND e.manager_id = d.manager_id);

SELECT e.first_name, e.last_name, d.department_name, city
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

------------- INNER NONEQUIJOIN EXAMPLES -------------
SELECT e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND e.salary > j.min_salary);

SELECT e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.salary > j.min_salary;

-------------- OUTER EQIIJOIN EXAMPLES ---------------
SELECT first_name, last_name, department_name, e.department_id emp_dept_id, d.department_id dep_dept_id
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id emp_dept_id, d.department_id dep_dept_id
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

SELECT first_name, last_name, department_name, e.department_id, d.department_id, location_id
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id)
RIGHT OUTER JOIN locations l
USING(location_id);

-------------- OUTER NONEQUIJOIN EXAMPLES -------------
SELECT e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary 
FROM employees e LEFT OUTER JOIN jobs j 
ON e.job_id = j.job_id
AND e.salary BETWEEN j.min_salary+500 AND j.max_salary;

SELECT e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary 
FROM employees e, jobs j 
WHERE e.job_id = j.job_id(+) 
AND e.salary BETWEEN j.min_salary(+)+500 AND j.max_salary(+);
