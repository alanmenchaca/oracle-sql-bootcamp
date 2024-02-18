-- JOINING MULTIPLE TABLES - part 2
-- Left Outer Join
SELECT first_name, last_name, department_id, department_name
FROM employees LEFT OUTER JOIN departments USING(department_id);

SELECT e.first_name, e.last_name, 
       d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d 
    ON e.department_id = d.department_id;

SELECT d.department_id, d.department_name,
       e.first_name, e.last_name
FROM departments d LEFT OUTER JOIN employees e
    ON d.department_id = e.department_id;


-- Right Outer Join
SELECT first_name, last_name, department_name,
       e.department_id, d.department_id
FROM employees e RIGHT OUTER JOIN departments d
    ON(e.department_id = d.department_id);

SELECT e.first_name, e.last_name, e.department_id,
       d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
SELECT e.first_name, e.last_name, e.department_id,
       d.department_id, d.department_name,
       l.location_id
FROM employees e 
    RIGHT OUTER JOIN departments d ON e.department_id = d.department_id
    LEFT OUTER JOIN locations l ON d.location_id = l.location_id;
    

-- Full Outer Join
SELECT first_name, last_name, department_name
FROM employees e FULL OUTER JOIN departments d
    ON (e.department_id = d.department_id); 
    
SELECT e.first_name, e.last_name, e.department_id,
       d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON (e.department_id = d.department_id);
    