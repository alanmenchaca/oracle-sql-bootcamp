/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Inner Join & Join with the ON Clause			*
 ************************************************************/

SELECT e.first_name, e.last_name, d.manager_id, d.department_name 
FROM employees e JOIN departments d
ON(e.department_id = d.department_id AND e.manager_id = d.manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name 
FROM employees e INNER JOIN departments d
ON(e.department_id = d.department_id AND e.manager_id = d.manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name 
FROM employees e JOIN departments d
USING(department_id, manager_id);

SELECT e.first_name, e.last_name, manager_id, d.department_name 
FROM employees e JOIN departments d
USING(department_id, manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name 
FROM employees e JOIN departments d
ON(e.department_id = d.department_id AND e.employee_id = d.manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name 
FROM employees e JOIN departments d
ON(e.department_id = d.department_id AND e.employee_id = to_number(d.manager_id));