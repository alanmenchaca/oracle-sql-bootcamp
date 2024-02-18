-- JOINING MULTIPLE TABLES - part 1
-- Natural Join 
SELECT * FROM employees NATURAL JOIN departments;
SELECT * FROM departments NATURAL JOIN employees;

SELECT first_name, last_name, department_name 
FROM departments NATURAL JOIN employees;


-- Join with the USING Clause
SELECT first_name, last_name, department_name, department_id
    FROM employees JOIN departments USING (department_id);
    
SELECT * FROM employees JOIN departments 
    USING (department_id, manager_id);


-- Handling Ambiguous Column Names
SELECT e.first_name, last_name, department_name, e.manager_id
FROM employees e JOIN departments d USING (department_id);

SELECT employees.first_name, employees.last_name, 
       departments.department_name, departments.manager_id
FROM employees JOIN departments
USING(department_id);

-- Table aliases increase code readability and query performance.
SELECT e.first_name, e.last_name, d.department_name, d.manager_id
FROM employees e JOIN departments d
USING(department_id);

-- We cannot give aliases to columns that we use with the USING or
-- clause or NATURAL JOIN.
SELECT first_name, last_name, department_name, departments.manager_id
FROM employees e JOIN departments
USING(manager_id);

SELECT first_name, last_name, department_name, departments.manager_id
FROM employees e JOIN departments
USING(e.manager_id);


-- Inner Join
SELECT e.first_name, e.last_name, d.manager_id, d.department_name
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id AND e.manager_id = d.manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id AND e.employee_id = d.manager_id);

SELECT e.first_name, e.last_name, manager_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id, manager_id);
 

-- Multiple Join Operations
SELECT 
    e.first_name, e.last_name, 
    d.department_name, 
    l.city, l.postal_code, l.street_address 
FROM 
    employees e 
    INNER JOIN departments d USING (department_id) 
    INNER JOIN locations l USING (location_id);

-- We can use the USING, ON clauses, or NATURAL JOIN while 
-- joining multiple tables.
SELECT 
    e.first_name, e.last_name, 
    d.department_name, 
    l.city, l.postal_code, l.street_address,
    c.country_id
FROM 
    employees e 
    INNER JOIN departments d ON (e.department_id = d.department_id) 
    INNER JOIN locations l ON (d.location_id = l.location_id)
    INNER JOIN countries c ON (l.country_id = c.country_id); 


-- Restricting Joins
SELECT
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    l.city
FROM 
    employees e
    INNER JOIN departments d ON (e.department_id = d.department_id)
    INNER JOIN locations l ON (d.location_id = l.location_id)
WHERE 
    d.department_id = 100;
    
SELECT
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    l.city
FROM 
    employees e
    INNER JOIN departments d ON (e.department_id = d.department_id)
    INNER JOIN locations l ON (d.location_id = l.location_id)
AND 
    e.job_id = 'IT_PROG';
    

-- Self Join
SELECT 
    worker.first_name, worker.last_name, worker.employee_id, worker.manager_id, 
    manager.employee_id, manager.first_name, manager.last_name,
    worker.salary, manager.salary
FROM 
    employees worker INNER JOIN employees manager
    ON (manager.employee_id = worker.manager_id);

SELECT 
    worker.first_name || ' ' || worker.last_name AS "Employee Name", 
    manager.first_name || ' ' || manager.last_name AS "Manager Name", 
    worker.employee_id, worker.manager_id, manager.employee_id "Manager Employee Id" 
FROM 
    employees worker INNER JOIN employees manager
    ON (worker.manager_id = manager.employee_id);


-- Non-Equijoins (Joining Unequal Tables)
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, e.salary,
       j.min_salary, j.max_salary, j.job_id
FROM employees e INNER JOIN jobs j ON e.salary > j.max_salary
WHERE j.job_id = 'SA_REP';

-- SQL code that is performing a self-join on the "employees" table 
-- to find employees who share the same first name but have different
-- employee IDs.
SELECT e1.employee_id, e1.first_name, e1.last_name
FROM employees e1 INNER JOIN employees e2 
    ON e1.employee_id <> e2.employee_id
    AND e1.first_name = e2.first_name;

SELECT e.first_name, e.last_name, j.job_title, e.salary, 
       j.min_salary, j.max_salary
FROM employees e JOIN jobs j
    ON e.salary BETWEEN j.min_salary AND j.max_salary;
    