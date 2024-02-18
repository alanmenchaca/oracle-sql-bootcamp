-- Older Join Syntax (Non-ANSI Standard)
-- ANSI Standard Syntax
-- Inner Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id);

-- Left Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON (e.department_id = d.department_id);

-- Right Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
    ON (e.department_id = d.department_id);

-- Full Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);


-- Non-ANSI Standard Syntax
-- Inner Join
-- In this type of joins the order of the tables is not important.
SELECT e.first_name, e.last_name, 
       d.department_name, 
       l.city, l.street_adress
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND d.department_name = 'Finance';

-- Left Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- Right Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

-- Full Outer Join
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id
UNION
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

----------------------------------------------------------

-- ANSI Standard Syntax 
 SELECT e.first_name, e.last_name, 
        d.department_name, d.department_id,
        l.location_id
FROM employees e
    RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id)
    RIGHT OUTER JOIN locations l ON (d.location_id = l.location_id);
    
SELECT e.first_name, e.last_name,
       d.department_name, j.job_title
FROM employees e 
    RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id)
    RIGHT OUTER JOIN jobs j ON (e.job_id = j.job_id);

SELECT d.department_name, e.first_name, e.department_id, 
       d.department_id, e.salary
FROM departments d LEFT OUTER JOIN employees e 
    ON (d.department_id = e.department_id) AND e.salary > 5000
WHERE d.department_id >= 40
ORDER BY d.department_name, e.first_name;


-- Non-ANSI Standard Syntax    
 SELECT e.first_name, e.last_name, 
        d.department_name, d.department_id,
        l.location_id
FROM employees e, departments d, locations l
WHERE e.department_id(+) = d.department_id
AND d.location_id(+) = l.location_id;
    
-- Unexpected result with multiple RIGHT OUTER JOINS
SELECT e.first_name, e.last_name,
       d.department_name, 
       j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id(+) = d.department_id
AND e.job_id(+) = j.job_id;

-- Correct way to do RIGHT OUTER JOINS with old join syntax
SELECT ed.first_name, ed.last_name,
       ed.department_name, 
       j.job_title
FROM (
    SELECT e.first_name, e.last_name, e.job_id, d.department_name
    FROM employees e, departments d
    WHERE e.department_id(+) = d.department_id
) ed, jobs j
WHERE ed.job_id(+) = j.job_id;
