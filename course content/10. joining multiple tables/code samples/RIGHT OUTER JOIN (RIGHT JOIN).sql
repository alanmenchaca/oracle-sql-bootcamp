/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : RIGHT OUTER JOIN (RIGHT JOIN)					*
 ************************************************************/

SELECT count(*) FROM employees;
SELECT count(*) FROM departments;

SELECT first_name, last_name, department_name 
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id 
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id 
FROM employees e LEFT OUTER JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id 
FROM departments d LEFT OUTER JOIN employees e
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id 
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id, location_id
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id)
RIGHT OUTER JOIN locations
USING(location_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id, location_id
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id)
LEFT OUTER JOIN locations
USING(location_id);