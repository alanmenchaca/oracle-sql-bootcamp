/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Multiple Join Operations						*
 ************************************************************/

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT first_name, last_name, department_name
FROM employees e JOIN departments d
ON(e.department_id = d.department_id);

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
ON(l.location_id = d.location_id);

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
USING(location_id);

SELECT first_name, last_name, department_name, city, postal_code, street_address
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
USING(location_id)
NATURAL JOIN COUNTRIES;

SELECT first_name, last_name, department_name, city, postal_code, street_address, country_id
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
USING(location_id)
NATURAL JOIN COUNTRIES;

SELECT first_name, last_name, department_name, city, postal_code, street_address, country_id
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN locations l
USING(location_id)
JOIN COUNTRIES
USING(country_id);

SELECT first_name, last_name, department_name, city, postal_code, street_address, country_id
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN COUNTRIES
USING(country_id)
JOIN locations l
USING(location_id);