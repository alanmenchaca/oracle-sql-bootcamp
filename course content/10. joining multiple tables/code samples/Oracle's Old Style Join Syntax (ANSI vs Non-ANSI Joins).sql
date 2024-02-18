/************* The Complete Oracle SQL Bootcamp *********************
 * Author  : Oracle Master Training                         		*
 * Course  : The Complete Oracle SQL Bootcamp               		*
 * Lecture : Oracle's Old Style Join Syntax (ANSI vs Non-ANSI Joins)*
 ********************************************************************/
 
SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id= d.department_id
AND d.department_name = 'Finance';

SELECT e.first_name, e.last_name, d.department_name, l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id= d.department_id
AND d.department_name = 'Finance'
AND d.location_id = l.location_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id= d.department_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id= d.department_id(+);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id= d.department_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id
UNION
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

SELECT first_name, last_name, department_name, e.department_id, d.department_id, location_id
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id)
RIGHT OUTER JOIN locations
USING(location_id);

SELECT first_name, last_name, department_name, e.department_id, d.department_id, l.location_id
FROM employees e, departments d, locations l
WHERE e.department_id(+) = d.department_id
AND d.location_id(+) = l.location_id;

SELECT first_name, last_name, department_name, job_title
   FROM employees e RIGHT JOIN departments d
   ON(e.department_id = d.department_id)
   RIGHT JOIN jobs j USING(job_id);

SELECT first_name, last_name, department_name, job_title, e.job_id, j.job_id
FROM  employees e, departments d, jobs j
WHERE e.department_id(+) = d.department_id
AND e.job_id(+) = j.job_id;

SELECT first_name, last_name, department_name, job_title, ed.job_id, j.job_id
FROM   (
         SELECT first_name, last_name, job_id, department_name
         FROM   employees e, departments d
         WHERE  e.department_id (+) = d.department_id
       ) ed
   ,   jobs j
WHERE  ed.job_id (+) = j.job_id;

SELECT d.department_name, e.first_name, e.department_id, d.department_id, e.salary    
FROM   departments d, employees e
WHERE  d.department_id = e.department_id(+)
AND    d.department_id >= 40
AND    e.salary(+) >= 5000
ORDER BY d.department_name, e.first_name;

SELECT d.department_name, e.first_name, e.department_id, d.department_id, e.salary     
FROM   departments d LEFT OUTER JOIN employees e 
ON d.department_id = e.department_id 
WHERE  d.department_id >= 40
AND e.salary >= 5000
ORDER BY d.department_name, e.first_name;

SELECT d.department_name, e.first_name, e.department_id, d.department_id, e.salary     
FROM   departments d LEFT OUTER JOIN employees e 
ON d.department_id = e.department_id AND e.salary >= 5000
WHERE  d.department_id >= 40
ORDER BY d.department_name, e.first_name;

SELECT d.department_name, e.first_name, e.department_id, d.department_id, e.salary     
FROM   departments d LEFT OUTER JOIN employees e 
ON d.department_id = e.department_id AND e.salary >= 5000
WHERE  e.department_id >= 40
ORDER BY d.department_name, e.first_name;