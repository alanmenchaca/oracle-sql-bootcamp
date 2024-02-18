/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Restricting Joins								*
 ************************************************************/

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
ON(l.location_id = d.location_id)
WHERE e.job_id = 'IT_PROG';

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
ON(l.location_id = d.location_id)
AND e.job_id = 'IT_PROG';

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
ON(l.location_id = d.location_id)
AND e.job_id = 'IT_PROG'
AND e.first_name = 'David';
