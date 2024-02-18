/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : SCALAR Subqueries                              *
 ***********************************************************/
 
SELECT sysdate FROM dual;
SELECT (SELECT sysdate FROM dual) FROM dual;

SELECT avg(salary) FROM employees;

SELECT first_name, last_name, job_id
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees);

SELECT department_id FROM employees 
WHERE first_name = 'Luis';

SELECT * FROM employees
WHERE department_id = 100;

SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM employees 
                        WHERE first_name = 'Luis');
                        
SELECT employee_id, first_name, last_name,
       (CASE 
           WHEN location_id = (SELECT location_id FROM locations WHERE postal_code = '99236') THEN 'San Francisco'
           ELSE 'Other' 
        END) city 
FROM employees NATURAL JOIN departments;

SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM employees 
                        WHERE first_name = 'Luisee');
                        
SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM employees 
                        WHERE first_name = 'David');

SELECT *
FROM employees 
WHERE (department_id, manager_id) = (SELECT department_id, manager_id FROM employees 
                                      WHERE first_name ='Luis');