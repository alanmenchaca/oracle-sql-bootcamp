-- -- USING SUBQUERIES - PART 1
SELECT first_name, last_name, salary FROM employees 
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 145);

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id = (SELECT department_id
                       FROM employees
                       WHERE first_name = 'Douglas');
        
        
-- Single-Row Subqueries
SELECT first_name, last_name, salary 
FROM employees
WHERE department_id = (SELECT department_id 
                       FROM employees 
                       WHERE employee_id = 145) 
AND salary < (SELECT salary 
              FROM employees 
              WHERE employee_id = 145);

-- Group Functions in Single-Row Subqueries
SELECT * FROM employees
WHERE hire_date = (SELECT MIN(hire_date) FROM employees);


-- Multiple Row Subqueries
-- Using the "IN" Operator with Subqueries
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary IN 
                (SELECT MIN(salary) 
                 FROM employees
                 GROUP BY department_id);

-- Using the "ANY" Operator with Subqueries
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > ANY 
                   (SELECT salary 
                   FROM employees 
                   WHERE job_id = 'SA_MAN');

-- Using the "ALL" Operator with Subqueries
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > ALL
                   (SELECT salary 
                   FROM employees 
                   WHERE job_id = 'SA_MAN');


-- Multiple Column Subqueries
-- Non-Pairwise Comparison Subquery
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id IN 
                      (SELECT department_id FROM employees
                       WHERE employee_id IN (103, 105, 110))
AND salary IN 
             (SELECT salary FROM employees
             WHERE employee_id IN (103, 105, 110));

SELECT employee_id, first_name, last_name, department_id, salary
FROM employees 
WHERE salary IN (SELECT MAX(salary) FROM employees
                 GROUP BY department_id);
             
-- Pairwise Comparison Subquery
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN 
            (SELECT department_id, salary FROM employees
            WHERE employee_id IN (103, 105, 110));
            
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees 
WHERE (department_id, salary) IN 
                                (SELECT department_id, MAX(salary) 
                                FROM employees GROUP BY department_id);

SELECT * FROM employees WHERE (job_id, salary) IN 
    (SELECT job_id, max_salary FROM jobs);


-- Using Subqueries as a Table (Inline Views)
SELECT * FROM (SELECT state_province, city, department_id, department_name
              FROM departments JOIN locations USING (location_id));

SELECT * FROM (SELECT department_id, department_name , state_province, city
              FROM departments JOIN locations
              USING (location_id)
              ORDER BY department_id);

SELECT e.employee_id, e.first_name, e.last_name, 
       b.department_name, b.city, b.state_prov ince
FROM employees e INNER JOIN(
              SELECT department_id, department_name , state_province, city
              FROM departments JOIN locations
              USING (location_id)
              ORDER BY department_id) b
USING (department_id);
